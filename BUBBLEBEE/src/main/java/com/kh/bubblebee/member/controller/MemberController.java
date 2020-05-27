package com.kh.bubblebee.member.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bubblebee.member.model.exception.MemberException;
import com.kh.bubblebee.member.model.service.KakaoAPI;
import com.kh.bubblebee.member.model.service.MemberService;
import com.kh.bubblebee.member.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class MemberController {

	@Autowired
	private MemberService mService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private KakaoAPI kakao;
	
	@RequestMapping("loginView.me")
	public String enrollView() {
		return "login";
	}
	
	@RequestMapping("emailLoginView.me")
	public String emailLoginView() {
		return "emailLogin";
	}
	
	@RequestMapping("findPwdView.me")
	public String findPwdView() {
		return "findPwd";
	}
	
	@RequestMapping("signUpView.me")
	public String signUpView() {
		return "signUp";
	}
	
	@RequestMapping(value="/callback.me")
	public String navLogin(HttpServletRequest resquest) throws Exception{
		return "callback";
	}
	
	@RequestMapping("naver.me")
	public ModelAndView naverLogin(HttpServletRequest request, HttpSession session, HttpServletResponse response, ModelAndView mv) {
		session = request.getSession();
		
        String token = (String)session.getAttribute("access_token");// 네이버 로그인 접근 토큰;
        String header = "Bearer " + token; // Bearer 다음에 공백 추가
        try {
            String apiURL = "https://openapi.naver.com/v1/nid/me";
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("Authorization", header);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer res = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
            	res.append(inputLine);
            }
            br.close();
            
            JSONParser parser = new JSONParser();
            JSONObject result = (JSONObject)parser.parse(res.toString());
            System.out.println(result);
            // 이름, 프로필, 이메일
            String id = (String)((JSONObject)result.get("response")).get("id");
            String email = (String)((JSONObject)result.get("response")).get("email");         
            String nickName = (String)((JSONObject)result.get("response")).get("name");
            String profileImage = (String)((JSONObject)result.get("response")).get("profile_image");
            
            System.out.println("\nid : " +id);
            System.out.println("email : " + email);
            System.out.println("name : " + nickName);
            System.out.println("profileImage : " +profileImage);
            Member loginUser = mService.checkMember(id);
            if(loginUser != null) {
    			session.setAttribute("loginUser", loginUser);
    			session.setMaxInactiveInterval(6000);
    			mv.setViewName("redirect:home.do");
            } else {
            	Member member = new Member(id, nickName, profileImage, email);
            	
            	int signupResult = mService.signupMember(member);
            	
            	if(signupResult  > 0) {
            		loginUser = mService.checkMember(id);
            		session.setAttribute("loginUser", loginUser);
        			session.setMaxInactiveInterval(6000);
        			mv.setViewName("redirect:home.do");
            	} else {
            		throw new MemberException("소셜로그인 회원가입 실패하였습니다.");
            	}
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return mv;
	}
	
	@RequestMapping("logout.me")
	public String loggout(SessionStatus status) {
		status.setComplete();
		
		return "redirect:home.do";
	}
	
	@RequestMapping(value="login.me", method=RequestMethod.POST)
	public String memberLogin(Member m, Model model) {
		Member loginUser = mService.memberLogin(m);
		
		if(bcryptPasswordEncoder.matches(m.getPwd(), loginUser.getPwd())) {
			model.addAttribute("loginUser", loginUser);
			return "redirect:home.do";
		} else {
			throw new MemberException("로그인에 실패하였습니다.");
		}	
	}
	
	@RequestMapping("minsert.me")
	public String memberInsert(@ModelAttribute Member m) {
		
		// bcrypt 암호화 방식
		String encPwd = bcryptPasswordEncoder.encode(m.getPwd());
		System.out.println("1: " +encPwd);
		m.setPwd(encPwd);
		
		int result = mService.insertMember(m);
		System.out.println(result); 
		if(result > 0) {
			return "redirect:home.do";
		} else {
			throw new MemberException("회원가입에 실패하였습니다.");
		}
	}
	
	@RequestMapping("kakao.me")
	public String kakaoLogin(@RequestParam("code") String code, HttpSession session) {
//		System.out.println("code : " + code);
		String access_Token = kakao.getAccessToken(code);
//		System.out.println("controller access_token : " + access_Token); 
		HashMap<String, String> userInfo = kakao.getUserInfo(access_Token);
		System.out.println("login Controller : " + userInfo);
		
		int result = mService.insertkakaoMember(userInfo);
		
		if(userInfo.get("id") != null) {
			session.setAttribute("userId", userInfo.get("id"));
			session.setAttribute("access_Token", access_Token);
		}
		return "../home";
	}
	
	@RequestMapping("kakaologout.me")
	public String logout(HttpSession session) {
		kakao.kakaoLogout((String)session.getAttribute("access_Token"));
		session.removeAttribute("access_Token");
		session.removeAttribute("userId");
		
		return "index";
	}
	
}

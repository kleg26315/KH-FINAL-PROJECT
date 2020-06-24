package com.kh.bubblebee.member.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bubblebee.board.model.vo.Board;
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
            
            int point = 0;
            Member loginUser = mService.checkMember(id);
            if(loginUser != null) {
    			session.setAttribute("loginUser", loginUser);
    			session.setMaxInactiveInterval(6000);
    			// 포인트 조회
    			point = mService.getPoint(loginUser.getId());
    			session.setAttribute("point", point);
    			// 장바구니 조회
    			ArrayList<Board> slist = mService.getSlist(loginUser.getId());
    			session.setAttribute("slist", slist);
    			// 좋아요 조회
    			ArrayList<Board> hlist = mService.getHlist(loginUser.getId());
    			session.setAttribute("hlist", hlist);
    			
    			mv.setViewName("redirect:home.do");
            } else {
            	Member member = new Member(id, nickName, profileImage, email);
            	
            	int signupResult = mService.signupMember(member);
            	int setPointResult = mService.setPoint(member.getId());
            	
            	if(signupResult  > 0) {
            		if(setPointResult > 0) {
            			loginUser = mService.checkMember(id);
            			point = mService.getPoint(member.getId());
                		session.setAttribute("loginUser", loginUser);
            			session.setMaxInactiveInterval(6000);
            			session.setAttribute("point", point);
            			// 장바구니 조회
            			ArrayList<Board> slist = mService.getSlist(loginUser.getId());
            			session.setAttribute("slist", slist);
            			// 좋아요 조회
            			ArrayList<Board> hlist = mService.getHlist(loginUser.getId());
            			session.setAttribute("hlist", hlist);
            			mv.setViewName("redirect:home.do");
            		} else {
                		throw new MemberException("소셜로그인 회원가입 실패하였습니다.");
                	}
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
	public String memberLogin(Member m, HttpServletRequest request, HttpSession session, Model model) {
		Member loginUser = mService.memberLogin(m);
		session = request.getSession();
		
		if(bcryptPasswordEncoder.matches(m.getPwd(), loginUser.getPwd())) {
			model.addAttribute("loginUser", loginUser);
			int point = mService.getPoint(m.getId());
			session.setAttribute("point", point);
			// 장바구니 조회
			ArrayList<Board> slist = mService.getSlist(m.getId());
			session.setAttribute("slist", slist);
			// 좋아요 조회
			ArrayList<Board> hlist = mService.getHlist(m.getId());
			session.setAttribute("hlist", hlist);
			return "redirect:home.do";
		} else {
			throw new MemberException("로그인에 실패하였습니다.");
		}	
	}
	
	@RequestMapping("minsert.me")
	public String memberInsert(@ModelAttribute Member m, HttpServletRequest request, HttpSession session, Model model) {
		
		// bcrypt 암호화 방식
		String encPwd = bcryptPasswordEncoder.encode(m.getPwd());
		System.out.println("1: " +encPwd);
		m.setPwd(encPwd);
		
		int result = mService.insertMember(m);
		int setPointResult = mService.setPoint(m.getId());
		System.out.println(result); 
		if(result > 0) {
			if(setPointResult > 0) {
				Member loginUser = mService.memberLogin(m);
				model.addAttribute("loginUser", loginUser);
				int point = mService.getPoint(m.getId());
				session.setAttribute("point", point);
				// 장바구니 조회
				ArrayList<Board> slist = mService.getSlist(m.getId());
				session.setAttribute("slist", slist);
				// 좋아요 조회
				ArrayList<Board> hlist = mService.getHlist(m.getId());
				session.setAttribute("hlist", hlist);
				return "redirect:home.do";
			} else {
				throw new MemberException("회원가입에 실패하였습니다.");
			}
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
//		System.out.println("login Controller : " + userInfo);
		String id = userInfo.get("id");
		Member loginUser = mService.checkMember(id);
		int result = 0;
		int point = 0;
		if(loginUser != null) {
			session.setAttribute("loginUser", loginUser);
			session.setMaxInactiveInterval(6000);
			point = mService.getPoint(loginUser.getId());
			session.setAttribute("point", point);
			// 장바구니 조회
			ArrayList<Board> slist = mService.getSlist(loginUser.getId());
			session.setAttribute("slist", slist);
			// 좋아요 조회
			ArrayList<Board> hlist = mService.getHlist(loginUser.getId());
			session.setAttribute("hlist", hlist);
			return "redirect:home.do";
		} else {
			result = mService.insertkakaoMember(userInfo);
			loginUser = mService.checkMember(id);
			int setPointResult = mService.setPoint(loginUser.getId());
			if(result > 0) {
				if(setPointResult > 0) {
					session.setAttribute("loginUser", loginUser);
					session.setMaxInactiveInterval(6000);
					point = mService.getPoint(loginUser.getId());
					session.setAttribute("point", point);
					// 장바구니 조회
					ArrayList<Board> slist = mService.getSlist(loginUser.getId());
					session.setAttribute("slist", slist);
					// 좋아요 조회
					ArrayList<Board> hlist = mService.getHlist(loginUser.getId());
					session.setAttribute("hlist", hlist);
					return "redirect:home.do";
				} else {
					throw new MemberException("카카오톡 회원가입에 실패하였습니다.");
				}
			} else {
				throw new MemberException("카카오톡 회원가입에 실패하였습니다.");
			}
		}
	}
	// 비밀번호 수정
	@RequestMapping(value="memberPwdupdate.me",method=RequestMethod.POST)
	public String memberPwdupdate(@RequestParam("pwd") String pwd,@RequestParam("newpwd") String newPwd,HttpSession session) {
		Member m = mService.memberLogin((Member)session.getAttribute("loginUser"));
		
		if(bcryptPasswordEncoder.matches(pwd, m.getPwd())) {
			String encPwd = bcryptPasswordEncoder.encode(newPwd);
			
			HashMap<String, String> map = new HashMap<>();
			map.put("id", m.getId());
			map.put("newpwd",encPwd);
			
			int result = mService.memberPwdUpdate(map);
			
			if(result > 0) {
				return "redirect:updateInfoForm.mg";
			}else {
				throw new MemberException("비밀번호 수정 실패");
			}
			
		}else {
			throw new MemberException("비밀번호 수정 실패");
		}
	}
	
	@RequestMapping("loginCheck.me")
	@ResponseBody
	public String loginCheck(@RequestParam("email") String email, @RequestParam("pwd") String pwd) {
		Member m = mService.loginCheck(email);

		if(m != null) {
			if(bcryptPasswordEncoder.matches(pwd, m.getPwd())) {
				return "success";
			} else {
				return "fail";
			}
		} else {
			return "fail";
		}
	}
	
	@RequestMapping("emailSameCheck.me")
	@ResponseBody
	public String emailSameCheck(@RequestParam("id") String id) {
		Member m = mService.emailSameCheck(id);

		if(m != null) {
			return "fail";
		} else {
			return "success";
		}
	}
	
	@RequestMapping(value="emailSendPage.me" ,method=RequestMethod.POST)
	public String emailSendPage(@RequestParam("email") String email) {
		String host = "smtp.naver.com";
		String user = "kleg26315@naver.com";
		String password = "12rnstn!!";
		
		String to_email = email;
		
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", 465);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.starttls.enable", "true");
		
		StringBuffer temp = new StringBuffer();
		Random rnd = new Random();
		for(int i=0; i<10; i++) {
			int rIndex = rnd.nextInt(3);
			switch(rIndex) {
			case 0:
				temp.append((char) ((int) (rnd.nextInt(26)) + 97));
				break;
			case 1:
				temp.append((char) ((int) (rnd.nextInt(26)) + 65));
				break;
			case 2:
				temp.append((rnd.nextInt(10)));
				break;
			}
		}
		
		String AuthenticationKey = temp.toString();
		
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});
		
		try {
			MimeMessage msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(user, "BUBBLEBEE"));
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));
			
			msg.setSubject("[BUBBLEBEE] 임시 비밀번호 발급 메일입니다.	");
			
			msg.setText("임시 비밀번호 : " +temp);
			
			Transport.send(msg);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		String encPwd = bcryptPasswordEncoder.encode(AuthenticationKey);
		
		HashMap<String, String> map = new HashMap<>();
		map.put("id", email);
		map.put("newpwd",encPwd);
		
		int result = mService.memberPwdUpdate(map);
		
		if(result > 0) {
			return "emailSend";			
		} else {
			throw new MemberException("임시 비밀번호 발급에 실패하였습니다.");
		}
	}
	
	@RequestMapping("prePwdCheck.me")
	@ResponseBody
	public String prePwdCheck(@RequestParam("id") String id, @RequestParam("pwd") String pwd) {
		Member m = mService.emailSameCheck(id);
		
		if(bcryptPasswordEncoder.matches(pwd, m.getPwd())) {
			return "success";
		} else {
			return "fail";
		}
	}
}

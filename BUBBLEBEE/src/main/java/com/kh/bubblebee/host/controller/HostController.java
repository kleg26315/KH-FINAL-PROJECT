package com.kh.bubblebee.host.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.bubblebee.host.model.exception.HostException;
import com.kh.bubblebee.host.model.service.HostService;
import com.kh.bubblebee.host.model.vo.Host;
import com.kh.bubblebee.member.model.service.MemberService;
import com.kh.bubblebee.member.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class HostController {
	
	@Autowired
	private HostService hService;
	
	@Autowired
	private MemberService mService;
	
	// 호스트페이지로 이동 
	@RequestMapping("hostpage.ho")
	public String hostpageView() {
		return "hostpage_main";
	}
	
	// 호스트 등록하기
	@RequestMapping("enrollHost.ho")
	public String enrollHost(@ModelAttribute Host h,@ModelAttribute Member m,Model model) {
		
		System.out.println(m.getId());
		System.out.println(m.getUserName());
		System.out.println(m.getEmail());
		System.out.println(m.getNickName());
		System.out.println(m.getPhone());
		
		System.out.println(h.getIntroduction());
		System.out.println(h.getAc_bname());
		System.out.println(h.getAc_name());
		System.out.println(h.getAc_no());
		
		// 이름, 닉네임, 이메일 , 전화번호 ,host_yn update
		int result1 = hService.updateMemberInfo(m);
		
		int result2 = 0;
		
		if(result1 > 0) {
			// 호스트에  추가하기
			result2 = hService.enrollHost(h);
			
			if(result2 > 0) {
				Member loginUser = mService.memberLogin(m);
				model.addAttribute("loginUser", loginUser);
				return "hostpage_main";
			}else {
				throw new HostException("호스트 등록에 실패하였습니다.");
			}
			
		}else {
			throw new HostException("호스트 등록에 실패하였습니다.");
		}
				
	}
}

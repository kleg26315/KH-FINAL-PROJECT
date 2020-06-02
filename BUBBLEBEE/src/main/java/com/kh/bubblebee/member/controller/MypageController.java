package com.kh.bubblebee.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.bubblebee.member.model.exception.MemberException;
import com.kh.bubblebee.member.model.service.MypageService;
import com.kh.bubblebee.member.model.vo.Member;

@Controller
public class MypageController {
	
	@Autowired
	private MypageService mgService;
	
	//좋아요(모임)
	@RequestMapping("mylike.mg")
	public String mylikemeet() {
		return "mylikemeet";
	}
	
	//좋아요(클래스)
	@RequestMapping("mylikeclass.mg")
	public String mylikeclass() {
		return "mylikeclass";
	}
	//좋아요(호스트)
	@RequestMapping("mylikehost.mg")
	public String mylikehost() {
		return "mylikehost";
	}
	//참여 모임/클래스
	@RequestMapping("mymeet.mg")
	public String myclass() {
		return "myreserved";
	}
	//장바구니
	@RequestMapping("myslist.mg")
	public String myslist() {
		return "myslist";
	}
	//결제내역
	@RequestMapping("mypaid.mg")
	public String mypaid() {
		return "mypaid";
	}
	//마일리지
	@RequestMapping("mypoint.mg")
	public String mypoint() {
		return "mypoint";
	}
	// 내정보 수정페이지로 이동
	@RequestMapping("updateInfoForm.mg")
	public String updateInfoView() {
		return "updateInfoForm";
	}
	
	// 내 정보 수정하기
	
	@RequestMapping("updateInfo.mg")
	public String updateInfo(@ModelAttribute Member m,@RequestParam("interest") String interest) {
//		m.setInterest(interest);
		
//		int result = mgService.updateInfo(m);
//		
//		if(result > 0) {
//			return "";
//		}else {
//			throw new MemberException();
//		}
		
		return "";
	}
	
	
	
	// 후기
	@RequestMapping("myreview.mg")
	public String myreview() {
		return "myreview";
	}
	// 비밀번호 업데이트form
	@RequestMapping("updatePwdForm.mg")
	public String updatePwd() {
		return "updatePwdForm";
	}
	
	// 호스트 등록
	@RequestMapping("hostenrollForm.mg")
	public String hostenrollForm() {
		return "hostenrollForm";
	}
}

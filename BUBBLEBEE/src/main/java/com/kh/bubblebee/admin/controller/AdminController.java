package com.kh.bubblebee.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bubblebee.account.model.service.AccountService;
import com.kh.bubblebee.account.model.vo.Account;
import com.kh.bubblebee.common.PageInfo;
import com.kh.bubblebee.notice.model.exception.NoticeException;
import com.kh.bubblebee.notice.model.vo.Pagination2;

@Controller
public class AdminController {
	
	@Autowired
	private AccountService acService;
	
	@RequestMapping("account.ad")
	public ModelAndView accountPageView(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = acService.getAccountListCount();
		
		PageInfo pi = Pagination2.getPageInfo(currentPage, listCount);
		
		ArrayList<Account> list = acService.selectAccountList(pi);
		
		ArrayList<Account> AllList = acService.selectAllAccountList();
		
		if(list != null) {
			// list, pi, view
			mv.addObject("list", list);
			mv.addObject("AllList", AllList);
			mv.addObject("pi", pi);
			mv.setViewName("adminPage_account");
		} else {
			throw new NoticeException("정산관리 페이지 로드에 실패했습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("class.ad")
	public String classPageView() {
		return "adminPage_class";
	}
	
	@RequestMapping(value="noticeInsertView.ad")
	public String noticeInsertView(@RequestParam(value="message", required=false) String message, Model model) {
		return "adminPage_notice_form";
	}
	
	@RequestMapping("FAQInsertView.ad")
	public String FAQInsertView() {
		return "adminPage_FAQ_form";
	}
	
	@RequestMapping("agreeAccount.ad")
	public String agreeAccount(@RequestParam(value="acno") String acno) {
		int result = acService.agreeAccount(acno);
		
		if(result > 0) {
			return "redirect:account.ad";
		} else {
			throw new NoticeException("정산승인 처리에 실패했습니다.");
		}
	}
}

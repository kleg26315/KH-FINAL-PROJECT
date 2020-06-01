package com.kh.bubblebee.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	
	@RequestMapping("adminPageView.ad")
	public String adminPageView() {
		return "adminPage";
	}
	
	@RequestMapping("account.ad")
	public String accountPageView() {
		return "adminPage_account";
	}
	
	@RequestMapping("class.ad")
	public String classPageView() {
		return "adminPage_class";
	}
	
	@RequestMapping("noticeInsertView.ad")
	public String noticeInsertView() {
		return "adminPage_notice_form";
	}
	
	@RequestMapping("FAQInsertView.ad")
	public String FAQInsertView() {
		return "adminPage_FAQ_form";
	}
}

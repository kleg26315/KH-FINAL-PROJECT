package com.kh.bubblebee.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AdminController {
	
	@RequestMapping("adminPageView.ad")
	public String adminPageView() {
		return "adminPage_account";
	}
	
	@RequestMapping("account.ad")
	public String accountPageView() {
		return "adminPage_account";
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
}

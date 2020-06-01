package com.kh.bubblebee.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	
	@RequestMapping("adminPageView.ad")
	public String adminPageView() {
		return "adminPage";
	}
}

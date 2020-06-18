package com.kh.bubblebee.alert.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AlertController {
	
	@RequestMapping("alertCheck.do")
	public String alertView(HttpSession session) {
		return "alertTest";
	}
}

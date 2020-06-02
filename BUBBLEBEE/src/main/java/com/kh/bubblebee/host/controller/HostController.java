package com.kh.bubblebee.host.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HostController {
	
	@RequestMapping("hostpage.ho")
	public String hostpageView() {
		return "hostpage_main";
	}
	@RequestMapping("binsertForm.ho")
	public String binsertForm() {
		return "";
	}
}

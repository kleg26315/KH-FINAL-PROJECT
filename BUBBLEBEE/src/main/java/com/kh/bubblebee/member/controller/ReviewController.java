package com.kh.bubblebee.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReviewController {
	
	@RequestMapping("reviewInsertForm.mg")
	public String reviewInsertForm() {
		return "myreviewWrite";
	}
	
	@RequestMapping("reviewInsert.mg")
	public String reviewInsert() {
		return "myreview";
	}

}

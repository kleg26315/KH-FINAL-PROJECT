package com.kh.bubblebee.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.bubblebee.board.model.service.BoardService;

@Controller
public class BoardFindController {
	
	@Autowired
	private BoardService bService;
	
	@RequestMapping("find.bo")
	public String find(@RequestParam(value="page", required=false) Integer page, @RequestParam("search") String search) {
		return "findSearch";
	}
}

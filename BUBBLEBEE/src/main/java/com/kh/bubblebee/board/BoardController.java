package com.kh.bubblebee.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	
	@RequestMapping("mlist.bo")
	public String moimList() {
		System.out.println("도달성공");
		return "listView_moim";
	}
	

}

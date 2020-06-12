package com.kh.bubblebee.board.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bubblebee.board.model.exception.BoardException;
import com.kh.bubblebee.board.model.service.BoardService;
import com.kh.bubblebee.board.model.vo.Board;

@Controller
public class BoardFindController {
	
	@Autowired
	private BoardService bService;
	
	@RequestMapping("find.bo")
	public ModelAndView find(@RequestParam(value="page", required=false) Integer page, @RequestParam("search") String search, ModelAndView mv) {
		
		ArrayList<Board> list = bService.selectFindList(search);
		int searchCount = bService.getFindListCount(search);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("search", search);
			mv.addObject("searchCount", searchCount);
			mv.setViewName("findSearch");
		} else {
			throw new BoardException("검색 조회에 실패했습니다.");
		}
		
		return mv;
	}
}

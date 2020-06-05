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
import com.kh.bubblebee.board.model.vo.Review;
import com.kh.bubblebee.common.PageInfo;
import com.kh.bubblebee.common.Pagination;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService bService;
	
	@RequestMapping("list.bo")
	public ModelAndView moimList(@RequestParam(value="cate") String cate, ModelAndView mv) {
		//인기불러오기
		ArrayList<Board> htlist = bService.selectHtList(cate);
		
		//최신불러오기
		ArrayList<Board> ltlist = bService.selectLtList(cate);
		
		if(ltlist != null && htlist != null) {
			mv.addObject("cate", cate);
			mv.addObject("ltlist", ltlist);
			mv.addObject("htlist", htlist);
			mv.setViewName("listView");
			
		} else {
			throw new BoardException("게시글 전체 조회에 실패했습니다.");
		}
		
		return mv;
		
	}
	
	@RequestMapping("allList.bo")
	public ModelAndView allList(@RequestParam(value="page", required=false) Integer page, @RequestParam(value="cate") String cate, ModelAndView mv) {
		
		int currentPage = 1;
		if(page!=null) {
			currentPage = page;
		}
		
		int listCount = bService.getListCount(cate);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Board> list = bService.selectList(pi, cate);
				
		if(list != null) {
			mv.addObject("cate", cate);
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("listView_all");
			
		} else {
			throw new BoardException("게시글 전체 조회에 실패했습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("detail.bo")
	public String detailView(@RequestParam("fno") int fno, @RequestParam("page") int page) {
		return "boardDetail";
	}

}

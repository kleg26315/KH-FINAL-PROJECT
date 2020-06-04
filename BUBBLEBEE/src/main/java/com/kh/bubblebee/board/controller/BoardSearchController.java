package com.kh.bubblebee.board.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bubblebee.board.model.exception.BoardException;
import com.kh.bubblebee.board.model.service.BoardService;
import com.kh.bubblebee.board.model.vo.Board;
import com.kh.bubblebee.board.model.vo.SearchCondition;
import com.kh.bubblebee.common.PageInfo;
import com.kh.bubblebee.common.Pagination;

public class BoardSearchController {
	
	@Autowired
	private BoardService bService;
	
	@RequestMapping("search.bo")
	public ModelAndView searchAll(@RequestParam(value="page", required=false) Integer page, @RequestParam(value="cate") String cate, @RequestParam(value="a", required=false) String a, @RequestParam(value="startPrice") int startPrice, @RequestParam(value="endPrice") int endPrice, ModelAndView mv) {
		
		SearchCondition sc = new SearchCondition();
		
		if(startPrice == 0) {
			sc.setStartPrice(0);
		} else if(startPrice != 0) {
			sc.setStartPrice(startPrice);
		} else if(endPrice != 0) {
			sc.setEndPrice(endPrice);
		} else if(a!=null) {
			if(a.equals("popular")) {
				sc.setPopular(a);
			} else if(a.equals("latest")) {
				sc.setLatest(a);
			} else if(a.equals("rate")) {
				sc.setRate(a);
			} else if(a.equals("highprice")) {
				sc.setHighprice(a);
			} else if(a.equals("lowprice")) {
				sc.setLowprice(a);
			}
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("cate", cate);
		map.put("sc", sc);
		
		int currentPage = 1;
		if(page!=null) {
			currentPage = page;
		}
	
		int listCount = bService.getSearchListCount(map);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Board> list = bService.selectSearchList(map, pi);
		
		
		if(list != null) {
			mv.addObject("cate", cate);
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.addObject("a", a);
			mv.addObject("startPrice", startPrice);
			mv.addObject("endPrice", endPrice);
			mv.setViewName("listView_search");
			
		} else {
			throw new BoardException("필터 조회에 실패했습니다.");
		}
		
		return mv;
	}

}

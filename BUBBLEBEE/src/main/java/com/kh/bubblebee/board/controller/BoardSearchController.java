package com.kh.bubblebee.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bubblebee.board.model.service.BoardService;
import com.kh.bubblebee.board.model.vo.SearchCondition;

public class BoardSearchController {
	
	@Autowired
	private BoardService bService;
	
	@RequestMapping("search.bo")
	public ModelAndView searchAll(@RequestParam(value="a") String a, @RequestParam(value="startPrice") int startPrice, @RequestParam(value="endPrice") int endPrice, ModelAndView mv) {
		
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
		
		
		return mv;
	}

}

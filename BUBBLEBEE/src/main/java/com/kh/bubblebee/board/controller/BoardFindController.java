package com.kh.bubblebee.board.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bubblebee.board.model.exception.BoardException;
import com.kh.bubblebee.board.model.service.BoardService;
import com.kh.bubblebee.board.model.vo.Board;
import com.kh.bubblebee.board.model.vo.SearchCondition;
import com.kh.bubblebee.common.PageInfo;
import com.kh.bubblebee.common.Pagination;
import com.kh.bubblebee.member.model.vo.Member;

@Controller
public class BoardFindController {
	
	@Autowired
	private BoardService bService;
	
	@RequestMapping("find.bo")
	public ModelAndView find(@RequestParam(value="page", required=false) Integer page, @RequestParam("search") String search, ModelAndView mv, HttpServletRequest request) {
		HttpSession session = request.getSession();
	    Member m = (Member) session.getAttribute("loginUser");
		
		ArrayList<Board> list = bService.selectFindList(search);
		int searchCount = bService.getFindListCount(search);
		
		ArrayList<Integer> heartList = new ArrayList<>();
		ArrayList<Board> wlist = bService.selectwFindFilterList(search);
		if(m!=null) {
			heartList = bService.selectHeartList(m.getId());
		} else {
			heartList = null;
		}
				
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("search", search);
			mv.addObject("searchCount", searchCount);
			mv.addObject("heartList", heartList);
			mv.addObject("wlist", wlist);
			mv.setViewName("findSearch");
		} else {
			throw new BoardException("검색 조회에 실패했습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("findFilter.bo")
	public ModelAndView searchAll(HttpServletRequest request, @RequestParam(value="ad1", required=false) String ad1, @RequestParam(value="ad2", required=false) String ad2, @RequestParam(value="page", required=false) Integer page, @RequestParam(value="search") String search, @RequestParam(value="a", required=false) String a, @RequestParam(value="startPrice", required=false) int startPrice, @RequestParam(value="endPrice", required=false) int endPrice, ModelAndView mv) {
		HttpSession session = request.getSession();
	    Member m = (Member) session.getAttribute("loginUser");
		String id = null;
		if(m!=null) {
			id = m.getId();
		}
		
		SearchCondition sc = new SearchCondition();
		
		if(startPrice>=10000) {
			String sps = Integer.toString(startPrice);
			sps=sps.substring(0, sps.length()-4);
			endPrice = Integer.parseInt(sps);
		}
		
		if(endPrice>=10000) {
			String eps = Integer.toString(endPrice);
			eps=eps.substring(0, eps.length()-4);
			endPrice = Integer.parseInt(eps);
		}
		
		String sp = startPrice+"0000";
		String ep = endPrice+"0000";
		startPrice = Integer.parseInt(sp);
		endPrice = Integer.parseInt(ep);
		
		if(startPrice == 0 && a!= null) {
			sc.setStartPrice(0);
			sc.setEndPrice(endPrice);
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
		} else if(startPrice != 0 && a!= null) {
			sc.setStartPrice(startPrice);
			sc.setEndPrice(endPrice);
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
		} else if(startPrice == 0 && ad2!= null) {
			sc.setStartPrice(0);
			sc.setEndPrice(endPrice);
		} else if(startPrice != 0 && ad2!= null) {
			sc.setStartPrice(startPrice);
			sc.setEndPrice(endPrice);
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("sc", sc);
		map.put("ad1", ad1);
		map.put("ad2", ad2);
		map.put("id", id);
		
		int currentPage = 1;
		if(page!=null) {
			currentPage = page;
		}
	
		int listCount = bService.getFindFilterListCount(map);
		/* PageInfo pi = Pagination.getPageInfo(currentPage, listCount); */
		
		ArrayList<Board> list = bService.selectFindFilterList(map);
		
		
		//어디서
		ArrayList<Board> wlist = bService.selectwFindFilterList(search);	
		if(list != null) {
			mv.addObject("search", search);
			mv.addObject("list", list);
			mv.addObject("wlist", wlist);
			mv.addObject("ad1", ad1);
			mv.addObject("ad3", ad2);
			/* mv.addObject("pi", pi); */
			mv.addObject("a", a);
			mv.addObject("startPrice", startPrice);
			mv.addObject("endPrice", endPrice);
			mv.addObject("searchCount", listCount);
			mv.setViewName("listView_findSearch");
			
		} else {
			throw new BoardException("필터 조회에 실패했습니다.");
		}
		
		return mv;
	}
}

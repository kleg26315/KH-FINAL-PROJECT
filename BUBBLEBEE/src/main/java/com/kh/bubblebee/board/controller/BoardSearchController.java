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
public class BoardSearchController {
	
	@Autowired
	private BoardService bService;
	
	@RequestMapping("search.bo")
	public ModelAndView searchAll(HttpServletRequest request, @RequestParam(value="ad1", required=false) String ad1, @RequestParam(value="ad2", required=false) String ad2, @RequestParam(value="page", required=false) Integer page, @RequestParam(value="cate") String cate, @RequestParam(value="a", required=false) String a, @RequestParam(value="startPrice", required=false) int startPrice, @RequestParam(value="endPrice", required=false) int endPrice, ModelAndView mv) {
		HttpSession session = request.getSession();
	    Member m = (Member) session.getAttribute("loginUser");
		String id = null;
		if(m!=null) {
			id = m.getId();
		}
		
		SearchCondition sc = new SearchCondition();
		
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
		map.put("cate", cate);
		map.put("sc", sc);
		map.put("ad1", ad1);
		map.put("ad2", ad2);
		map.put("id", id);
		
//		System.out.println("ad2"+ad2);
//		System.out.println("map"+map);
				
		int currentPage = 1;
		if(page!=null) {
			currentPage = page;
		}
	
		int listCount = bService.getSearchListCount(map);
//		System.out.println(listCount);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Board> list = bService.selectSearchList(map, pi);
		
//		System.out.println("map"+map+"slist"+list);
		
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
	
//	@RequestMapping("wsearch.bo")
//	public ModelAndView wsearch(@RequestParam(value="page", required=false) Integer page, @RequestParam(value="ad2", required=false) String ad2, @RequestParam(value="cate") String cate, ModelAndView mv)  {
//		
//		HashMap<String, String> map = new HashMap<String, String>();
//		map.put("cate", cate);
//		map.put("ad2", ad2);
//		
//		int currentPage = 1;
//		if(page!=null) {
//			currentPage = page;
//		}
//	
//		int listCount = bService.getwSearchListCount(map);
//		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
//		
//		ArrayList<Board> list = bService.selectwSearchList(map, pi);
//		
//		if(list != null) {
//			mv.addObject("cate", cate);
//			mv.addObject("list", list);
//			mv.addObject("pi", pi);
//			mv.setViewName("listView_search");
//			
//		} else {
//			throw new BoardException("어디서 조회에 실패했습니다.");
//		}
//		
//		return mv;
//	}

}

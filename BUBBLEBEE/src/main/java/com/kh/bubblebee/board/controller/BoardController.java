package com.kh.bubblebee.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.bubblebee.board.model.exception.BoardException;
import com.kh.bubblebee.board.model.service.BoardService;
import com.kh.bubblebee.board.model.vo.Board;
import com.kh.bubblebee.common.PageInfo;
import com.kh.bubblebee.common.Pagination;
import com.kh.bubblebee.host.model.vo.Host;

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
	public ModelAndView detailView(@RequestParam("fno") int fno, @RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		Board b = bService.selectBoard(fno);
		System.out.println("detail.bo의 b : " + b);
		String hostId = b.getUser_id();
		Host host = bService.selectHost(hostId);
		System.out.println("detail.bo의 host : " + host);
		
		if(b != null) {
			mv.addObject("b", b)
			  .addObject("host", host)
			  .setViewName("boardDetail");
			return mv;
		}else {
			throw new BoardException("게시판 상세 조회에 실패하였습니다.");
		}
	}
	
	@RequestMapping("hread.bo")
	public void heartRead(@RequestParam("fno") int fno, @RequestParam("uid") String uid, HttpServletResponse response) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("uid", uid);
		map.put("fno", fno);
		
			
		
			int heart = bService.getHeartCount(map);
			if(heart == 0) {
				heart=0;
//				System.out.println(fno+"번하트"+heart);
			} else {
				heart=1;
//				System.out.println(fno+"번하트"+heart);
			}
			
			try {
				new Gson().toJson(heart, response.getWriter());
			} catch (JsonIOException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		
	}
	
//	@RequestMapping("heart.bo")
//	public void heartInsert(@RequestParam("fno") int fno, @RequestParam("uid") String uid, HttpServletResponse response) {
//		response.setContentType("application/json; charset=UTF-8");
//
//		
//		//좋아요 입력
//		 
//	}
	

}

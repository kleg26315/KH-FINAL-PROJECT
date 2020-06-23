package com.kh.bubblebee.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bubblebee.board.model.vo.Board;
import com.kh.bubblebee.board.model.vo.Review;
import com.kh.bubblebee.common.PageInfo;
import com.kh.bubblebee.common.Pagination;
import com.kh.bubblebee.member.model.service.ReviewService;
import com.kh.bubblebee.member.model.vo.Member;
import com.kh.bubblebee.notice.model.exception.NoticeException;
import com.kh.bubblebee.notice.model.vo.Pagination2;

@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService rService;
	
	// 후기
	@RequestMapping("myreview.mg")
	public ModelAndView myreview(@RequestParam(value="page", required=false) Integer page, ModelAndView mv, HttpSession session) {
		String user_id = ((Member)session.getAttribute("loginUser")).getId();
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = rService.myReviewListCount(user_id);
		PageInfo pi = Pagination2.getPageInfo(currentPage, listCount);
		
//		System.out.println("myrv수:"+listCount);
		
		ArrayList<Review> list = rService.selectMyReviewList(pi, user_id);
//		System.out.println("화면리뷰:"+list);
			
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("myreview");
		
		
		return mv;
	}
	
	// 후기작성폼
	@RequestMapping("reviewInsertForm.mg")
	public ModelAndView reviewInsertForm(@ModelAttribute Review r, ModelAndView mv) {
//		System.out.println("r:"+r);
		
		mv.addObject("review", r);
		mv.setViewName("myreviewWrite");
		
		return mv;
	}
	
	//후기작성
	@RequestMapping("reviewInsert.mg")
	public String reviewInsert(@ModelAttribute Review r, HttpSession session) {
		String user_id = ((Member)session.getAttribute("loginUser")).getId();
		r.setUser_id(user_id);
		
//		System.out.println("rv:"+r);
		
		int result1 = rService.insertReview(r);
		
		if(result1>0) {
//			System.out.println("리뷰입력성공");
		}
		
//		int result2 = bService.insertReviewGrade();
		
		return "myreview";
	}

}

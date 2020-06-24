package com.kh.bubblebee.member.controller;

import java.util.ArrayList;
import java.util.HashMap;

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
import com.kh.bubblebee.member.model.exception.MemberException;
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
	public ModelAndView reviewInsert(@ModelAttribute Review r, HttpSession session, ModelAndView mv) {
		String user_id = ((Member)session.getAttribute("loginUser")).getId();
		r.setUser_id(user_id);
		
//		System.out.println("rv:"+r);

		int result1 = rService.insertReview(r);
		
		int currentPage = 1;
		int listCount = rService.myReviewListCount(user_id);
		PageInfo pi = Pagination2.getPageInfo(currentPage, listCount);
		ArrayList<Review> list = rService.selectMyReviewList(pi, user_id);
		
		if(result1>0) {
			//보드테이블에서 rsum,rcount업데이트
			int result2 = rService.updateReviewGrade(r);
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("myreview");
		} else {
			throw new MemberException("후기 작성에 실패하였습니다.");
		}
		
		return mv;
	}
	
	//후기수정폼
	@RequestMapping("reviewUpdateForm.mg")
	public ModelAndView reviewUpdateForm(@ModelAttribute Review r, @RequestParam("qno") int qno , HttpSession session, ModelAndView mv) {
		
		Review review = rService.selectMyReview(qno);
		
		review.setCategory(r.getCategory());
		review.setRef_fid(r.getRef_fid());
//		review.setOdeadline(r.getOdeadline());
		review.setFtitle(r.getFtitle());
		
		if(review!=null) {
			mv.addObject("review", review);
			mv.setViewName("myreviewUpdate");
		}
		
		return mv;
	}
	
	//후기수정
		@RequestMapping("reviewUpdate.mg")
		public ModelAndView reviewUpdate(@ModelAttribute Review r, @RequestParam("exgrade") Integer exgrade, HttpSession session, ModelAndView mv) {
			String user_id = ((Member)session.getAttribute("loginUser")).getId();
			r.setUser_id(user_id);
			
			System.out.println("수정"+r);
			int result1 = rService.updateReview(r);
			
			int currentPage = 1;
			int listCount = rService.myReviewListCount(user_id);
			PageInfo pi = Pagination2.getPageInfo(currentPage, listCount);
			ArrayList<Review> list = rService.selectMyReviewList(pi, user_id);
			
			if(result1>0) {
				//보드테이블에서 rsum,rcount업데이트
				HashMap<String, Integer> map = new HashMap<String, Integer>();
//				map.put("r", r);
				map.put("ref_fid", r.getRef_fid());
				map.put("exgrade", exgrade);
				int result2 = rService.deleteReviewGrade(map);
				
				int result3 = rService.updateReviewGrade(r);
				mv.addObject("list", list);
				mv.addObject("pi", pi);
				mv.setViewName("myreview");
			} else {
				throw new MemberException("후기 수정에 실패하였습니다.");
			}
			

			return mv;
			
		}	

}

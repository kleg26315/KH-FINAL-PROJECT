package com.kh.bubblebee.notice.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.bubblebee.common.PageInfo;
import com.kh.bubblebee.common.Pagination;
import com.kh.bubblebee.notice.model.exception.NoticeException;
import com.kh.bubblebee.notice.model.service.NoticeService;
import com.kh.bubblebee.notice.model.vo.Notice;
import com.kh.bubblebee.notice.model.vo.Pagination2;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService nService;
	
	@RequestMapping("list.no")
	public ModelAndView noticeList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = nService.getNoticeListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Notice> list = nService.selectNoticeList(pi);
		
		if(list != null) {
			// list, pi, view
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("noticeList");
		} else {
			throw new NoticeException("공지사항 조회에 실패했습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping(value="insert.no", method = RequestMethod.POST)
	public String insertNotice(@RequestParam("title") String title, @RequestParam("content") String content, Model model) {
		
		int result = nService.insertNotice(title, content);
		
		if(result > 0) {
			return "redirect:list.no";
		} else {
			throw new NoticeException("공지사항 등록에 실패하였습니다.");
		}
	}
	
	@RequestMapping(value="insertFAQ.no", method = RequestMethod.POST)
	public String insertFAQ(@RequestParam("title") String title, @RequestParam("content") String content,
							@RequestParam("btype") int btype, Model model) {
		
		int result = nService.insertFAQ(title, content, btype);
		
		if(result > 0) {
			return "redirect:FAQList.no";
		} else {
			throw new NoticeException("FAQ 등록에 실패하였습니다.");
		}
	}
	
	@RequestMapping("FAQList.no")
	public ModelAndView FAQList(@RequestParam(value="page", required=false) Integer page, @RequestParam(value="number", required=false) String number, ModelAndView mv) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = nService.getFAQListCount(number);
		
		PageInfo pi = Pagination2.getPageInfo(currentPage, listCount);
		
		ArrayList<Notice> list = nService.selectFAQList(pi, number);
		
		if(list != null) {
			// list, pi, view
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("FAQList");
		} else {
			throw new NoticeException("FAQ 조회에 실패했습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("faqFilter.no")
	public void faq2List(@RequestParam(value="page", required=false) Integer page, @RequestParam(value="number", required=false) String number, HttpServletResponse response) {

		response.setContentType("application/json; charset=UTF-8");
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = nService.getFAQFilterListCount(number);
		
		PageInfo pi = Pagination2.getPageInfo(currentPage, listCount);
		
		ArrayList<Notice> list = nService.selectFAQFilterList(pi, number);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("pi", pi);
		map.put("list", list);
		map.put("number", number);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		try {
			gson.toJson(map, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("deleteFAQ.no")
	public String deleteFAQ(@RequestParam("bno") String bno) {
		
		int result = nService.deleteFAQ(bno);
		
		if(result > 0) {
			return "redirect:FAQList.no";
		} else {
			throw new NoticeException("FAQ 삭제에 실패하였습니다.");
		}
	}
	
	@RequestMapping("updateFAQForm.no")
	public ModelAndView updateFAQForm(@RequestParam("bno") String bno, @RequestParam("page") int page,  ModelAndView mv) {
		
		Notice notice = nService.selectupdateFAQ(bno);
		
		if(notice != null) {
			mv.addObject("notice", notice);
			mv.addObject("page", page);
			mv.setViewName("updateFAQForm");
		} else {
			throw new NoticeException("FAQ 조회에 실패하였습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping(value="updateFAQ.no", method = RequestMethod.POST) 
	public ModelAndView updateFAQ(@RequestParam("title") String title, @RequestParam("content") String content,
						@RequestParam("btype") int btype, @RequestParam("bno") String bno, @RequestParam("page") Integer page, HttpServletRequest request, ModelAndView mv) {
		
		int result = nService.updateFAQ(title, content, btype, bno);
		
		if(result > 0) {
			mv.addObject("page", page);
			mv.addObject("number", btype);
			mv.setViewName("redirect:FAQList.no");
		} else {
			throw new NoticeException("FAQ 수정에 실패하였습니다.");
		}
		
		return mv;
	}
}

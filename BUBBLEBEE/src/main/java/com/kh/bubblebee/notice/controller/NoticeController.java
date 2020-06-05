package com.kh.bubblebee.notice.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bubblebee.board.model.exception.BoardException;
import com.kh.bubblebee.board.model.vo.Board;
import com.kh.bubblebee.common.PageInfo;
import com.kh.bubblebee.common.Pagination;
import com.kh.bubblebee.notice.model.exception.NoticeException;
import com.kh.bubblebee.notice.model.service.NoticeService;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService nService;
	
	@RequestMapping("list.no")
	public ModelAndView noticeList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		
		int currentPage = 1;
		if(page!=null) {
			currentPage = page;
		}
		
		int listCount = nService.getListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Board> list = nService.selectList(pi);
				
		if(list != null) {
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
}

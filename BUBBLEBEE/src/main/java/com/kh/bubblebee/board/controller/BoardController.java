package com.kh.bubblebee.board.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bubblebee.board.model.exception.BoardException;
import com.kh.bubblebee.board.model.vo.Board;
import com.kh.bubblebee.board.service.BoardService;
import com.kh.bubblebee.common.PageInfo;
import com.kh.bubblebee.common.Pagination;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService bService;
	
	@RequestMapping("tplist.bo")
	public String tpmoimList() {
		return "listView_talkparty";
	}
	
	@RequestMapping("tpallList.bo")
	public ModelAndView tpallList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		
		int currentPage = 1;
		if(page!=null) {
			currentPage = page;
		}
		
		int listCount = bService.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Board> list = bService.selectList(pi);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("listView_talkparty_all");
			
		} else {
			throw new BoardException("게시글 전체 조회에 실패했습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("tslist.bo")
	public String tsmoimList() {
		return "listView_taste";
	}
	
	@RequestMapping("tsallList.bo")
	public String tsallList() {
		return "listView_taste_all";
	}
	
	@RequestMapping("stlist.bo")
	public String stallList() {
		return "listView_study";
	}
	
	@RequestMapping("stallList.bo")
	public String stmoimList() {
		return "listView_study_all";
	}
	
	@RequestMapping("evlist.bo")
	public String evmoimList() {
		return "listView_event";
	}
	
	@RequestMapping("evallList.bo")
	public String evallList() {
		return "listView_event_all";
	}
	
	@RequestMapping("diylist.bo")
	public String diyclassList() {
		return "listView_diy";
	}
	
	@RequestMapping("diyallList.bo")
	public String diyallList() {
		return "listView_diy_all";
	}
	
	@RequestMapping("cklist.bo")
	public String ckclassList() {
		return "listView_cook";
	}
	
	@RequestMapping("ckallList.bo")
	public String ckallList() {
		return "listView_cook_all";
	}
	
	@RequestMapping("splist.bo")
	public String spclassList() {
		return "listView_sport";
	}
	
	@RequestMapping("spallList.bo")
	public String spallList() {
		return "listView_sport_all";
	}
	
	@RequestMapping("lalist.bo")
	public String laclassList() {
		return "listView_language";
	}
	
	@RequestMapping("laallList.bo")
	public String laallList() {
		return "listView_language_all";
	}
	
	@RequestMapping("wklist.bo")
	public String workList() {
		return "listView_work";
	}
	
	@RequestMapping("wkallList.bo")
	public String workallList() {
		return "listView_work_all";
	}

}

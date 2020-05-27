package com.kh.bubblebee.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	
	@RequestMapping("tplist.bo")
	public String tpmoimList() {
		return "listView_talkparty";
	}
	
	@RequestMapping("tslist.bo")
	public String tsmoimList() {
		return "listView_taste";
	}
	
	@RequestMapping("stlist.bo")
	public String stmoimList() {
		return "listView_study";
	}
	
	@RequestMapping("evlist.bo")
	public String evmoimList() {
		return "listView_event";
	}
	
	@RequestMapping("diylist.bo")
	public String diyclassList() {
		return "listView_diy";
	}
	
	@RequestMapping("cklist.bo")
	public String ckclassList() {
		return "listView_cook";
	}
	
	@RequestMapping("splist.bo")
	public String spclassList() {
		return "listView_sport";
	}
	
	@RequestMapping("lalist.bo")
	public String laclassList() {
		return "listView_language";
	}
	
	@RequestMapping("wklist.bo")
	public String workList() {
		return "listView_work";
	}

}

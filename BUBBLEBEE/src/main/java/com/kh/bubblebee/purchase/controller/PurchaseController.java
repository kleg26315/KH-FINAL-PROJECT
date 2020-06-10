package com.kh.bubblebee.purchase.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bubblebee.purchase.model.exception.PurchaseException;
import com.kh.bubblebee.purchase.model.service.PurchaseService;
import com.kh.bubblebee.purchase.model.vo.PBoard;

@Controller
public class PurchaseController {
	
	@Autowired
	private PurchaseService pService;

	@RequestMapping("purchase1First")
	public ModelAndView purchase1First(@RequestParam(value = "fNo") int fNo, ModelAndView mv) {
		
		ArrayList<PBoard> plist = pService.selectBList(fNo);
		
		System.out.println("fNo는 무엇인가요????? : " + fNo);
		System.out.println("blist는 무엇인가용ㅇ??? : " + plist);
		
		if(plist != null) 	 {
			mv.addObject("fNo", fNo);
			mv.addObject("plist", plist);
			mv.setViewName("purchase1First");
		}else {
			throw new PurchaseException("구매에 실패하였습니다.");
		}
		
		return mv;
	}	
	
}

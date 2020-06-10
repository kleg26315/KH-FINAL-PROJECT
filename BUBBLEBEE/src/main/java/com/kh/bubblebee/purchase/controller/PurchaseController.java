package com.kh.bubblebee.purchase.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bubblebee.member.model.vo.Member;
import com.kh.bubblebee.purchase.model.exception.PurchaseException;
import com.kh.bubblebee.purchase.model.service.PurchaseService;
import com.kh.bubblebee.purchase.model.vo.PBoard;
import com.kh.bubblebee.purchase.model.vo.PSList;

@Controller
public class PurchaseController {
	
	
	@Autowired
	private PurchaseService pService;

	@RequestMapping("purchase1First")
	public ModelAndView purchase1First(@RequestParam(value = "fNo") int fno, ModelAndView mv,HttpSession session, @RequestParam(value = "oNo")String ono) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");

		System.out.println("ono는?" + ono);
		
		if(loginUser != null) {
			ArrayList<PBoard> plist = pService.selectBList(fno);
			ArrayList<PSList> pslist = pService.selectPList(ono);
			System.out.println("plist는? : " + plist);
			System.out.println("pslist는??????????? : " + pslist);
			if(plist != null && pslist != null) 	 {
				mv.addObject("fno", fno);
				mv.addObject("pslist", pslist);
				mv.addObject("plist", plist);
				mv.setViewName("purchase1First");
			}else {
				throw new PurchaseException("구매에 실패하였습니다.");
			}
		}else {
			mv.setViewName("redirect:loginView.me");
		}
		return mv;
	}	
	
}

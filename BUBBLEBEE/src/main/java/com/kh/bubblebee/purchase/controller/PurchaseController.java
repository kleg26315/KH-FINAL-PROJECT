package com.kh.bubblebee.purchase.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bubblebee.board.model.vo.Board;
import com.kh.bubblebee.purchase.model.exception.PurchaseException;
import com.kh.bubblebee.purchase.model.service.PurchaseService;
import com.kh.bubblebee.purchase.model.vo.Purchase;

@Controller
public class PurchaseController {
	
	@Autowired
	private PurchaseService pService;

	
	@RequestMapping(value = "pastro.pu", method = RequestMethod.POST)
	public String insertOption(ModelAndView mv, @RequestParam("fNo") String fNo) {
	
		System.out.println(fNo);
	
		int Fno = Integer.parseInt(fNo);
		
		Board board = pService.selectBoard(Fno);
		
		if(board != null) {
			return "purchaseThis"; 
		}else {
			throw new PurchaseException("결제목록 불러오기 실패");
		}
		
		
//		int fno = Integer.parseInt(fNo);
//	
//		Board board = pService.selectBoard(fno);
//			
//		if(board != null) {
//			mv.addObject("Board",board);
//			mv.setViewName("purchaseThis");
//			return mv;
//		}else {
//			throw new PurchaseException("결제목록 불러오기 실패");
//		}
		
		
//		int result = pService.insertOption(p);
//		
//		System.out.println(result);
//		if(result > 0) {
//			return "purchaseThis";
//		}else {
//			throw new PurchaseException("결제에 실패하였습니다");
//		}
//		
		
	}
	
	
	
	
}

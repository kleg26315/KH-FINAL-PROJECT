package com.kh.bubblebee.purchase.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bubblebee.member.model.vo.Member;
import com.kh.bubblebee.purchase.model.exception.PurchaseException;
import com.kh.bubblebee.purchase.model.service.PurchaseService;
import com.kh.bubblebee.purchase.model.vo.PBoard;
import com.kh.bubblebee.purchase.model.vo.PChoose;
import com.kh.bubblebee.purchase.model.vo.PSList;
import com.kh.bubblebee.purchase.model.vo.Purchase;

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
			
			System.out.println("plist : " + plist);
			System.out.println("pslist : " + pslist);
			
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
	
	@RequestMapping("purchaseConfirm")
	public ModelAndView purchaseThis(
						@ModelAttribute Purchase p, @RequestParam(value = "gname")String gname,
						@RequestParam(value = "gphone")String gphone, 
						@RequestParam(value = "gaddress1")String gaddress1, 
						@RequestParam(value = "gaddress2")String gaddress2,
						@RequestParam(value = "gaddress3")String gaddress3,
						@RequestParam(value = "gmsg")String gmsg,
						@RequestParam(value = "ocount")int ocount,
						@RequestParam(value = "ono")String ono,
						@RequestParam(value = "totalPrice")int gpay,
						@RequestParam(value = "discountPrice")String discountPrice,
						@RequestParam(value = "fno")int fno,
						HttpSession session,
						ModelAndView mv
						){
		
		
			System.out.println("gaddress1 : " + gaddress1);
			System.out.println("gaddress2 : " + gaddress2);
			System.out.println("gaddress3 : " + gaddress3);
			
			
			
			
			Member loginUser = (Member)session.getAttribute("loginUser");
			String gaddress = gaddress1 + " " + gaddress2 + gaddress3;
			String user_id = loginUser.getId();
			p.setGname(gname);
			p.setGphone(gphone);
			p.setGaddress(gaddress);
			p.setGmsg(gmsg);
			p.setGpay(gpay);
			p.setOcount(ocount);
			p.setUser_id(user_id);
			p.setOno(ono);
			p.setDiscount(discountPrice);
			
			int purchaseThis1 = pService.insertPurchase(p);
			PChoose c = pService.selectPChoose(ono);
			PBoard b = pService.selectBPBoard(fno);
			
			System.out.println("gaddress : " + gaddress);
			System.out.println("p : " + purchaseThis1);
			
			if(purchaseThis1 > 0) {
				mv.addObject("p", p);
				mv.addObject("c", c);
				mv.addObject("b",b);
				mv.setViewName("purchaseConfirm");
			}else {
				throw new PurchaseException("결제에 실패하였습니다!");
			}
			
			return mv;
		
	}
	
}
	
	


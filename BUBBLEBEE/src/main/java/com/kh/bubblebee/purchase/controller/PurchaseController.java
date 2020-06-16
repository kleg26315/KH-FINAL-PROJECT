package com.kh.bubblebee.purchase.controller;

import java.sql.Date;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

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
	
	@RequestMapping("purchaseConfirm.pu")
	public ModelAndView purchaseThis(
						@ModelAttribute Purchase p, @RequestParam(value = "gname")String gname,
						@RequestParam(value = "gphone")String gphone, 
						@RequestParam(value = "gaddress1")String gaddress1, 
						@RequestParam(value = "gaddress2")String gaddress2,
						@RequestParam(value = "gaddress3")String gaddress3,
						@RequestParam(value = "gmsg")String gmsg,
						@RequestParam(value = "ocount")String ocount,
						@RequestParam(value = "ono")String ono,
						@RequestParam(value = "totalPrice")String gpay,
						@RequestParam(value = "discountPrice")String discountPrice,
						@RequestParam(value = "fno")String fno,
						HttpSession session,
						ModelAndView mv
						){
		
			Member loginUser = (Member)session.getAttribute("loginUser");
			String gaddress = gaddress1 + " " + gaddress2 + gaddress3;
			String user_id = loginUser.getId();
			
			
			System.out.println("gaddress1 : " + gaddress1);
			System.out.println("gaddress2 : " + gaddress2);
			System.out.println("gaddress3 : " + gaddress3);
			
			SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHss");
			Calendar thisTime = Calendar.getInstance();
			
			String format_time = format.format(thisTime.getTime());
			
			
			String dcode = format_time + "-" + ono + "-" + user_id;
			
			Map<String , String> param = new HashMap<String, String>();
			
			param.put("gname", gname);
			param.put("gaddress", gaddress );
			param.put("gphone", gphone);
			param.put("gmsg", gmsg);
			param.put("ocount", ocount);
			param.put("ono", ono);
			param.put("gpay", gpay);
			param.put("discountPrice", discountPrice);
			param.put("fno", fno);
			param.put("user_id", user_id);
			param.put("dcode", dcode);
		
			int purchaseThis1 = pService.insertPurchase(param);
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
	
	@RequestMapping("kakaoPay.pu")
	public ModelAndView kakaoPay(@ModelAttribute Purchase p, 
			@RequestParam(value = "gname")String gname,
			@RequestParam(value = "gphone")String gphone, 
			@RequestParam(value = "gaddress1")String gaddress1, 
			@RequestParam(value = "gaddress2")String gaddress2,
			@RequestParam(value = "gaddress3")String gaddress3,
			@RequestParam(value = "gmsg")String gmsg,
			@RequestParam(value = "ocount")String ocount,
			@RequestParam(value = "ono")String ono,
			@RequestParam(value = "totalPrice")String gpay,
			@RequestParam(value = "discountPrice")String discountPrice,
			@RequestParam(value = "fno")String fno,
			@RequestParam(value = "gaddress")String gaddress,
			HttpSession session,
			ModelAndView mv) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		String user_id = loginUser.getId();
		
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHss");
		Calendar thisTime = Calendar.getInstance();
		
		String format_time = format.format(thisTime.getTime());
		
		String dcode = format_time + "-" + ono + "-" + user_id;
		
		
		Map<String, String> param= new HashMap<String, String>();
		
		
		param.put("gname", gname);
		param.put("gaddress", gaddress );
		param.put("gphone", gphone);
		param.put("gmsg", gmsg);
		param.put("ocount", ocount);
		param.put("ono", ono);
		param.put("gpay", gpay);
		param.put("discountPrice", discountPrice);
		param.put("fno", fno);
		param.put("user_id", user_id);
		param.put("dcode", dcode);

		
		int purchaseThis1 = pService.insertPurchase2(param);
		
		int gno = pService.selectGno(dcode);
		
		System.out.println("dcode : " + dcode + " gno : " + gno);
		
		if(purchaseThis1 != 0 && user_id != null) {
			mv.addObject("gname", gname);
			String address = gaddress1 + " " + gaddress2 + gaddress3;
			mv.addObject("gaddress", address);
			mv.addObject("gpay", gpay);
			mv.addObject("gmsg", gmsg);
			mv.addObject("gphone", gphone);
			mv.addObject("gno", gno);
			mv.addObject("ono", ono);
			mv.addObject("fno", fno);
			mv.setViewName("kakaoPay");
		}
		
		return mv;
		
	}
	
	@RequestMapping("kakaoPayConfirm.pu")
	public ModelAndView kakaoPayConfirm(ModelAndView mv, 
			@RequestParam(value = "gno")String gno,
			@RequestParam(value = "fno")String fno,
			@RequestParam(value = "ono")String ono) {

		
		Purchase p = pService.selectPurchase2(gno);
		PChoose c = pService.selectPChoose2(ono);
		PBoard b = pService.selectBPBoard2(fno);
		
		System.out.println("kakao gno : " + gno);
		System.out.println("kakao fno : " + fno);
		System.out.println("kakao ono : " + ono);
		System.out.println("kakao p : " + p);
		System.out.println("kakao c : " + c);
		System.out.println("kakao b : " + b);
		
		mv.addObject("p", p);
		mv.addObject("c", c);
		mv.addObject("b", b);
		mv.setViewName("purchaseConfirmKakao");
		return mv;
	}
	
}
	
	


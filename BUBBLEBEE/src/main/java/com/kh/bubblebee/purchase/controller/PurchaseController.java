package com.kh.bubblebee.purchase.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bubblebee.board.model.vo.Board;
import com.kh.bubblebee.member.model.service.MemberService;
import com.kh.bubblebee.member.model.vo.Member;
import com.kh.bubblebee.purchase.model.exception.PurchaseException;
import com.kh.bubblebee.purchase.model.service.PurchaseService;
import com.kh.bubblebee.purchase.model.vo.PBoard;
import com.kh.bubblebee.purchase.model.vo.PChoose;
import com.kh.bubblebee.purchase.model.vo.PPoint;
import com.kh.bubblebee.purchase.model.vo.PSList;
import com.kh.bubblebee.purchase.model.vo.Purchase;

@Controller
public class PurchaseController {
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private PurchaseService pService;

	@RequestMapping("purchase1First")
	public ModelAndView purchase1First(@RequestParam(value = "fNo") String fno, 
			ModelAndView mv,HttpSession session, 
			@RequestParam(value = "oNo")String ono, 
			@RequestParam(value = "ocode")String ocode,
			HttpServletResponse response
			) {
		
		String onoo = ono.replace(",","");
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		
		System.out.println("loginUser : " + loginUser);
		System.out.println("ono : " + onoo);
		System.out.println("fno : " + fno);
		System.out.println("ocode : " + ocode);
		
		if(loginUser != null) {
			String user_id = loginUser.getId();
			
			ArrayList<PBoard> plist = pService.selectBList(fno);
			ArrayList<PChoose> pclist = pService.selectPList(onoo);
			int pcost = pService.selectPcost(user_id);
		
			System.out.println("plist : " + plist);
			System.out.println("pslist : " + pclist);
			
			if(plist != null && pclist != null ){
				mv.addObject("fno", fno);
				mv.addObject("pslist", pclist);
				mv.addObject("pcost", pcost);
				mv.addObject("plist", plist);
				mv.addObject("ocode", ocode);
				mv.setViewName("purchase1First");
			}else {
				throw new PurchaseException("구매에 실패하였습니다.");
			}
		}else {
			throw new PurchaseException("구매에 실패하였습니다.");
//			response.setContentType("text/html; charset=UTF-8");
//			PrintWriter out;
//			try {
//				out = response.getWriter();
//				out.println("<script>alert('로그인이 필요한 서비스입니다.'); </script>");
//				out.flush();
////				out.println("<script>alert('로그인이 필요한 서비스입니다.'); location.href=purchase1First.pu; </script>");
////				mv.addObject("message", "로그인이 필요한 서비스입니다.");
////				mv.setViewName("redirect:loginView.me");
//			} catch (IOException e) {
//				e.printStackTrace();
//			}finally {
//				mv.setViewName("boardDetail");	
//			}
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
						@RequestParam(value = "ocode")String ocode,
						@RequestParam(value = "ono")String ono,
						@RequestParam(value = "totalPrice")String gpay,
						@RequestParam(value = "discountPrice")String discountPrice,
						@RequestParam(value = "fno")String fno,
						@RequestParam(value = "presentPoint") int presentPoint,
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
			System.out.println("ocode : " + ocode);
			
			Map<String , String> param = new HashMap<String, String>();
			
			param.put("gname", gname);
			param.put("gaddress", gaddress );
			param.put("gphone", gphone);
			param.put("gmsg", gmsg);
			param.put("ocode", ocode);
			param.put("ono", ono);
			param.put("gpay", gpay);
			param.put("discountPrice", discountPrice);
			param.put("fno", fno);
			param.put("user_id", user_id);
			param.put("dcode", dcode);
			param.put("ocode", ocode);
		
			if(loginUser != null) {
				int purchaseThis1 = pService.insertPurchase(param);
				PChoose c = pService.selectPChoose(ono);
				PBoard b = pService.selectBPBoard(fno);
				
				int discount1 = Integer.parseInt(discountPrice);
				int discount2 = presentPoint - discount1;
				
				String discountP = Integer.toString(discount2);
				
				String comment =  discountPrice + " 사용" ;
				String comment2 =  "결제 후 마일리지 적립" ;
				
				if(discount1 != 0) {
					int pused = pService.insertPused(user_id, discountPrice, comment);
				}
				int pp = pService.selectPPoint(user_id);
				if(!gpay.equals("0")) {
				int plusPoint = pService.insertplusPoint(user_id, Integer.parseInt(gpay)*0.01, comment2);
				}
				System.out.println("gaddress : " + gaddress);
				System.out.println("p : " + purchaseThis1);
				
				if(purchaseThis1 > 0 && 
						c != null &&
						b != null) {
					mv.addObject("p", p);
					mv.addObject("c", c);
					mv.addObject("b",b);
					mv.addObject("pp", pp);
					mv.setViewName("purchaseConfirm");
				}else {
					throw new PurchaseException("결제에 실패하였습니다!");
				}
			}else {
				mv.addObject("message", "로그인이 필요한 서비스입니다.");
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
			@RequestParam(value = "ocode")String ocode,
			@RequestParam(value = "ono")String ono,
			@RequestParam(value = "totalPrice")String gpay,
			@RequestParam(value = "discountPrice")String discountPrice,
			@RequestParam(value = "fno")String fno,
			@RequestParam(value = "gaddress")String gaddress,
			@RequestParam(value = "presentPoint") int presentPoint,
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
		param.put("ocode", ocode);
		param.put("ono", ono);
		param.put("gpay", gpay);
		param.put("discountPrice", discountPrice);
		param.put("fno", fno);
		param.put("user_id", user_id);
		param.put("dcode", dcode);

		System.out.println("dcode : " + dcode);
		
		if(loginUser != null) {
			int purchaseThis1 = pService.insertPurchase2(param);
			
			
			int discount1 = Integer.parseInt(discountPrice);
			int discount2 = presentPoint - discount1;
			
			String discountP = Integer.toString(discount2);
			
			String comment =  discountPrice + " 사용" ;
			String comment2 =  "결제 후 마일리지 적립" ;
			
			if(discount1 != 0) {
				int pused = pService.insertPused(user_id, discountPrice, comment);
			}
			int pp = pService.selectPPoint(user_id);
			if(!gpay.equals("0")) {
			int plusPoint = pService.insertplusPoint(user_id, Integer.parseInt(gpay)*0.01, comment2);
			}
			
			int gno = pService.selectGno(dcode);
			
			System.out.println("dcode : " + dcode + " gno : " + gno);
			
			if(purchaseThis1 != 0 && user_id != null && gno > 0) {
				mv.addObject("gname", gname);
				String address = gaddress1 + " " + gaddress2 +  " " + gaddress3 + " ";
				mv.addObject("gaddress", address);
				mv.addObject("gpay", gpay);
				mv.addObject("gmsg", gmsg);
				mv.addObject("gphone", gphone);
				mv.addObject("gno", gno);
				mv.addObject("ono", ono);
				mv.addObject("fno", fno);
				mv.setViewName("kakaoPay");
			}else {
				throw new PurchaseException("결제에 실패하였습니다!");
			}
		}else {
			mv.addObject("message", "로그인이 필요한 서비스입니다.");
		}
		return mv;
		
	}
	
	@RequestMapping("kakaoPayConfirm.pu")
	public ModelAndView kakaoPayConfirm(ModelAndView mv, 
			@RequestParam(value = "gno")String gno,
			@RequestParam(value = "fno")String fno,
			@RequestParam(value = "ono")String ono,
			HttpSession session) {

		Member loginUser = (Member)session.getAttribute("loginUser");
		String user_id = loginUser.getId();
		
		if(loginUser != null) {
			Purchase p = pService.selectPurchase2(gno);
			PChoose c = pService.selectPChoose2(ono);
			PBoard b = pService.selectBPBoard2(fno);
			int pp = pService.selectPPoint(user_id);
			
			System.out.println("kakao gno : " + gno);
			System.out.println("kakao fno : " + fno);
			System.out.println("kakao ono : " + ono);
			System.out.println("kakao p : " + p);
			System.out.println("kakao c : " + c);
			System.out.println("kakao b : " + b);
			if(p != null && c != null && b != null ) {
				mv.addObject("p", p);
				mv.addObject("c", c);
				mv.addObject("b", b);
				mv.addObject("pp", pp);
				mv.setViewName("purchaseConfirmKakao");
			}else {
				throw new PurchaseException("결제에 실패하였습니다!");
			}
		}else {
			throw new PurchaseException("결제에 실패하였습니다!");
		}
		return mv;
	}
	
	@RequestMapping("addslist.pu")
	public ModelAndView addSlist(@RequestParam(value = "fNo") String fno, 
			ModelAndView mv,HttpSession session, 
			@RequestParam(value = "oNo")String ono, 
			@RequestParam(value = "ocode")String ocode,
			HttpServletResponse response
			) {
		
		String onoo = ono.replace(",","");
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		if(loginUser != null) {
			String userId = loginUser.getId();
			
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("userId", userId);
			map.put("ono", onoo);
			map.put("tcount", ocode);
			
			int result = pService.addSlist(map);
			
			if(result > 0) {
				// 장바구니 조회
    			ArrayList<Board> slist = mService.getSlist(loginUser.getId());
    			session.setAttribute("slist", slist);
				mv.addObject("ono", onoo).addObject("tcount",ocode).setViewName("redirect:myslist.mg");
			}else {
				throw new PurchaseException("장바구니 추가에 실패하였습니다.");
			}
		}else {
			mv.addObject("message", "로그인이 필요한 서비스입니다.");
		}
		return mv;
	}

	@RequestMapping("redirect")
	public ModelAndView redirectMethod(ModelAndView mv) {
		
		mv.setViewName("redirect:home.do");
		
		return mv;
	}
	
	@RequestMapping("findFrip.pu")
	public ModelAndView findFrip(ModelAndView mv,
			@RequestParam(value = "fno")int fno) {
		
		mv.addObject("fno", fno);
		mv.setViewName("redirect:detail.bo");
		
		return mv;
	}
	

	
}
	
	


package com.kh.bubblebee.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bubblebee.account.model.service.AccountService;
import com.kh.bubblebee.account.model.vo.Account;
import com.kh.bubblebee.board.model.service.BoardService;
import com.kh.bubblebee.board.model.vo.Board;
import com.kh.bubblebee.common.PageInfo;
import com.kh.bubblebee.member.model.exception.MemberException;
import com.kh.bubblebee.notice.model.exception.NoticeException;
import com.kh.bubblebee.notice.model.vo.Pagination2;

@Controller
public class AdminController {
	
	@Autowired
	private AccountService acService;
	
	@Autowired
	private BoardService bService;
	
	@RequestMapping("account.ad")
	public ModelAndView accountPageView(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = acService.getAccountListCount();
		
		PageInfo pi = Pagination2.getPageInfo(currentPage, listCount);
		
		ArrayList<Account> list = acService.selectAccountList(pi);
		
		ArrayList<Account> AllList = acService.selectAllAccountList();
		
		if(list != null) {
			// list, pi, view
			mv.addObject("list", list);
			mv.addObject("AllList", AllList);
			mv.addObject("pi", pi);
			mv.setViewName("adminPage_account");
		} else {
			throw new NoticeException("정산관리 페이지 로드에 실패했습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("class.ad")
	public ModelAndView classPageView(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = bService.getClassListCount();
		
		PageInfo pi = Pagination2.getPageInfo(currentPage, listCount);
		
		ArrayList<Board> list = bService.selectClassList(pi);
		
		if(list != null) {
			// list, pi, view
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("adminPage_class");
		} else {
			throw new NoticeException("클래스 승인 페이지 로드에 실패했습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping(value="noticeInsertView.ad")
	public String noticeInsertView(@RequestParam(value="message", required=false) String message, Model model) {
		return "adminPage_notice_form";
	}
	
	@RequestMapping("FAQInsertView.ad")
	public String FAQInsertView() {
		return "adminPage_FAQ_form";
	}
	
	@RequestMapping("agreeAccount.ad")
	public String agreeAccount(@RequestParam(value="acno") String acno) {
		int result = acService.agreeAccount(acno);
		
		if(result > 0) {
			return "redirect:account.ad";
		} else {
			throw new NoticeException("정산승인 처리에 실패했습니다.");
		}
	}
	
	@RequestMapping("agreeClass.ad")
	public String agreeClass(@RequestParam(value="fno") String fno) {
		int result = bService.agreeClass(fno);
		
		if(result > 0) {
			return "redirect:class.ad";
		} else {
			throw new NoticeException("클래스 승인 처리에 실패했습니다.");
		}
	}
	
	@RequestMapping("rejectClass.ad")
	public String rejectClass(@RequestParam(value="fno") String fno, @RequestParam(value="content") String content, @RequestParam(value="title") String title, @RequestParam("id") String id) {
		int result = bService.rejectClass(fno);
		
		String host = "smtp.naver.com";
		String user = "kleg26315@naver.com";
		String password = "12rnstn!!";
		
		String to_email = id;
		
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", 465);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.starttls.enable", "true");
		
		StringBuffer temp = new StringBuffer();
		temp.append(content);
		
		String rejectMessage = temp.toString();
		
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});
		
		try {
			MimeMessage msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(user, "BUBBLEBEE"));
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));
			
			msg.setSubject("[BUBBLEBEE] 요청하신 클래스가 거절되었습니다.	");
			
			msg.setText("요청하신 클래스 ["+title+"]에 대한 거절 사유입니다. \n\n" +temp);
			
			Transport.send(msg);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		if(result > 0) {
			return "redirect:class.ad";
		} else {
			throw new NoticeException("클래스 거절 처리에 실패했습니다.");
		}
	}
	
}

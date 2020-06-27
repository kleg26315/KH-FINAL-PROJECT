package com.kh.bubblebee.admin.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

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
import com.kh.bubblebee.host.model.vo.Aclist;
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
		
		ArrayList<Aclist> list = acService.selectAccountList(pi);
		
		ArrayList<Aclist> AllList = acService.selectAllAccountList();
		
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
	public String agreeAccount(@RequestParam(value="fno") String fno, @RequestParam("id") String id,
			@RequestParam("ftitle") String ftitle, @RequestParam("people") String people, @RequestParam("sales") String sales,
			@RequestParam("amount") String amount, @RequestParam("bdate") String bdate){
		int result = acService.agreeAccount(fno, id, ftitle, people, sales, amount);
		int result2 = acService.updateBuying(fno, id, bdate);
		
		if(result > 0) {
			if(result2 > 0) {
				return "redirect:account.ad";
			} else {
				throw new NoticeException("정산승인 처리에 실패했습니다.");
			}
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
	public String rejectClass(@RequestParam(value="fno") String fno, @RequestParam(value="content") String content, @RequestParam(value="title") String title, @RequestParam("id") String id,
			HttpServletRequest request) throws UnknownHostException {
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
		
		InetAddress local = InetAddress.getLocalHost();
	      
	      String ip = local.getHostAddress();
	      int port = request.getServerPort();
	      String juso = ip+":"+port;
	      
	      String message = "";
	     message += "<div id='readFrame'><div dir='ltr'><div style='font-family:verdana,sans-serif'><div dir='ltr'><div><div dir='ltr'><div>";
	     message += "<div><div dir='ltr'><div><div style='font-family:Arial,Helvetica,sans-serif'><font color='#000000'>안녕하세요, 호스트님</font><br><font color='#000000'>버블비 매니저 김경섭입니다</font><br><font color='#000000' style='font-family:verdana,sans-serif'><br></font></div><div style='font-family:Arial,Helvetica,sans-serif'><b>";
	     message += "<font color='#000000' style='font-family:verdana,sans-serif'>접수해주신 콘텐츠 :&nbsp;</font><span style='font-family:verdana,sans-serif'>"+title+"</span><br></b></div><div><font face='verdana, sans-serif'>검수한 결과, "+ temp+"</font></div><div style='font-family:Arial,Helvetica,sans-serif;color:rgb(0,0,0)'>";
	     message += "<font face='verdana, sans-serif'><br></font></div><div style='font-family:Arial,Helvetica,sans-serif;color:rgb(0,0,0)'><font face='verdana, sans-serif'>따라서, 접수하신 버블은 삭제 처리될 예정이며 콘텐츠 내용을 다시 검토하여 재접수해주시길 부탁드립니다.<br><br>감사합니다.<br></font></div><div style='font-family:Arial,Helvetica,sans-serif;color:rgb(0,0,0)'><br></div></div></div></div></div></div></div><div><div dir='ltr'><div dir='ltr'><div><div dir='ltr'><div><div dir='ltr'><div><div dir='ltr'>";
	     message += "<div dir='ltr'><div dir='ltr'><div dir='ltr'><div dir='ltr'><div dir='ltr'><div dir='ltr'></div></div></div></div></div></div></div></div></div></div></div></div></div></div></div></div></div><div><div dir='ltr'><div dir='ltr'><div><div dir='ltr'><div><div dir='ltr'><div><div dir='ltr'><div dir='ltr'><div dir='ltr'><div dir='ltr'><div dir='ltr'><div dir='ltr'><div dir='ltr'><p dir='ltr' style='line-height:2.4;margin-top:0pt;margin-bottom:0pt'><font face='verdana, sans-serif'><span style='color:rgb(68,68,68);font-size:13pt;background-color:transparent;font-weight:700;vertical-align:baseline;white-space:pre-wrap'><span></span>";
	     message += "<img style='width: 155px;' src=\"http://"+juso+"/bubblebee/resources/img/main_resize.png\"><br>";
	     message += "<span style='background-color:transparent;font-weight:normal;vertical-align:baseline;font-size:17.3333px'><b>김경섭</b></span><span style='background-color:transparent;font-weight:normal;font-size:11pt;vertical-align:baseline'> </span><span style='background-color:transparent;font-weight:normal;vertical-align:baseline;font-size:13.3333px'>Kyoungsub Kim</span><span style='background-color:transparent;font-weight:normal;font-size:11pt;vertical-align:baseline'> </span><span style='background-color:transparent;font-weight:normal;font-size:12pt;vertical-align:baseline'>|</span><span style='background-color:transparent;font-weight:normal;font-size:11pt;vertical-align:baseline'> </span><span style='background-color:transparent;font-size:12pt;vertical-align:baseline'>Manager&nbsp;</span></span></font></p><p dir='ltr' style='line-height:2.4;margin-top:0pt;margin-bottom:0pt'><span style='color:rgb(153,153,153);font-family:verdana,sans-serif;white-space:pre-wrap'>Email </span><font face='verdana, sans-serif'><font color='#cccccc'></font><font color='#999999'><a href='mailto:kleg26315@naver.com' target='_blank' rel='noreferrer noopener'>kleg26315@naver.com</a></font><font color='#999999'>&nbsp;</font></font></p><p dir='ltr' style='line-height:1.2;margin-top:0pt;margin-bottom:0pt'><span style='background-color:transparent;vertical-align:baseline'><font color='#999999' face='verdana, sans-serif'><span style='white-space:pre-wrap'>서울 강남구 테헤란로 14길 6,</span></font><font face='verdana, sans-serif' color='#999999' style='white-space:pre-wrap'> 남도빌딩 3층</font></span></p><p dir='ltr' style='line-height:1.2;margin-top:0pt;margin-bottom:0pt'><font face='verdana, sans-serif'><font color='#999999'><span style='background-color:transparent;vertical-align:baseline;white-space:pre-wrap'>010-5189-2073</span><span style='white-space:pre-wrap'>&nbsp;</span><span style='white-space:pre-wrap'>| </span></font><a href='http://192.168.10.4:8780/bubblebee/' target='_blank' rel='noreferrer noopener'><font color='#0000ff'>http://192.168.10.4:8780/bubblebee</font><br><br></a></font></p></div></div></div></div></div></div></div></div></div></div></div></div></div></div></div></div></div>";
		
		try {
			MimeMessage msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(user, "BUBBLEBEE"));
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));
			
			msg.setSubject("[BUBBLEBEE] 요청하신 클래스가 거절되었습니다.	");
			
			/* msg.setText("요청하신 클래스 ["+title+"]에 대한 거절 사유입니다. \n\n" +temp); */
			
			msg.setText(message, "utf-8", "html");
			
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

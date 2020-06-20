package com.kh.bubblebee.host.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bubblebee.board.model.vo.Board;
import com.kh.bubblebee.board.model.vo.Reply;
import com.kh.bubblebee.board.model.vo.Review;
import com.kh.bubblebee.common.PageInfo;
import com.kh.bubblebee.common.Pagination;
import com.kh.bubblebee.host.model.exception.HostException;
import com.kh.bubblebee.host.model.service.HostService;
import com.kh.bubblebee.host.model.vo.Host;
import com.kh.bubblebee.member.model.service.MemberService;
import com.kh.bubblebee.member.model.vo.Member;
import com.kh.bubblebee.notice.model.vo.Pagination2;

@SessionAttributes("loginUser")
@Controller
public class HostController {
	
	@Autowired
	private HostService hService;
	
	@Autowired
	private MemberService mService;
	
	// 호스트페이지로 이동 
	@RequestMapping("hostpage.ho")
	public String hostpageView() {
		return "hostpage_main";
	}
	
	// 호스트 등록하기
	@RequestMapping("enrollHost.ho")
	public String enrollHost(@ModelAttribute Host h,@ModelAttribute Member m,Model model) {
		
		// 이름, 닉네임, 이메일 , 전화번호 ,host_yn update
		int result1 = hService.updateMemberInfo(m);
		
		int result2 = 0;
		
		if(result1 > 0) {
			// 호스트에  추가하기
			result2 = hService.enrollHost(h);
			
			if(result2 > 0) {
				Member loginUser = mService.memberLogin(m);
				model.addAttribute("loginUser", loginUser);
				return "hostpage_main";
			}else {
				throw new HostException("호스트 등록에 실패하였습니다.");
			}
			
		}else {
			throw new HostException("호스트 등록에 실패하였습니다.");
		}
				
	}
	// 호스트 프로필 보기
	@RequestMapping("hostProfile.ho")
	public ModelAndView hostProfileView(@RequestParam("hostId") String hostId,@RequestParam(value="page", required=false) Integer page,ModelAndView mv) {
		System.out.println(hostId);
		
		Host host = hService.selectHost(hostId);
		
		int currentPage = 1;
		if(page!=null) {
			currentPage = page;
		}
		
		int listCount = hService.getListCount(hostId);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		
		ArrayList<Board> bList = hService.selectBoard(pi,hostId);
		if(host != null && bList != null) {
			mv.addObject("host",host);
			mv.addObject("pi",pi);
			mv.addObject("bList",bList);
			mv.setViewName("host_profile");
			
			return mv;
		}else {
			throw new HostException("호스트 프로필 조회 실패");
		}
		
	}
	// 호스트 리뷰
	@RequestMapping("hostReview.ho")
	public String hostReviewView(@RequestParam("hostId") String hostId) {
		System.out.println(hostId);
		return "host_profile";
	}
	
	// 호스트 게시판 별 문의 
	@RequestMapping("hostQnA.ho")
	public ModelAndView hostQnAView(@RequestParam("fno") int fno,@RequestParam(value="page2", required=false) Integer page,@RequestParam("hostId") String hostId,ModelAndView mv) {
		System.out.println(fno);
		System.out.println(hostId);
		//페이징 처리를 위한 전체 개수 가져오기
		int listCount = hService.selectQnACount(fno);
		
		int currentPage = 1;
		if(page!=null) {
			currentPage = page;
		}
		
		PageInfo pi = Pagination2.getPageInfo(currentPage, listCount);
		
		ArrayList<Review> rList = hService.selectQnAList(pi,fno);
		
		Host host = hService.selectHost(hostId);
		
		ArrayList<Reply> reList = hService.selectReplyList(hostId);
		
		
		mv.addObject("fno",fno);
		mv.addObject("rList",rList);
		mv.addObject("pi",pi);
		mv.addObject("host",host);
		mv.addObject("reList",reList);
		mv.setViewName("host_qna");		
		return mv;
	}
	// 호스트 게시판 별 문의 작성
	@RequestMapping("hostQnAwriteView.ho")
	public ModelAndView hostQnAwriteView(@RequestParam("fno") int fno,ModelAndView mv) {
		System.out.println(fno);
		mv.addObject("fno",fno);
		mv.setViewName("host_qna_write");
		return mv;
	}
	
	@RequestMapping("hostQnAenroll.ho")
	public ModelAndView hostQnAenroll(@ModelAttribute Review r,ModelAndView mv) {
		System.out.println(r);
		
		int result = hService.insertHostQnA(r);
		
		if(result >0) {
			mv.addObject("fno",r.getRef_fid());
			System.out.println("test"+r.getRef_fid());
			mv.setViewName("host_qna");
		}
		return mv;
	}
	// 문의 삭제
	@RequestMapping("deleteQnA.ho")
	public void deleteQnA(@RequestParam("qno") int qno,HttpServletResponse response) {
		int result = hService.deleteQnA(qno);
		
		boolean isDelete = result == 1 ? true : false;
		
		try {
			response.getWriter().print(isDelete);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	// 문의에 대한 답변 등록
	@RequestMapping("enrollReply.ho")
	public void enrollReply(@ModelAttribute Reply r,HttpServletResponse response){
		System.out.println(r);
		
		int result = hService.insertHostReply(r);
		
		Reply reply = hService.selectHostReply(r);
		
		boolean isEnroll = result == 1 ? true :false;
		
		try {
			response.getWriter().print(isEnroll);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}

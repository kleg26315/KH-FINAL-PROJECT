package com.kh.bubblebee.host.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

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
	public ModelAndView hostpageView(HttpSession session,ModelAndView mv) {
		
		String hostId = ((Member)session.getAttribute("loginUser")).getId();
		
		Host host = hService.selectHost(hostId);
		
		double qcount = hService.selectQ(hostId);
		double acount = hService.selectA(hostId);
		
		double qna = 0;
		if(qcount != 0 || acount != 0 || (qcount != 0 && acount != 0)) {
			qna = (acount/qcount)*100; 
		}
		
		mv.addObject("qna",qna);
		mv.addObject("host",host);
		mv.setViewName("hostpage_main");
		return mv;
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
	public ModelAndView hostProfileView(@RequestParam("hostId") String hostId,@RequestParam(value="page", required=false) Integer page,ModelAndView mv,HttpSession session) {
		System.out.println(hostId);
		
		String userId = ((Member)session.getAttribute("loginUser")).getId();
		
		Host host = hService.selectHost(hostId);
		
		int currentPage = 1;
		if(page!=null) {
			currentPage = page;
		}
		
		HashMap<String, String> map = new HashMap<>();
		map.put("hostId", hostId);
		map.put("userId", userId);
		
		int check = hService.hostLikeCheck(map);
		
		int likeCount = hService.likeCount(hostId);
		
		int listCount = hService.getListCount(hostId);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		
		
		
		ArrayList<Board> bList = hService.selectBoard(pi,hostId);
		if(host != null && bList != null) {
			mv.addObject("likeCount",likeCount);
			mv.addObject("check",check);
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
	public ModelAndView hostQnAwriteView(@RequestParam("fno") int fno,@RequestParam("hostId") String hostId,ModelAndView mv) {
		System.out.println(fno);
		mv.addObject("fno",fno);
		mv.addObject("hostId",hostId);
		mv.setViewName("host_qna_write");
		return mv;
	}
	
	@RequestMapping("hostQnAenroll.ho")
	public ModelAndView hostQnAenroll(@ModelAttribute Review r,@RequestParam("hostId") String hostId,ModelAndView mv) {
		System.out.println(r);
		
		int result = hService.insertHostQnA(r);
		
		if(result >0) {
			mv.addObject("fno",r.getRef_fid());
			System.out.println("test"+r.getRef_fid());
			mv.setViewName("redirect:hostQnA.ho?fno="+r.getRef_fid()+"&hostId="+hostId);
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
	
	// 호스트 프로필 수정 페이지로 이동
	@RequestMapping("hostUpdateProfile.ho")
	public ModelAndView hostUpdateProfileForm(HttpSession session,ModelAndView mv) {
		String hostId = ((Member)session.getAttribute("loginUser")).getId();
		
		Host host = hService.selectHost(hostId);
		
		mv.addObject("host",host);
		mv.setViewName("hostpage_updateprofile");
		
		return mv;
	}
	// 호스트 프로필 수정
	@RequestMapping("hUpdateProfile.ho")
	public String hUpdateProfile(@ModelAttribute Member m, @ModelAttribute Host h,ModelAndView mv) {
		System.out.println(m);
		System.out.println(h);

		int result1 = hService.updateMemberProfile(m); // member 업데이트
		int result2= hService.updateHostInfo(h); // host 업데이트
	
		if(result1 > 0 && result2 > 0) {
			return "redirect:hostpage.ho";
		}else {
			throw new HostException("업데이트 실패!");
		}
		
	}
	// 호스트 좋아요 버튼
	@RequestMapping("hostLike.ho")
	public void HostLike(@RequestParam("hostId") String hostId,@RequestParam("userId") String userId,HttpServletResponse response) {
		
		HashMap<String,String> map = new HashMap<>();
		
		map.put("hostId",hostId);
		map.put("userId", userId);
		
		// 좋아요가 눌러져있는지 아닌지 검사
		int check = hService.hostLikeCheck(map);
		
		String status ="";
		
		int result = 0;
		if(check == 1) {
			result = hService.deleteHostLike(map);
			status = "delete";
		}else {
			result = hService.insertHostLike(map);
			status = "insert";
		}
		
		try {
			response.getWriter().print(status);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}
	//호스트 내 모임,내 클래스,내 작품
	@RequestMapping("hostBoardAll.ho")
	public ModelAndView hostBoardAll(@RequestParam("ftype") int ftype,@RequestParam(value="page", required=false) Integer page,ModelAndView mv,HttpSession session) {
		
		String hostId = ((Member)session.getAttribute("loginUser")).getId();
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("ftype", ftype);
		map.put("hostId",hostId);
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = hService.getBListCount(map);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		
		ArrayList<Board> bList = hService.hostBoardAll(pi,map);
	
		mv.addObject("bList", bList);
		mv.addObject("pi",pi);
		mv.addObject("ftype", ftype);
		mv.setViewName("host_board_all");
		
		return mv;
	}
}

package com.kh.bubblebee.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bubblebee.alert.model.dao.AlertDAO;
import com.kh.bubblebee.alert.model.vo.Alert;
import com.kh.bubblebee.board.model.vo.Board;
import com.kh.bubblebee.common.PageInfo;
import com.kh.bubblebee.common.Pagination;
import com.kh.bubblebee.member.model.exception.MemberException;
import com.kh.bubblebee.member.model.service.MemberService;
import com.kh.bubblebee.member.model.service.MypageService;
import com.kh.bubblebee.member.model.vo.Hlike;
import com.kh.bubblebee.member.model.vo.Member;
import com.kh.bubblebee.notice.model.vo.Pagination2;
import com.kh.bubblebee.purchase.model.vo.PPoint;
import com.kh.bubblebee.purchase.model.vo.Paylist;
import com.kh.bubblebee.purchase.model.vo.Slist;

@SessionAttributes("loginUser")
@Controller
public class MypageController {
	
	@Autowired
	private MypageService mgService;
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private AlertDAO aDAO;
	@Autowired
	SqlSessionTemplate sqlSession;
	
	//좋아요(모임)
	@RequestMapping("mylike.mg")
	public ModelAndView mylikemeet(HttpSession session,@RequestParam(value="page" ,required = false) Integer page,ModelAndView mv) {
		String userId = ((Member)session.getAttribute("loginUser")).getId();
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		int listCount = mgService.getbListCount(userId);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Board> bList = mgService.selectbList(pi,userId);
		
		System.out.println(pi);
		
		mv.addObject("bList",bList);
		mv.addObject("pi", pi);
		mv.setViewName("mylikemeet");
		
		return mv;
	}
	
	//좋아요(클래스)
	@RequestMapping("mylikeclass.mg")
	public String mylikeclass() {
		return "mylikeclass";
	}
	//좋아요(호스트)
	@RequestMapping("mylikehost.mg")
	public ModelAndView mylikehost(HttpSession session,@RequestParam(value="page" ,required = false) Integer page,ModelAndView mv) {
		
		String userId = ((Member)session.getAttribute("loginUser")).getId();
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = mgService.gethListCount(userId);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Hlike> hList = mgService.selecthList(pi,userId);
		
		System.out.println(pi);
		
		mv.addObject("hList",hList);
		mv.addObject("pi", pi);
		mv.setViewName("mylikehost");

		return mv;
	}
	//참여 모임/클래스
	@RequestMapping("mymeet.mg")
	public String myclass() {
		return "myreserved";
	}
	//장바구니
	@RequestMapping("myslist.mg")
	public ModelAndView myslist(HttpSession session,@RequestParam(value="page" ,required = false) Integer page,ModelAndView mv) {
		String userId = ((Member)session.getAttribute("loginUser")).getId();
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = mgService.getSListCount(userId);
		
		PageInfo pi = Pagination2.getPageInfo(currentPage, listCount);
		
		ArrayList<Slist> sList = mgService.selectsList(pi,userId);
		
		mv.addObject("sList", sList);
		mv.addObject("pi", pi);
		mv.setViewName("myslist");
		
		
		return mv;
	}
	// 장바구니 삭제
	@RequestMapping("sListdelete.mg")
	public void sListdelete(@RequestParam("tno") int tno,HttpServletResponse response, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		int result = mgService.sListdelete(tno);
		ArrayList<Board> slist = mService.getSlist(loginUser.getId());
		session.setAttribute("slist", slist);
		
		boolean isDelete = result == 1 ? true : false;
		
		try {
			response.getWriter().print(isDelete);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}
	//결제내역
	@RequestMapping("mypaid.mg")
	public ModelAndView mypaid(HttpSession session,@RequestParam(value="page" ,required = false) Integer page,ModelAndView mv) {
		String userId = ((Member)session.getAttribute("loginUser")).getId();
		
		int currentPage=1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = mgService.getPListCount(userId);
		
		PageInfo pi = Pagination2.getPageInfo(currentPage, listCount);
		
		ArrayList<Paylist> pList = mgService.selectpayList(pi,userId);
		
		mv.addObject("pList",pList);
		mv.addObject("pi",pi);
		mv.setViewName("mypaid");
		return mv;
	}
	//마일리지
		@RequestMapping("mypoint.mg")
		public ModelAndView mypoint(@RequestParam(value="page" ,required = false) Integer page, HttpSession session,ModelAndView mv) {
			String userId = ((Member)session.getAttribute("loginUser")).getId();
			
			int currentPage = 1;
			if(page != null) {
				currentPage = page;
			}
			
			int listCount = mgService.getListCount(userId);
			
			PageInfo pi = Pagination2.getPageInfo(currentPage, listCount);	
			
			ArrayList<PPoint> pList = mgService.selectpList(pi,userId);
			
			if(pList !=null) {
			mv.addObject("pi",pi);
			mv.addObject("pList",pList);
			mv.setViewName("mypoint");
			}else {
				throw new MemberException("마일리지 목록 조회 실패");
			}
			return mv;
		}
		
	//모든 알림
	@RequestMapping("myalert.mg")
	public ModelAndView myalert(ModelAndView mv, HttpSession session) {
		String id = ((Member)session.getAttribute("loginUser")).getId();
		int count = aDAO.count_receive(sqlSession, id);
		ArrayList<Alert> alist = aDAO.receive_data(sqlSession, id);
		
		mv.addObject("count", count);
		mv.addObject("alist", alist);
		mv.setViewName("myalert");
		
		return mv;
	}
	
	@RequestMapping("checkAllAlert.mg")
	public String checkAllAlert(HttpSession session) {
		String id = ((Member)session.getAttribute("loginUser")).getId();
		
		int result = aDAO.checkAllAlert(sqlSession, id);
		
		if(result > 0) {
			return "redirect:myalert.mg";
		} else {
			throw new MemberException("알림 모두 읽기 실패");
		}
	}
	
	// 내정보 수정페이지로 이동
	@RequestMapping("updateInfoForm.mg")
	public String updateInfoView() {
		return "updateInfoForm";
	}
	
	// 내 정보 수정하기
	
	@RequestMapping("updateInfo.mg")
	public String updateInfo(@ModelAttribute Member m,@RequestParam(value="interest",required = false) String interest,Model model) {
		if(interest == null) {
			interest = "-";
		}
		
		System.out.println(interest);
		System.out.println();
		
		m.setInterest(interest);
		
		int result = mgService.updateInfo(m);
		
		if(result > 0) {
			model.addAttribute("loginUser",m);
			return "updateInfoForm";
		}else {
			throw new MemberException();
		}
		
	}
	
	// 프로필 사진 변경
	@RequestMapping("uploadprofile.mg")
	public void uploadprofile(@RequestParam("profile") MultipartFile uploadFile,HttpServletRequest request,HttpSession session,HttpServletResponse response) {
		System.out.println(uploadFile);
		String userId = ((Member)session.getAttribute("loginUser")).getId();
		
		if(uploadFile != null && !uploadFile.isEmpty()) {
			String renameFileName = saveFile(uploadFile, request);
			HashMap<String, String> map = new HashMap<>();
			map.put("id", userId);
			map.put("profile",renameFileName);
			
			if(renameFileName != null) {
				int result = mgService.updateprofile(map);
				if(result > 0) {
					((Member)session.getAttribute("loginUser")).setProfile(renameFileName);
					try {
						response.getWriter().print(result);
					} catch (IOException e) {
						e.printStackTrace();
					}
				}else {
					throw new MemberException("프로필 변경 실패!");
				}
				
				
			}
		}
	}
	
		// rename
	public String saveFile(MultipartFile file,HttpServletRequest request) {
			
			String root = request.getSession().getServletContext().getRealPath("resources");  // 작은 resources 위치 받아오기
			String savePath = root + "\\proFiles";
			
			File folder = new File(savePath);
			
			if(!folder.exists()) {   //폴더가 존재하지 않으면 폴더를 생성해줘라! 
				folder.mkdirs();
			}
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String originFileName = file.getOriginalFilename();
			String renameFileName = sdf.format(new Date(System.currentTimeMillis())) 
									+ "." 
									+ originFileName.substring(originFileName.lastIndexOf(".") + 1);    // 확장자 가져오는거
			String renamePath = folder + "\\" + renameFileName;
			
			
			try {
				file.transferTo(new File(renamePath));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		
			return renameFileName;
		}
		
//		// 후기
//		@RequestMapping("myreview.mg")
//		public String myreview() {
//			return "myreview";
//		}
	
		// 비밀번호 업데이트form
		@RequestMapping("updatePwdForm.mg")
		public String updatePwd() {
			return "updatePwdForm";
		}
		
		// 호스트 등록
		@RequestMapping("hostenrollForm.mg")
		public String hostenrollForm() {
			return "hostenrollForm";
		}
		
	
		
}

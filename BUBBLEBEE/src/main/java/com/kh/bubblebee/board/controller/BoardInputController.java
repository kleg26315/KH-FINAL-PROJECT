package com.kh.bubblebee.board.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bubblebee.board.model.exception.BoardException;
import com.kh.bubblebee.board.model.service.BoardService;
import com.kh.bubblebee.board.model.vo.Board;
import com.kh.bubblebee.board.model.vo.Option;


@Controller
public class BoardInputController {
	
	@Autowired
	private BoardService bService;
	
	@RequestMapping("binsertForm.bo")
	public String binsertForm() {
		return "boardInput";
	}
	
	@RequestMapping("binsert.bo")
	public String boardInsert(@ModelAttribute Board b, @ModelAttribute Option o, @RequestParam("uploadFile") List<MultipartFile> uploadFile,
								HttpServletRequest request, @RequestParam("post") String post,
								@RequestParam("address1") String address1, @RequestParam("address2") String address2, 
								@RequestParam("bTime") String bTime, @RequestParam("bDetail") String bDetail,
								@RequestParam("b_Qt") String b_Qt, @RequestParam("b_An") String b_An,
								@RequestParam("lat") String lat, @RequestParam("lon") String lon,
								@RequestParam("oname") String oname, @RequestParam("price") String price, @RequestParam("ocount") String ocount,
								@RequestParam("odeadline") String odeadline, @RequestParam(value="category", required=false) String cate, ModelAndView mv) {
	
		b.setLat(Double.parseDouble(lat));
		b.setLon(Double.parseDouble(lon));
		b.setLocation(post + "/" + address1 + "/" + address2);
		b.setFminfo(b_Qt + "<br>" + b_An);
		b.setFcalendar(bTime + "<br>" + bDetail);
		
		String[] name = oname.split(",");
		String[] pr = price.split(",");
		String[] count = ocount.split(",");
		String[] deadline = odeadline.split(",");
		
		HashMap<String, Option> map = new HashMap<>();
		if(deadline == null) {
			for(int i = 0; i < name.length; i++) {
				map.put("op" + i, new Option(name[i], pr[i], count[i], null));
			}
		}else if(deadline != null) {
			for(int i = 0; i < name.length; i++) {
				map.put("op" + i, new Option(name[i], pr[i], count[i], deadline[i]));
			}
		}
		
		String[] originalFileName = new String[uploadFile.size()];
		
		for(int i = 0; i<uploadFile.size(); i++) {
			originalFileName[i] = uploadFile.get(i).getOriginalFilename();
		}
		
		if(uploadFile != null && !uploadFile.isEmpty()) {
			//파일이 있다면! 
			String[] renameFileName = saveFile(uploadFile, request);
			String origin = "";
			String rename = "";
			int i = 0;
			if(renameFileName != null) {
				origin = String.join(",", originalFileName);
				rename = String.join(",", renameFileName);
				b.setOriginalFileName(origin);
				b.setRenameFileName(rename);
			}
					
		}
		
		int result1 = bService.insertBoard(b);
		
		int result2 = bService.insertBoardOption(map);
		
		if(result1 > 0) {
			if(result2 > 0) {
				return "redirect:list.bo?cate="+b.getCategory();
			}else {
				throw new BoardException("게시글 등록 실패!");
			}
		}else {
			throw new BoardException("게시글 등록 실패!");
		}
	
	}


	private String[] saveFile(List<MultipartFile> file, HttpServletRequest request) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\buploadFiles";
		
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		int i = 0;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String[] renameFileName = new String[file.size()]; 
		String[] originalFileName = new String[file.size()] ;
		
		while(i < file.size()) {
			String renamePath = folder + "\\";
			originalFileName[i] = file.get(i).getOriginalFilename(); // 원본 이름 넣는 곳
			renameFileName[i] = sdf.format(new Date(System.currentTimeMillis())) + "(" + i + ")" +"."
					+ originalFileName[i].substring(originalFileName[i].lastIndexOf(".") + 1);
			
			renamePath += renameFileName[i];
			try {
				file.get(i).transferTo(new File(renamePath));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			i++;
		}
		return renameFileName;
	}
	
	@RequestMapping("bupdate1.bo")
	public ModelAndView boardUpdateView(@RequestParam("fno") int fno,ModelAndView mv) {
		
		Board board = bService.selectBoard(fno);
		
		ArrayList<Option> oList = bService.selectOption(fno);
		
		if(board != null) {
			mv.addObject("board", board).addObject("fno", fno).addObject("oList",oList).setViewName("boardUpdate2");
			return mv;
		} else {
			throw new BoardException("게시글 수정 요청 실패");
		}
	}
	
	@RequestMapping("bupdate2.bo")
	public ModelAndView boardUpdate(@ModelAttribute Board b,  @ModelAttribute Option o, @RequestParam("reloadFile") List<MultipartFile> reloadFile,
									@RequestParam("post") String post, @RequestParam("address1") String address1, @RequestParam("address2") String address2, 
									@RequestParam("bTime") String bTime, @RequestParam("bDetail") String bDetail,
									@RequestParam("b_Qt") String b_Qt, @RequestParam("b_An") String b_An,
									@RequestParam("lat") String lat, @RequestParam("lon") String lon,
									@RequestParam("oname") String oname, @RequestParam("price") String price, @RequestParam("ocount") String ocount,
									@RequestParam("odeadline") String odeadline, @RequestParam(value="category", required=false) String cate,
									HttpServletRequest request, ModelAndView mv) {
		
		b.setLat(Double.parseDouble(lat));
		b.setLon(Double.parseDouble(lon));
		b.setLocation(post + "/" + address1 + "/" + address2);
		b.setFminfo(b_Qt + "<br>" + b_An);
		b.setFcalendar(bTime + "<br>" + bDetail);
	
		String[] name = oname.split(",");
		String[] pr = price.split(",");
		String[] count = ocount.split(",");
		String[] deadline = odeadline.split(",");
		
		HashMap<String, Option> map = new HashMap<>();
		if(deadline == null) {
			for(int i = 0; i < name.length; i++) {
				map.put("op" + i, new Option(name[i], pr[i], count[i], null));
			}
		}else {
			for(int i = 0; i < name.length; i++) {
				map.put("op" + i, new Option(name[i], pr[i], count[i], deadline[i]));
			}
		}
		
		String[] originalFileName = new String[reloadFile.size()];
		
		for(int i = 0; i<reloadFile.size(); i++) {
			originalFileName[i] = reloadFile.get(i).getOriginalFilename();
		}
		
		if(reloadFile != null && !reloadFile.isEmpty()) {
			if(b.getRenameFileName() != null) {
				deleteFile(b.getRenameFileName(), request);
			}
			
			String[] renameFileName = saveFile(reloadFile, request);
			String origin = "";
			String rename = "";
			int i = 0;
			if(renameFileName != null) {
				origin = String.join(",", originalFileName);
				rename = String.join(",", renameFileName);
				b.setOriginalFileName(origin);
				b.setRenameFileName(rename);
			}
		}
		
		int result1 = bService.boardUpdate(b);
	
		int result2 = bService.boardUpdateOption(map);
		
		if(result1 > 0) {
			if(result2 > 0) {
				mv.addObject("lat", b.getLat());
				mv.addObject("lon", b.getLon());
				mv.addObject("location", b.getLocation());
				mv.addObject("fminfo", b.getFminfo());
				mv.addObject("fcalendar", b.getFcalendar());
				mv.setViewName("redirect:bdetail.bo?fno=" + b.getFno());
			}else {
				throw new BoardException("게시글 수정 실패!");
			}
		} else {
			throw new BoardException("게시글 수정 실패");
		}
		
		return mv;
	}
	
	//첨부된 파일 삭제
		public void deleteFile(String fileName, HttpServletRequest request) {
			String root = request.getSession().getServletContext().getRealPath("resources");
			String savePath = root + "\\buploadFiles";
			
			File f = new File(savePath + "\\" + fileName);
			
			if(f.exists()) {
				f.delete();
			}
		}
		
		//게시글 삭제
		@RequestMapping("bdelete.bo")
		public String deleteBoard(@RequestParam("fno") int fno) {
			int result1 = bService.deleteBoard(fno);
			int result2 = bService.deleteBoardOption(fno);
			
			if(result1 > 0 ) {
				if(result2 > 0) {
					return "redirect:hostpage.ho";
				}else {
					throw new BoardException("게시글 삭제 실패 옵션 안지워짐");
				}
			}else {
				throw new BoardException("게시글 삭제 실패");
			}
		}
		
	}

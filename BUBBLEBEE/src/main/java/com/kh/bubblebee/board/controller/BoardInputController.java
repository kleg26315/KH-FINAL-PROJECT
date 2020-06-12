package com.kh.bubblebee.board.controller;

import java.util.Date;
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
import com.kh.bubblebee.board.model.vo.Board;
import com.kh.bubblebee.board.model.vo.Option;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;

import com.kh.bubblebee.board.model.service.BoardService;


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
								@RequestParam("oname") String oname, @RequestParam("price") String price, @RequestParam("ocount") String ocount,
								@RequestParam("category") String cate, ModelAndView mv) {
		
		b.setLocation(post + "/" + address1 + "/" + address2);
		b.setFminfo(b_Qt + "<br>" + b_An);
		b.setFcalendar(bTime + " " + bDetail);
//		for(int i = 0; i< bDetail.size(); i++) {
//			System.out.println(bTime.get(i) + " " +bDetail.get(i));
//		}
//		System.out.println("fcla : " + b.getFcalendar());
		
		String[] name = oname.split(",");
		String[] pr = price.split(",");
		String[] count = ocount.split(",");
		
		HashMap<String, Option> map = new HashMap<>();
		for(int i = 0; i < name.length; i++) {
			map.put("op" + i, new Option(name[i], pr[i], count[i]));
		}
		
		System.out.println(b);
		
		String[] originalFileName = new String[uploadFile.size()];
		
		for(int i = 0; i<uploadFile.size(); i++) {
			originalFileName[i] = uploadFile.get(i).getOriginalFilename();
			System.out.println("uploadFile : " +  uploadFile.get(i).getOriginalFilename());
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
	
	
	}

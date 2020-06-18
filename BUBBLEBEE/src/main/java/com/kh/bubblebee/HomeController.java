package com.kh.bubblebee;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bubblebee.board.model.service.BoardService;
import com.kh.bubblebee.board.model.vo.Board;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	public BoardService bService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "home";
	}
	
	@RequestMapping("home.do")
	public String homeView() {
		return "home";
	}
	
	@RequestMapping("location.do")
	public void markLocation(HttpServletResponse response) {
		response.setContentType("application/json; charset=utf-8");
		
		ArrayList<Board> locInfo = bService.markLocation();
		
		JSONArray jArr = new JSONArray();
		for(Board b : locInfo) {
			JSONObject obj = new JSONObject();
			obj.put("fno", b.getFno());
			obj.put("cat", b.getCategory());
			obj.put("lat", b.getLat());
			obj.put("lon", b.getLon());
			
			jArr.add(obj);
		}
		
		JSONObject sendList = new JSONObject();
		sendList.put("list", jArr);
		
		try {
			PrintWriter out = response.getWriter();
			out.println(sendList);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping("detail.do")
	public ModelAndView detailView(@RequestParam("fno") int fno, ModelAndView mv) {
		mv.addObject("fno", fno)
		  .setViewName("redirect:detail.bo");
		return mv;
	}
}

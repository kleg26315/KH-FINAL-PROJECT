package com.kh.bubblebee.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.bubblebee.board.model.vo.Board;
import com.kh.bubblebee.board.model.vo.Option;
import com.kh.bubblebee.board.model.vo.Review;
import com.kh.bubblebee.board.model.vo.SearchCondition;
import com.kh.bubblebee.common.PageInfo;
import com.kh.bubblebee.host.model.vo.Host;
import com.kh.bubblebee.member.model.vo.Member;

public interface BoardService {

	int getListCount(String cate);

	ArrayList<Board> selectList(PageInfo pi, String cate);

	ArrayList<Board> selectLtList(String cate);

	ArrayList<Board> selectHtList(String cate);

	int insertBoard(Board b);

	int insertBoardOption(Option o);
	
	Board selectBoard(int fno);

	Host selectHost(String hostId);
  
	int getSearchListCount(HashMap<String, Object> map);

	ArrayList<Board> selectSearchList(HashMap<String, Object> map, PageInfo pi);

	int getHeartCount(HashMap<String, Object> map);

	
}

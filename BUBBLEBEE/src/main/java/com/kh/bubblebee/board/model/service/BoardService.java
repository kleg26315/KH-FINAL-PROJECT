package com.kh.bubblebee.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.bubblebee.board.model.vo.Board;
import com.kh.bubblebee.board.model.vo.Review;
import com.kh.bubblebee.board.model.vo.SearchCondition;
import com.kh.bubblebee.common.PageInfo;

public interface BoardService {

	int getListCount();

	ArrayList<Board> selectList(PageInfo pi, String cate);

	ArrayList<Board> selectLtList(String cate);

	ArrayList<Board> selectHtList(String cate);

	int insertBoard(Board b);

	int getSearchListCount(SearchCondition sc);

	ArrayList<Board> selectSearchList(HashMap<String, Object> map, PageInfo pi);
	
}

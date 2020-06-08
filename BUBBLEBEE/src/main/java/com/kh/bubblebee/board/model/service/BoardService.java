package com.kh.bubblebee.board.model.service;

import java.util.ArrayList;

import com.kh.bubblebee.board.model.vo.Board;
import com.kh.bubblebee.board.model.vo.Review;
import com.kh.bubblebee.common.PageInfo;
import com.kh.bubblebee.member.model.vo.Member;

public interface BoardService {

	int getListCount();

	ArrayList<Board> selectList(PageInfo pi, String cate);

	ArrayList<Board> selectLtList(String cate);

	ArrayList<Board> selectHtList(String cate);

	int insertBoard(Board b);

	Board selectBoard(int fno);

	Member selectHost(String hostId);
	
}

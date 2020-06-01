package com.kh.bubblebee.board.service;

import java.util.ArrayList;

import com.kh.bubblebee.board.model.vo.Board;
import com.kh.bubblebee.common.PageInfo;

public interface BoardService {

	int getListCount();

	ArrayList<Board> selectList(PageInfo pi);

	int insertBoard(Board b);

}

package com.kh.bubblebee.notice.model.service;

import java.util.ArrayList;

import com.kh.bubblebee.board.model.vo.Board;
import com.kh.bubblebee.common.PageInfo;

public interface NoticeService {

	int insertNotice(String title, String content);

	int getListCount();

	ArrayList<Board> selectList(PageInfo pi);

}

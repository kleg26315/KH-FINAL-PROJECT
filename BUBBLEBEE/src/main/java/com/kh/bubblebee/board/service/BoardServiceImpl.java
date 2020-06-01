package com.kh.bubblebee.board.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bubblebee.board.model.dao.BoardDAO;
import com.kh.bubblebee.board.model.vo.Board;
import com.kh.bubblebee.common.PageInfo;

@Service("bService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO bDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int getListCount() {
		return bDAO.getListCount(sqlSession);
	}

	@Override
	public ArrayList<Board> selectList(PageInfo pi) {
		return bDAO.selectList(sqlSession, pi);
	}

	@Override
	public int insertBoard(Board b) {
		// TODO Auto-generated method stub
		return bDAO.insertBoard(sqlSession, b);
	}

}

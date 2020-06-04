package com.kh.bubblebee.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bubblebee.board.model.dao.BoardDAO;
import com.kh.bubblebee.board.model.vo.Board;
import com.kh.bubblebee.board.model.vo.Review;
import com.kh.bubblebee.board.model.vo.SearchCondition;
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
	public ArrayList<Board> selectList(PageInfo pi, String cate) {
		return bDAO.selectList(sqlSession, pi, cate);
	}

	@Override
	public ArrayList<Board> selectLtList(String cate) {
		return bDAO.selectLtList(sqlSession, cate);
	}

	@Override
	public ArrayList<Board> selectHtList(String cate) {
		return bDAO.selectHtList(sqlSession, cate);
	}

	@Override
	public int insertBoard(Board b) {
		// TODO Auto-generated method stub
		return bDAO.insertBoard(sqlSession, b);
	}

	@Override
	public int getSearchListCount(SearchCondition sc) {
		return bDAO.getSearchListCount(sqlSession, sc);
	}

	@Override
	public ArrayList<Board> selectSearchList(HashMap<String, Object> map, PageInfo pi) {
		return bDAO.selectSearchList(sqlSession, map, pi);
	}




}

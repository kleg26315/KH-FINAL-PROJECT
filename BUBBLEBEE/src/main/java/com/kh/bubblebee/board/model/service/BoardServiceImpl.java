package com.kh.bubblebee.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bubblebee.board.model.dao.BoardDAO;
import com.kh.bubblebee.board.model.vo.Board;
import com.kh.bubblebee.board.model.vo.Option;
import com.kh.bubblebee.common.PageInfo;
import com.kh.bubblebee.host.model.vo.Host;

@Service("bService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO bDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int getListCount(String cate) {
		return bDAO.getListCount(sqlSession, cate);
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
	public int insertBoardOption(HashMap<String, Option> map) {
		// TODO Auto-generated method stub
		return bDAO.insertBoardOption(sqlSession, map);
	}
	
	@Override
	public Board selectBoard(int fno) {
		return bDAO.selectBoard(sqlSession, fno);
	}

	@Override
	public Host selectHost(String hostId) {
		return bDAO.selectHost(sqlSession, hostId);
	}

  @Override
	public int getSearchListCount(HashMap<String, Object> map) {
		return bDAO.getSearchListCount(sqlSession, map);
	}

	@Override
	public ArrayList<Board> selectSearchList(HashMap<String, Object> map, PageInfo pi) {
		return bDAO.selectSearchList(sqlSession, map, pi);
	}

	@Override
	public int insertHeart(HashMap<String, Object> map) {
		return bDAO.insertHeart(sqlSession, map);
	}

	@Override
	public int readHeart(HashMap<String, Object> map) {
		return bDAO.readHeart(sqlSession, map);
	}

	@Override
	public int deleteHeart(HashMap<String, Object> map) {
		return bDAO.deleteHeart(sqlSession, map);
	}


	

}

package com.kh.bubblebee.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bubblebee.board.model.vo.Board;
import com.kh.bubblebee.board.model.vo.Review;
import com.kh.bubblebee.board.model.vo.SearchCondition;
import com.kh.bubblebee.common.PageInfo;
import com.kh.bubblebee.member.model.vo.Member;

@Repository("bDAO")
public class BoardDAO {

	public int getListCount(SqlSessionTemplate sqlSession, String cate) {
		return sqlSession.selectOne("boardMapper.getListCount", cate);
	}

	public ArrayList<Board> selectList(SqlSessionTemplate sqlSession, PageInfo pi, String cate) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectList", cate, rowBounds);
	}
	
	public ArrayList<Board> selectLtList(SqlSessionTemplate sqlSession, String cate) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectLtList", cate);
	}

	public ArrayList<Board> selectHtList(SqlSessionTemplate sqlSession, String cate) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectHtList", cate);
	}

	public int insertBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.insertBoard", b);
	}
	
	public int insertBoardOption(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.insertBoardOption", b);
	}

	public Board selectBoard(SqlSessionTemplate sqlSession, int fno) {
		return sqlSession.selectOne("boardMapper.selectBoard", fno);
	}

	public Member selectHost(SqlSessionTemplate sqlSession, String hostId) {
		return sqlSession.selectOne("memberMapper.selectHost", hostId);
	}

	public int getSearchListCount(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.selectOne("boardMapper.getSearchListCount", map);
	}

	public ArrayList<Board> selectSearchList(SqlSessionTemplate sqlSession, HashMap<String, Object> map, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectSearchList", map, rowBounds);
	}
	
}

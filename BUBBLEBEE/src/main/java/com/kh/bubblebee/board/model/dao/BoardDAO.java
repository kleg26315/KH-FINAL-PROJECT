package com.kh.bubblebee.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bubblebee.board.model.vo.Board;
import com.kh.bubblebee.board.model.vo.Review;
import com.kh.bubblebee.common.PageInfo;

@Repository("bDAO")
public class BoardDAO {

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.getListCount");
	}

	public ArrayList<Board> selectList(SqlSessionTemplate sqlSession, PageInfo pi, String cate) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectList", cate, rowBounds);
	}

	public ArrayList<Review> getReviewGrade(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("boardMapper.getReviewGrade");
	}

	public ArrayList<Board> selectLtList(SqlSessionTemplate sqlSession, String cate) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectLtList", cate);
	}

	public ArrayList<Board> selectHtList(SqlSessionTemplate sqlSession, String cate) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectHtList", cate);
	}
	
}

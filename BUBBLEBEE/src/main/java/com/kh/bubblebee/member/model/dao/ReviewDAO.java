package com.kh.bubblebee.member.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bubblebee.board.model.vo.Review;
import com.kh.bubblebee.common.PageInfo;

@Repository("rDAO")
public class ReviewDAO {

	public int getmyReviewListCount(SqlSessionTemplate sqlSession, String user_id) {
		return sqlSession.selectOne("reviewMapper.getmyReviewListCount", user_id);
	}

	public ArrayList<Review> selectmyReviewList(SqlSessionTemplate sqlSession, PageInfo pi, String user_id) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("reviewMapper.selectmyReviewList", user_id, rowBounds);
	}

	public int insertReview(SqlSessionTemplate sqlSession, Review r) {
		return sqlSession.insert("reviewMapper.insertReview", r);
	}

}

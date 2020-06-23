package com.kh.bubblebee.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bubblebee.board.model.vo.Review;
import com.kh.bubblebee.common.PageInfo;
import com.kh.bubblebee.member.model.dao.ReviewDAO;

@Service("rService")
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewDAO rDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int myReviewListCount(String user_id) {
		return rDAO.getmyReviewListCount(sqlSession, user_id);
	}

	@Override
	public ArrayList<Review> selectMyReviewList(PageInfo pi, String user_id) {
		return rDAO.selectmyReviewList(sqlSession, pi, user_id);
	}

	@Override
	public int insertReview(Review r) {
		return rDAO.insertReview(sqlSession, r);
	}
	
	

}

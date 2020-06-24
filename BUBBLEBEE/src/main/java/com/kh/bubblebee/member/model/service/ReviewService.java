package com.kh.bubblebee.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.bubblebee.board.model.vo.Review;
import com.kh.bubblebee.common.PageInfo;

public interface ReviewService {

	int myReviewListCount(String user_id);

	ArrayList<Review> selectMyReviewList(PageInfo pi, String user_id);

	int insertReview(Review r);

	int updateReviewGrade(Review r);

	Review selectMyReview(int qno);

	int updateReview(Review r);

	int deleteReviewGrade(HashMap<String, Integer> map);

}

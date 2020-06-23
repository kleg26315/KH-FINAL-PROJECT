package com.kh.bubblebee.member.model.service;

import java.util.ArrayList;

import com.kh.bubblebee.board.model.vo.Review;
import com.kh.bubblebee.common.PageInfo;

public interface ReviewService {

	int myReviewListCount(String user_id);

	ArrayList<Review> selectMyReviewList(PageInfo pi, String user_id);

	int insertReview(Review r);

}

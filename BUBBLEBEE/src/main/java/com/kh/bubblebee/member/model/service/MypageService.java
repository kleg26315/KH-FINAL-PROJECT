package com.kh.bubblebee.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.bubblebee.common.PageInfo;
import com.kh.bubblebee.member.model.vo.Member;
import com.kh.bubblebee.purchase.model.vo.PPoint;

public interface MypageService {

	// 내 정보 수정
	int updateInfo(Member m);

	// 프로필 바꾸기
	int updateprofile(HashMap<String, String> map);

	// 마일리지 목록 개수
	int getListCount(String userId);

	// 마일리지 전체 목록
	ArrayList<PPoint> selectpList(PageInfo pi, String userId);

	
	
}

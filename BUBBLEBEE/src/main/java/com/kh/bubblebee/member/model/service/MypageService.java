package com.kh.bubblebee.member.model.service;

import java.util.HashMap;

import com.kh.bubblebee.member.model.vo.Member;

public interface MypageService {

	// 내 정보 수정
	int updateInfo(Member m);

	// 프로필 바꾸기
	int updateprofile(HashMap<String, String> map);
	
}

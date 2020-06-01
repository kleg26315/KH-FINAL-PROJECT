package com.kh.bubblebee.member.model.service;

import java.util.HashMap;

import com.kh.bubblebee.member.model.vo.Member;

public interface MemberService {

	Member checkMember(String id);

	int signupMember(Member member);

	Member memberLogin(Member m);

	int insertMember(Member m);

	int insertkakaoMember(HashMap<String, String> userInfo);

}

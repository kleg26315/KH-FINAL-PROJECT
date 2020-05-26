package com.kh.bubblebee.member.model.service;

import com.kh.bubblebee.member.model.vo.Member;

public interface MemberService {

	Member checkMember(String id);

	int signupMember(Member member);

	Member memberLogin(Member m);

	int insertMember(Member m);

}

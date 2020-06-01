package com.kh.bubblebee.member.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bubblebee.member.model.vo.Member;

@Repository("mDAO")
public class MemberDAO {

	public Member checkMember(SqlSessionTemplate sqlSession, String id) {
		return (Member)sqlSession.selectOne("memberMapper.checkMember", id);
	}

	public int signupMember(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.insert("memberMapper.signupMember", member);
	}

	public Member memberLogin(SqlSessionTemplate sqlSession, Member m) {
		return (Member)sqlSession.selectOne("memberMapper.memberLogin", m);
	}

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		System.out.println("dao");
		int r = sqlSession.insert("memberMapper.insertMember", m);
		return r;
	}

	public int insertkakaoMember(SqlSessionTemplate sqlSession, HashMap<String, String> userInfo) {
		return sqlSession.insert("memberMapper.insertkakaoMember", userInfo);
	}

}

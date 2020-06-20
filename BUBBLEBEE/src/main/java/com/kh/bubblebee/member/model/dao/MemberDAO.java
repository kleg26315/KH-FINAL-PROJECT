package com.kh.bubblebee.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bubblebee.board.model.vo.Board;
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

	public int memberUpdatePwd(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.update("memberMapper.updatePwd", map);
	}

	public int setPoint(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.insert("memberMapper.setPoint", id);
	}

	public int getPoint(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("memberMapper.getPoint", id);
	}

	public ArrayList<Board> getSlist(SqlSessionTemplate sqlSession, String id) {
		return (ArrayList)sqlSession.selectList("memberMapper.getSlist", id);
	}

	public ArrayList<Board> getHlist(SqlSessionTemplate sqlSession, String id) {
		return (ArrayList)sqlSession.selectList("memberMapper.getHlist",id);
	}

	public Member loginCheck(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.selectOne("memberMapper.loginCheck", email);
	}

}

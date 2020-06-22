package com.kh.bubblebee.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bubblebee.board.model.vo.Board;
import com.kh.bubblebee.member.model.dao.MemberDAO;
import com.kh.bubblebee.member.model.vo.Member;

@Service("mService")
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDAO mDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Member checkMember(String id) {
		return mDAO.checkMember(sqlSession, id);
	}

	@Override
	public int signupMember(Member member) {
		return mDAO.signupMember(sqlSession, member);
	}

	@Override
	public Member memberLogin(Member m) {
		return mDAO.memberLogin(sqlSession, m);
	}

	@Override
	public int insertMember(Member m) {
		System.out.println("service");
		return mDAO.insertMember(sqlSession, m);
	}

	@Override
	public int insertkakaoMember(HashMap<String, String> userInfo) {
		return mDAO.insertkakaoMember(sqlSession, userInfo);
	}

	@Override
	public int memberPwdUpdate(HashMap<String, String> map) {
		return mDAO.memberUpdatePwd(sqlSession,map);
	}

	@Override
	public int setPoint(String id) {
		return mDAO.setPoint(sqlSession, id);
	}

	@Override
	public int getPoint(String id) {
		return mDAO.getPoint(sqlSession, id);
	}

	@Override
	public ArrayList<Board> getSlist(String id) {
		return mDAO.getSlist(sqlSession, id);
	}

	@Override
	public ArrayList<Board> getHlist(String id) {
		return mDAO.getHlist(sqlSession,id);
	}

	@Override
	public Member loginCheck(String email) {
		return mDAO.loginCheck(sqlSession, email);
	}

	@Override
	public Member emailSameCheck(String id) {
		return mDAO.emailSameCheck(sqlSession, id);
	}

}

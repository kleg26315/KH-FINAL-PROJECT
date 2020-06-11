package com.kh.bubblebee.member.model.service;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bubblebee.member.model.dao.MypageDAO;
import com.kh.bubblebee.member.model.vo.Member;

@Service("mgService")
public class MypageServiceImpl implements MypageService{

	@Autowired
	private MypageDAO mgDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int updateInfo(Member m) {
		return mgDAO.updateInfo(sqlSession,m);
	}

	@Override
	public int updateprofile(HashMap<String, String> map) {
		return mgDAO.updateprofile(sqlSession,map);
	}
	
	
	
	
}

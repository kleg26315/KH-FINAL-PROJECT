package com.kh.bubblebee.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bubblebee.common.PageInfo;
import com.kh.bubblebee.member.model.dao.MypageDAO;
import com.kh.bubblebee.member.model.vo.Member;
import com.kh.bubblebee.purchase.model.vo.PPoint;

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

	@Override
	public int getListCount(String userId) {
		return mgDAO.getListCount(sqlSession,userId);
	}

	@Override
	public ArrayList<PPoint> selectpList(PageInfo pi, String userId) {
		return mgDAO.selectpList(sqlSession,pi,userId);
	}

	
	
	
}

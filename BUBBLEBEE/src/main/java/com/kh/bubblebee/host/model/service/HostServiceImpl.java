package com.kh.bubblebee.host.model.service;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bubblebee.host.model.dao.HostDAO;
import com.kh.bubblebee.host.model.vo.Host;
import com.kh.bubblebee.member.model.vo.Member;

@Service("hService")
public class HostServiceImpl implements HostService{

	@Autowired
	private HostDAO hDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int updateMemberInfo(Member m) {
		return hDAO.updateMemberInfo(sqlSession,m);
	}

	@Override
	public int enrollHost(Host h) {
		return hDAO.enrollHost(sqlSession,h);
	}

}

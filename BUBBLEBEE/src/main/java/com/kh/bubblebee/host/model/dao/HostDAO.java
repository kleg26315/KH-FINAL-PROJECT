package com.kh.bubblebee.host.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bubblebee.host.model.vo.Host;
import com.kh.bubblebee.member.model.vo.Member;

@Repository("hDAO")
public class HostDAO {

	public int updateMemberInfo(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("hostMapper.updateMemberInfo", m);
	}

	public int enrollHost(SqlSessionTemplate sqlSession, Host h) {
		return sqlSession.insert("hostMapper.enrollHost", h);
	}

	
}

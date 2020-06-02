package com.kh.bubblebee.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bubblebee.member.model.vo.Member;

@Repository("mgDAO")
public class MypageDAO {

	public int updateInfo(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("mypageMapper.updateInfo", m);
	}

}

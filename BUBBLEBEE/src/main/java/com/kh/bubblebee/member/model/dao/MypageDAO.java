package com.kh.bubblebee.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bubblebee.common.PageInfo;
import com.kh.bubblebee.member.model.vo.Member;
import com.kh.bubblebee.purchase.model.vo.PPoint;

@Repository("mgDAO")
public class MypageDAO {

	public int updateInfo(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("mypageMapper.updateInfo", m);
	}

	public int updateprofile(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.update("mypageMapper.updateprofile", map);
	}

	public int getListCount(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("mypageMapper.getListCount",userId);
	}

	public ArrayList<PPoint> selectpList(SqlSessionTemplate sqlSession, PageInfo pi, String userId) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("mypageMapper.selectpList",userId,rowBounds);
	}

}

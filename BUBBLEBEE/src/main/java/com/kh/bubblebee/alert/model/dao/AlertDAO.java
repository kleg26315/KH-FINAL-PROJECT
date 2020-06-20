package com.kh.bubblebee.alert.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bubblebee.alert.model.vo.Alert;

@Repository("aDAO")
public class AlertDAO {
	
	public int count_receive(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("memberMapper.count_receivce", id);
	}

	public ArrayList<Alert> receive_data(SqlSessionTemplate sqlSession, String id) {
		return (ArrayList)sqlSession.selectList("memberMapper.receivce_data", id);
	}

	public int checkAllAlert(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.update("memberMapper.checkAllAlert", id);
	}
}

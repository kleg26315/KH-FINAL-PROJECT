package com.kh.bubblebee.account.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bubblebee.account.model.vo.Account;
import com.kh.bubblebee.common.PageInfo;

@Repository("acDAO")
public class AccountDAO {

	public int getAccountListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("accountMapper.getAccountListCount");
	}

	public ArrayList<Account> selectAccountList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1 ) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("accountMapper.selectAccountList", null, rowBounds);
	}

	public ArrayList<Account> selectAllAccountList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("accountMapper.selectAllAccountList");
	}

	public int agreeAccount(SqlSessionTemplate sqlSession, String acno) {
		return sqlSession.update("accountMapper.agreeAccount", acno);
	}

}

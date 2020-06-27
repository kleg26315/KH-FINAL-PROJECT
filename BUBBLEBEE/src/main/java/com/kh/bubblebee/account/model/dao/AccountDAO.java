package com.kh.bubblebee.account.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bubblebee.common.PageInfo;
import com.kh.bubblebee.host.model.vo.Aclist;

@Repository("acDAO")
public class AccountDAO {

	public int getAccountListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("accountMapper.getAccountListCount");
	}

	public ArrayList<Aclist> selectAccountList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1 ) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("accountMapper.selectAccountList", null, rowBounds);
	}

	public ArrayList<Aclist> selectAllAccountList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("accountMapper.selectAllAccountList");
	}

	public int agreeAccount(SqlSessionTemplate sqlSession, String fno, String id, String ftitle, String people, String sales, String amount) {
		HashMap<String, String> map = new HashMap<>();
		map.put("fno", fno);
		map.put("id", id);
		map.put("ftitle", ftitle);
		map.put("people", people);
		map.put("sales", sales);
		map.put("amount", amount);
		return sqlSession.insert("accountMapper.agreeAccount", map);
	}

	public int updateBuying(SqlSessionTemplate sqlSession, String fno, String id, String bdate) {
		HashMap<String, String> map = new HashMap<>();
		map.put("fno", fno);
		map.put("id", id);
		map.put("bdate", bdate);
		return sqlSession.update("accountMapper.updateBuying", map);
	}

}

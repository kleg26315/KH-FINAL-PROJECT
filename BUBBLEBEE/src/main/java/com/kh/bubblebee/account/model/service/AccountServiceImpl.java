package com.kh.bubblebee.account.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bubblebee.account.model.dao.AccountDAO;
import com.kh.bubblebee.common.PageInfo;
import com.kh.bubblebee.host.model.vo.Aclist;

@Service("acService")
public class AccountServiceImpl implements AccountService {
	
	@Autowired
	private AccountDAO acDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int getAccountListCount() {
		return acDAO.getAccountListCount(sqlSession);
	}

	@Override
	public ArrayList<Aclist> selectAccountList(PageInfo pi) {
		return acDAO.selectAccountList(sqlSession ,pi);
	}

	@Override
	public ArrayList<Aclist> selectAllAccountList() {
		return acDAO.selectAllAccountList(sqlSession);
	}

	@Override
	public int agreeAccount(String fno, String id, String ftitle, String people, String sales, String amount) {
		return acDAO.agreeAccount(sqlSession, fno, id, ftitle, people, sales, amount);
	}

	@Override
	public int updateBuying(String fno, String id, String bdate) {
		return acDAO.updateBuying(sqlSession, fno, id, bdate);
	}
}

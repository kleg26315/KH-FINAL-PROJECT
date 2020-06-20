package com.kh.bubblebee.account.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bubblebee.account.model.dao.AccountDAO;
import com.kh.bubblebee.account.model.vo.Account;
import com.kh.bubblebee.common.PageInfo;

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
	public ArrayList<Account> selectAccountList(PageInfo pi) {
		return acDAO.selectAccountList(sqlSession ,pi);
	}

	@Override
	public ArrayList<Account> selectAllAccountList() {
		return acDAO.selectAllAccountList(sqlSession);
	}

	@Override
	public int agreeAccount(String acno) {
		return acDAO.agreeAccount(sqlSession, acno);
	}
}

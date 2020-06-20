package com.kh.bubblebee.account.model.service;

import java.util.ArrayList;

import com.kh.bubblebee.account.model.vo.Account;
import com.kh.bubblebee.common.PageInfo;

public interface AccountService {

	int getAccountListCount();

	ArrayList<Account> selectAccountList(PageInfo pi);

	ArrayList<Account> selectAllAccountList();

	int agreeAccount(String acno);

}

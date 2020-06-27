package com.kh.bubblebee.account.model.service;

import java.util.ArrayList;

import com.kh.bubblebee.common.PageInfo;
import com.kh.bubblebee.host.model.vo.Aclist;

public interface AccountService {

	int getAccountListCount();

	ArrayList<Aclist> selectAccountList(PageInfo pi);

	ArrayList<Aclist> selectAllAccountList();

	int agreeAccount(String fno, String id, String ftitle, String people, String sales, String amount);

	int updateBuying(String fno, String id, String bdate);

}

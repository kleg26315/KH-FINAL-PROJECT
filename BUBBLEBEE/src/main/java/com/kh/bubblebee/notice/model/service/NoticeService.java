package com.kh.bubblebee.notice.model.service;

import java.util.ArrayList;

import com.kh.bubblebee.common.PageInfo;
import com.kh.bubblebee.notice.model.vo.Notice;

public interface NoticeService {

	int insertNotice(String title, String content);

	int insertFAQ(String title, String content, int btype);

	int getNoticeListCount();

	ArrayList<Notice> selectNoticeList(PageInfo pi);

	int getFAQListCount();

	ArrayList<Notice> selectFAQList(PageInfo pi);

	ArrayList<Notice> selectFAQFilterList(String number);

}

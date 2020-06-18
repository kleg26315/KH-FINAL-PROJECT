package com.kh.bubblebee.notice.model.service;

import java.util.ArrayList;

import com.kh.bubblebee.common.PageInfo;
import com.kh.bubblebee.notice.model.vo.Notice;

public interface NoticeService {

	int insertNotice(String title, String content);

	int insertFAQ(String title, String content, int btype);

	int getNoticeListCount();

	ArrayList<Notice> selectNoticeList(PageInfo pi);

	int getFAQListCount(String number);

	ArrayList<Notice> selectFAQList(PageInfo pi, String number);

	ArrayList<Notice> selectFAQFilterList(PageInfo pi, String number);

	int getFAQFilterListCount(String number);

	int deleteFAQ(String bno);

	Notice selectupdateFAQ(String bno);

	int updateFAQ(String title, String content, int btype, String bno);

	int getFAQSearchListCount(String faqSearch);

	ArrayList<Notice> selectFAQSearchList(PageInfo pi, String faqSearch);

	int updateNotice(String title, String content, String bno);

	String selectBno(String title, String content);

	ArrayList<String> selectAllId();

	void insertAlert(String id, String title, String bno);

}

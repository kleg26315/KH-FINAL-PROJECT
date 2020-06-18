package com.kh.bubblebee.notice.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bubblebee.common.PageInfo;
import com.kh.bubblebee.notice.model.dao.NoticeDAO;
import com.kh.bubblebee.notice.model.vo.Notice;

@Service("nService")
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private NoticeDAO nDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertNotice(String title, String content) {
		return nDAO.insertNotice(sqlSession, title, content); 
	}

	@Override
	public int insertFAQ(String title, String content, int btype) {
		return nDAO.insertFAQ(sqlSession, title, content, btype);
	}

	@Override
	public int getNoticeListCount() {
		return nDAO.getNoticeListCount(sqlSession);
	}

	@Override
	public ArrayList<Notice> selectNoticeList(PageInfo pi) {
		return nDAO.selectNoticeList(sqlSession, pi);
	}

	@Override
	public int getFAQListCount(String number) {
		return nDAO.getFAQListCount(sqlSession, number);
	}

	@Override
	public ArrayList<Notice> selectFAQList(PageInfo pi, String number) {
		return nDAO.selectFAQList(sqlSession, pi, number);
	}

	@Override
	public ArrayList<Notice> selectFAQFilterList(PageInfo pi, String number) {
		return nDAO.selectFAQFilterList(sqlSession, pi, number);
	}

	@Override
	public int getFAQFilterListCount(String number) {
		return nDAO.getFAQFilterListCount(sqlSession, number);
	}

	@Override
	public int deleteFAQ(String bno) {
		return nDAO.deleteFAQ(sqlSession, bno);
	}

	@Override
	public Notice selectupdateFAQ(String bno) {
		return nDAO.selectupdateFAQ(sqlSession, bno);
	}

	@Override
	public int updateFAQ(String title, String content, int btype, String bno) {
		return nDAO.updateFAQ(sqlSession, title, content, btype, bno);
	}

	@Override
	public int getFAQSearchListCount(String faqSearch) {
		return nDAO.getFAQSearchListCount(sqlSession, faqSearch);
	}

	@Override
	public ArrayList<Notice> selectFAQSearchList(PageInfo pi, String faqSearch) {
		return nDAO.selectFAQSearchList(sqlSession, pi, faqSearch);
	}

	@Override
	public int updateNotice(String title, String content, String bno) {
		return nDAO.updateNotice(sqlSession, title, content, bno);
	}

	@Override
	public String selectBno(String title, String content) {
		return nDAO.selectBno(sqlSession, title, content);
	}

	@Override
	public ArrayList<String> selectAllId() {
		return nDAO.selectAllId(sqlSession);
	}

	@Override
	public void insertAlert(String id, String title, String bno) {
		nDAO.insertAlert(sqlSession, id, title, bno);
	}
	
}

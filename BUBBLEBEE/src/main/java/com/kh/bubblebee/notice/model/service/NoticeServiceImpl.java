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
	
}

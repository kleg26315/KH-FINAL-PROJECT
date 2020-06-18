package com.kh.bubblebee.notice.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bubblebee.common.PageInfo;
import com.kh.bubblebee.notice.model.vo.Notice;

@Repository("nDAO")
public class NoticeDAO {

	public int insertNotice(SqlSessionTemplate sqlSession, String title, String content) {
		HashMap<String, String> map = new HashMap<>();
		map.put("title", title);
		map.put("content", content);
		return sqlSession.insert("noticeMapper.insertNotice", map);
	}

	public int insertFAQ(SqlSessionTemplate sqlSession, String title, String content, int btype) {
		HashMap<String, String> map = new HashMap<>();
		map.put("title", title);
		map.put("content", content);
		map.put("btype", btype+"");
		return sqlSession.insert("noticeMapper.insertFAQ", map);
	}

	public int getNoticeListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("noticeMapper.getNoticeListCount");
	}

	public ArrayList<Notice> selectNoticeList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1 ) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("noticeMapper.selectNoticeList", null, rowBounds);
  }

	public int getFAQListCount(SqlSessionTemplate sqlSession, String number) {
		return sqlSession.selectOne("noticeMapper.getFAQListCount", number);
	}

	public ArrayList<Notice> selectFAQList(SqlSessionTemplate sqlSession, PageInfo pi, String number) {
		int offset = (pi.getCurrentPage() -1 ) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("noticeMapper.selectFAQList", number, rowBounds);
	}

	public ArrayList<Notice> selectFAQFilterList(SqlSessionTemplate sqlSession, PageInfo pi, String number) {
		int offset = (pi.getCurrentPage() -1 ) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("noticeMapper.selectFAQFilterList", number, rowBounds);
	}

	public int getFAQFilterListCount(SqlSessionTemplate sqlSession, String number) {
		return sqlSession.selectOne("noticeMapper.getFAQFilterListCount", number);
	}

	public int deleteFAQ(SqlSessionTemplate sqlSession, String bno) {
		return sqlSession.update("noticeMapper.deleteFAQ", bno);
	}

	public Notice selectupdateFAQ(SqlSessionTemplate sqlSession, String bno) {
		return sqlSession.selectOne("noticeMapper.seleteupdateFAQ", bno);
	}

	public int updateFAQ(SqlSessionTemplate sqlSession, String title, String content, int btype, String bno) {
		HashMap<String, String> map = new HashMap<>();
		map.put("title", title);
		map.put("content", content);
		map.put("btype", btype+"");
		map.put("bno", bno);
		return sqlSession.update("noticeMapper.updateFAQ", map);
	}

	public int getFAQSearchListCount(SqlSessionTemplate sqlSession, String faqSearch) {
		return sqlSession.selectOne("noticeMapper.getFAQSearchListCount", faqSearch);
	}
	
	public ArrayList<Notice> selectFAQSearchList(SqlSessionTemplate sqlSession, PageInfo pi, String faqSearch) {
		int offset = (pi.getCurrentPage() -1 ) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("noticeMapper.selectFAQSearchList", faqSearch, rowBounds);
	}

	public int updateNotice(SqlSessionTemplate sqlSession, String title, String content, String bno) {
		HashMap<String, String> map = new HashMap<>();
		map.put("title", title);
		map.put("content", content);
		map.put("bno", bno);
		return sqlSession.update("noticeMapper.updateNotice", map);
	}

	public String selectBno(SqlSessionTemplate sqlSession, String title, String content) {
		HashMap<String, String> map = new HashMap<>();
		map.put("title", title);
		map.put("content", content);
		return sqlSession.selectOne("noticeMapper.selectBno", map);
	}

	public ArrayList<String> selectAllId(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("noticeMapper.selectAllId");
	}

	public void insertAlert(SqlSessionTemplate sqlSession, String id, String title, String bno) {
		HashMap<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("title", title);
		map.put("bno", bno);
		sqlSession.insert("noticeMapper.insertAlert", map);
	}

}

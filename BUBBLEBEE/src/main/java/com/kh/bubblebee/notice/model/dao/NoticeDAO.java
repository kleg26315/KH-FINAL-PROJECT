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

}

package com.kh.bubblebee.notice.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("nDAO")
public class NoticeDAO {

	public int insertNotice(SqlSessionTemplate sqlSession, String title, String content) {
		HashMap<String, String> map = new HashMap<>();
		map.put("title", title);
		map.put("content", content);
		return sqlSession.insert("noticeMapper.insertNotice", map);
	}

}

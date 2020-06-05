package com.kh.bubblebee.notice.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bubblebee.board.model.vo.Board;
import com.kh.bubblebee.common.PageInfo;

@Repository("nDAO")
public class NoticeDAO {

	public int insertNotice(SqlSessionTemplate sqlSession, String title, String content) {
		HashMap<String, String> map = new HashMap<>();
		map.put("title", title);
		map.put("content", content);
		return sqlSession.insert("noticeMapper.insertNotice", map);
	}

	public int getNoticeCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("noticeMapper.getListCount");
	}

	public ArrayList<Board> selectNotice(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("noticeMapper.selectList", rowBounds);
	}

}

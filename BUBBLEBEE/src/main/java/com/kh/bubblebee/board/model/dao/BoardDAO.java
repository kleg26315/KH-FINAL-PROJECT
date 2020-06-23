package com.kh.bubblebee.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bubblebee.board.model.vo.Board;
import com.kh.bubblebee.board.model.vo.Option;
import com.kh.bubblebee.common.PageInfo;
import com.kh.bubblebee.host.model.vo.Host;

@Repository("bDAO")
public class BoardDAO {

	public int getListCount(SqlSessionTemplate sqlSession, String cate) {
		return sqlSession.selectOne("boardMapper.getListCount", cate);
	}

	public ArrayList<Board> selectList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> map) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectList", map, rowBounds);
	}
	
	public ArrayList<Board> selectLtList(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectLtList", map, rowBounds);
	}

	public ArrayList<Board> selectHtList(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectHtList", map, rowBounds);
	}

	public int insertBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.insertBoard", b);
	}
	
	public int insertBoardOption(SqlSessionTemplate sqlSession, HashMap<String, Option> map) {
		int count = 0;
		
		for(int i=0; i < map.size(); i++ ) {
			 sqlSession.insert("boardMapper.insertBoardOption", map.get("op" + i));
			 count++;
		}
		return count;
	}
	
	public Board selectBoard(SqlSessionTemplate sqlSession, int fno) {
		return sqlSession.selectOne("boardMapper.selectBoard", fno);
	}

	public Host selectHost(SqlSessionTemplate sqlSession, String hostId) {
		return sqlSession.selectOne("hostMapper.selectHost", hostId);
	}

	public int getSearchListCount(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.selectOne("boardMapper.getSearchListCount", map);
	}

	public ArrayList<Board> selectSearchList(SqlSessionTemplate sqlSession, HashMap<String, Object> map, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectSearchList", map, rowBounds);
	}

	public int insertHeart(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.insert("boardMapper.insertHeart", map);
	}

	public int readHeart(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.selectOne("boardMapper.readHeart", map);
	}

	public int deleteHeart(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.delete("boardMapper.deleteHeart", map);
	}

	public ArrayList<Board> selectFindList(SqlSessionTemplate sqlSession, String search) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectFindList", search);
	}

	public int getFindListCount(SqlSessionTemplate sqlSession, String search) {
		return sqlSession.selectOne("boardMapper.getFindListCount",search);
	}

	public ArrayList<Board> selectwList(SqlSessionTemplate sqlSession, String cate) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectwList", cate);
	}

	public ArrayList<Board> markLocation(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("boardMapper.makrLocation");
	}


	public int updateBoard(SqlSessionTemplate sqlSession, Board b) {
		// TODO Auto-generated method stub
		return sqlSession.update("boardMapper.updateBoard", b);
	}

	public int updateBoardOption(SqlSessionTemplate sqlSession, HashMap<String, Option> map) {
		// TODO Auto-generated method stub
		return sqlSession.update("boardMapper.updateBoardOption", map);
	}

	public int plusHeart(SqlSessionTemplate sqlSession, int fno) {
		return sqlSession.update("boardMapper.plusHeart", fno);
	}

	public int minusHeart(SqlSessionTemplate sqlSession, int fno) {
		return sqlSession.update("boardMapper.minusHeart", fno);
	}

	public ArrayList<Board> selectMList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectMList");
	}

	public ArrayList<Board> selectCList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectCList");
	}
	
	public int deleteBoard(SqlSessionTemplate sqlSession, int fno) {
		// TODO Auto-generated method stub
		return sqlSession.update("boardMapper.deleteBoard", fno);
	}

	public int deleteBoardOption(SqlSessionTemplate sqlSession, int fno) {
		// TODO Auto-generated method stub
		return sqlSession.delete("boardMapper.deleteBoardOption", fno);
	}

	public ArrayList<Board> selectUpMList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectUpMList");
	}

	public ArrayList<Board> selectUpCList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectUpCList");
	}

	public ArrayList<Option> selectOption(SqlSessionTemplate sqlSession, int fno) {
		return (ArrayList)sqlSession.selectList("purchaseMapper.selectOption",fno);
	}

	
	
	
}

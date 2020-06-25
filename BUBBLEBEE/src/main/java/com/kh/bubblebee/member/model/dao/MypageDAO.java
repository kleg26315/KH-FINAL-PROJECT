package com.kh.bubblebee.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bubblebee.board.model.vo.Board;
import com.kh.bubblebee.common.PageInfo;
import com.kh.bubblebee.member.model.vo.Hlike;
import com.kh.bubblebee.member.model.vo.Member;
import com.kh.bubblebee.purchase.model.vo.PPoint;
import com.kh.bubblebee.purchase.model.vo.Paylist;
import com.kh.bubblebee.purchase.model.vo.Slist;

@Repository("mgDAO")
public class MypageDAO {

	public int updateInfo(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("mypageMapper.updateInfo", m);
	}

	public int updateprofile(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.update("mypageMapper.updateprofile", map);
	}

	public int getListCount(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("mypageMapper.getListCount",userId);
	}

	public ArrayList<PPoint> selectpList(SqlSessionTemplate sqlSession, PageInfo pi, String userId) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("mypageMapper.selectpList",userId,rowBounds);
	}

	public int getSListCount(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("mypageMapper.getSListCount",userId);
	}

	public ArrayList<Slist> selectsList(SqlSessionTemplate sqlSession, PageInfo pi, String userId) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("mypageMapper.selectsList",userId,rowBounds);
	}

	public int sListdelete(SqlSessionTemplate sqlSession, int tno) {
		return sqlSession.delete("mypageMapper.sListdelete",tno);
	}

	public int getPListCount(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("mypageMapper.getPListCount",userId);
	}

	public ArrayList<Paylist> selectpayList(SqlSessionTemplate sqlSession, PageInfo pi, String userId) {
		int offset = (pi.getCurrentPage() -1 ) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("mypageMapper.selectpayList",userId,rowBounds);
	}

	public int gethListCount(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("mypageMapper.gethListCount",userId);
	}

	public ArrayList<Hlike> selecthList(SqlSessionTemplate sqlSession, PageInfo pi, String userId) {
		int offset = (pi.getCurrentPage() -1 ) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("mypageMapper.selecthList", userId, rowBounds);
	}

	public int getbListCount(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("mypageMapper.getbListCount",userId);
	}

	public ArrayList<Board> selectbList(SqlSessionTemplate sqlSession, PageInfo pi, String userId) {
		int offset = (pi.getCurrentPage() -1 ) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("mypageMapper.selectbList",userId,rowBounds);
	}

}

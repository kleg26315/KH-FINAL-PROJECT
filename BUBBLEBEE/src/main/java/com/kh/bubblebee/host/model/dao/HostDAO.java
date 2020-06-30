package com.kh.bubblebee.host.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bubblebee.board.model.vo.Board;
import com.kh.bubblebee.board.model.vo.Reply;
import com.kh.bubblebee.board.model.vo.Review;
import com.kh.bubblebee.common.PageInfo;
import com.kh.bubblebee.host.model.vo.Aclist;
import com.kh.bubblebee.host.model.vo.Arlist;
import com.kh.bubblebee.host.model.vo.Host;
import com.kh.bubblebee.member.model.vo.Member;

@Repository("hDAO")
public class HostDAO {

	public int updateMemberInfo(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("hostMapper.updateMemberInfo", m);
	}

	public int enrollHost(SqlSessionTemplate sqlSession, Host h) {
		return sqlSession.insert("hostMapper.enrollHost", h);
	}

	public Host selectHost(SqlSessionTemplate sqlSession, String hostId) {
		return sqlSession.selectOne("hostMapper.selectHost", hostId);
	}

	public int getListCount(SqlSessionTemplate sqlSession, String hostId) {
		return sqlSession.selectOne("hostMapper.getListCount",hostId);
	}

	public ArrayList<Board> selectBoard(SqlSessionTemplate sqlSession, PageInfo pi, String hostId) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("hostMapper.selectBoard", hostId, rowBounds);
	}

	public int insertHostQnA(SqlSessionTemplate sqlSession, Review r) {
		return sqlSession.insert("hostMapper.insertHostQnA", r);
	}

	public int selectQnACount(SqlSessionTemplate sqlSession, int fno) {
		return sqlSession.selectOne("hostMapper.selectQnACount", fno);
	}

	public ArrayList<Review> selectQnAList(SqlSessionTemplate sqlSession, PageInfo pi, int fno) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("hostMapper.selectQnAList", fno, rowBounds);
	}

	public int deleteQnA(SqlSessionTemplate sqlSession, int qno) {
		return sqlSession.delete("hostMapper.deleteQnA",qno);
	}

	public int insertHostReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("hostMapper.insertHostReply",r);
	}

	public Reply selectHostReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.selectOne("hostMapper.selectHostReply",r);
	}

	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, String hostId) {
		return (ArrayList)sqlSession.selectList("hostMapper.selectReplyList",hostId);
	}

	public int selectQ(SqlSessionTemplate sqlSession, String hostId) {
		return sqlSession.selectOne("hostMapper.selectQ",hostId);
	}

	public int selectA(SqlSessionTemplate sqlSession, String hostId) {
		return sqlSession.selectOne("hostMapper.selectA",hostId);
	}

	public int updateMemberProfile(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("hostMapper.updateMemberProfile",m);
	}

	public int updateHostInfo(SqlSessionTemplate sqlSession, Host h) {
		return sqlSession.update("hostMapper.updateHostInfo",h);
	}

	public int hostLikeCheck(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("hostMapper.hostLikeChcek",map);
	}

	public int deleteHostLike(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.delete("hostMapper.deleteHostLike",map);
	}

	public int insertHostLike(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.insert("hostMapper.insertHostLike",map);
	}

	public int getBListCount(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.selectOne("hostMapper.getBListCount",map);
	}

	public ArrayList<Board> hostBoardAll(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, Object> map) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("hostMapper.hostBoardAll",map,rowBounds);
	}

	public int likeCount(SqlSessionTemplate sqlSession, String hostId) {
		return sqlSession.selectOne("hostMapper.likeCount",hostId);
	}

	public int getAclistCount(SqlSessionTemplate sqlSession, String hostId) {
		return sqlSession.selectOne("hostMapper.getAclistCount",hostId);
	}

	public ArrayList<Aclist> selectAcList(SqlSessionTemplate sqlSession, PageInfo pi, String hostId) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("hostMapper.selectAcList",hostId,rowBounds);
	}

	public int getArListcount(SqlSessionTemplate sqlSession, String hostId) {
		return sqlSession.selectOne("hostMapper.getArListcount",hostId);
	}

	public ArrayList<Arlist> selectArList(SqlSessionTemplate sqlSession, PageInfo pi, String hostId) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("hostMapper.selectArList",hostId,rowBounds);
	}

	public int updateBuyAccount(SqlSessionTemplate sqlSession, Aclist list) {
		return sqlSession.update("hostMapper.updateBuyAccount", list);
	}

	public int insertAcount(SqlSessionTemplate sqlSession, Aclist list) {
		return sqlSession.insert("hostMapper.insertAcount",list);
	}

	public ArrayList<Integer> selectLikeBoard(SqlSessionTemplate sqlSession, String userId) {
		return (ArrayList)sqlSession.selectList("hostMapper.selectLikeBoard",userId);
	}

	

	
}

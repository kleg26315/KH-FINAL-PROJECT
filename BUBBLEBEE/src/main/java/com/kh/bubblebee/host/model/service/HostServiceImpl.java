package com.kh.bubblebee.host.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bubblebee.board.model.vo.Board;
import com.kh.bubblebee.board.model.vo.Reply;
import com.kh.bubblebee.board.model.vo.Review;
import com.kh.bubblebee.common.PageInfo;
import com.kh.bubblebee.host.model.dao.HostDAO;
import com.kh.bubblebee.host.model.vo.Aclist;
import com.kh.bubblebee.host.model.vo.Arlist;
import com.kh.bubblebee.host.model.vo.Host;
import com.kh.bubblebee.member.model.vo.Member;

@Service("hService")
public class HostServiceImpl implements HostService{

	@Autowired
	private HostDAO hDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int updateMemberInfo(Member m) {
		return hDAO.updateMemberInfo(sqlSession,m);
	}

	@Override
	public int enrollHost(Host h) {
		return hDAO.enrollHost(sqlSession,h);
	}

	@Override
	public Host selectHost(String hostId) {
		return hDAO.selectHost(sqlSession,hostId);
	}

	@Override
	public int getListCount(String hostId) {
		return hDAO.getListCount(sqlSession,hostId);
	}

	@Override
	public ArrayList<Board> selectBoard(PageInfo pi, String hostId) {
		return hDAO.selectBoard(sqlSession,pi,hostId);
	}

	@Override
	public int insertHostQnA(Review r) {
		return hDAO.insertHostQnA(sqlSession,r);
	}

	@Override
	public int selectQnACount(int fno) {
		return hDAO.selectQnACount(sqlSession,fno);
	}

	@Override
	public ArrayList<Review> selectQnAList(PageInfo pi, int fno) {
		return hDAO.selectQnAList(sqlSession,pi,fno);
	}

	@Override
	public int deleteQnA(int qno) {
		return hDAO.deleteQnA(sqlSession,qno);
	}

	@Override
	public int insertHostReply(Reply r) {
		return hDAO.insertHostReply(sqlSession,r);
	}

	@Override
	public Reply selectHostReply(Reply r) {
		return hDAO.selectHostReply(sqlSession,r);
	}

	@Override
	public ArrayList<Reply> selectReplyList(String hostId) {
		return hDAO.selectReplyList(sqlSession,hostId);
	}

	@Override
	public int selectQ(String hostId) {
		return hDAO.selectQ(sqlSession,hostId);
	}

	@Override
	public int selectA(String hostId) {
		return hDAO.selectA(sqlSession,hostId);
	}

	@Override
	public int updateMemberProfile(Member m) {
		return hDAO.updateMemberProfile(sqlSession,m);
	}

	@Override
	public int updateHostInfo(Host h) {
		return hDAO.updateHostInfo(sqlSession,h);
	}

	@Override
	public int hostLikeCheck(HashMap<String, String> map) {
		return hDAO.hostLikeCheck(sqlSession,map);
	}

	@Override
	public int deleteHostLike(HashMap<String, String> map) {
		return hDAO.deleteHostLike(sqlSession,map);
	}

	@Override
	public int insertHostLike(HashMap<String, String> map) {
		return hDAO.insertHostLike(sqlSession,map);
	}

	@Override
	public int getBListCount(HashMap<String, Object> map) {
		return hDAO.getBListCount(sqlSession,map);
	}

	@Override
	public ArrayList<Board> hostBoardAll(PageInfo pi, HashMap<String, Object> map) {
		return hDAO.hostBoardAll(sqlSession,pi,map);
	}

	@Override
	public int likeCount(String hostId) {
		return hDAO.likeCount(sqlSession,hostId);
	}

	@Override
	public int getAclistCount(String hostId) {
		return hDAO.getAclistCount(sqlSession,hostId);
	}

	@Override
	public ArrayList<Aclist> selectAcList(PageInfo pi, String hostId) {
		return hDAO.selectAcList(sqlSession,pi,hostId);
	}

	@Override
	public int getArListCount(String hostId) {
		return hDAO.getArListcount(sqlSession,hostId);
	}

	@Override
	public ArrayList<Arlist> selectArList(PageInfo pi, String hostId) {
		return hDAO.selectArList(sqlSession,pi,hostId);
	}

	@Override
	public int updateBuyAccount(Aclist list) {
		return hDAO.updateBuyAccount(sqlSession,list);
	}

	@Override
	public int insertAcount(Aclist list) {
		return hDAO.insertAcount(sqlSession,list);
	}

	@Override
	public ArrayList<Integer> selectLikeBoard(String userId) {
		return hDAO.selectLikeBoard(sqlSession,userId);
	}


}

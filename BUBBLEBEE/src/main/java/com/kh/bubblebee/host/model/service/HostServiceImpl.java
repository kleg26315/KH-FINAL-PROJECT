package com.kh.bubblebee.host.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bubblebee.board.model.vo.Board;
import com.kh.bubblebee.board.model.vo.Review;
import com.kh.bubblebee.common.PageInfo;
import com.kh.bubblebee.host.model.dao.HostDAO;
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



}

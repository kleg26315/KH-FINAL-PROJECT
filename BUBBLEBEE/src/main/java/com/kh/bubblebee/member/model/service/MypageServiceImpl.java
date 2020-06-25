package com.kh.bubblebee.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bubblebee.board.model.vo.Board;
import com.kh.bubblebee.common.PageInfo;
import com.kh.bubblebee.member.model.dao.MypageDAO;
import com.kh.bubblebee.member.model.vo.Hlike;
import com.kh.bubblebee.member.model.vo.Member;
import com.kh.bubblebee.purchase.model.vo.PPoint;
import com.kh.bubblebee.purchase.model.vo.Paylist;
import com.kh.bubblebee.purchase.model.vo.Slist;

@Service("mgService")
public class MypageServiceImpl implements MypageService{

	@Autowired
	private MypageDAO mgDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int updateInfo(Member m) {
		return mgDAO.updateInfo(sqlSession,m);
	}

	@Override
	public int updateprofile(HashMap<String, String> map) {
		return mgDAO.updateprofile(sqlSession,map);
	}

	@Override
	public int getListCount(String userId) {
		return mgDAO.getListCount(sqlSession,userId);
	}

	@Override
	public ArrayList<PPoint> selectpList(PageInfo pi, String userId) {
		return mgDAO.selectpList(sqlSession,pi,userId);
	}

	@Override
	public int getSListCount(String userId) {
		return mgDAO.getSListCount(sqlSession,userId);
	}

	@Override
	public ArrayList<Slist> selectsList(PageInfo pi, String userId) {
		return mgDAO.selectsList(sqlSession,pi,userId);
	}

	@Override
	public int sListdelete(int tno) {
		return mgDAO.sListdelete(sqlSession,tno);
	}

	@Override
	public int getPListCount(String userId) {
		return mgDAO.getPListCount(sqlSession,userId);
	}

	@Override
	public ArrayList<Paylist> selectpayList(PageInfo pi, String userId) {
		return mgDAO.selectpayList(sqlSession,pi,userId);
	}

	@Override
	public int gethListCount(String userId) {
		return mgDAO.gethListCount(sqlSession,userId);
	}

	@Override
	public ArrayList<Hlike> selecthList(PageInfo pi, String userId) {
		return mgDAO.selecthList(sqlSession,pi,userId);
	}

	@Override
	public int getbListCount(String userId) {
		return mgDAO.getbListCount(sqlSession,userId);
	}

	@Override
	public ArrayList<Board> selectbList(PageInfo pi, String userId) {
		// TODO Auto-generated method stub
		return mgDAO.selectbList(sqlSession,pi,userId);
	}

	

	
	
	
}

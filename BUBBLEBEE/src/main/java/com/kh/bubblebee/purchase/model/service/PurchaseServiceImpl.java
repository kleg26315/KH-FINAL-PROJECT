package com.kh.bubblebee.purchase.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bubblebee.purchase.model.dao.PurchaseDAO;
import com.kh.bubblebee.purchase.model.vo.PBoard;
import com.kh.bubblebee.purchase.model.vo.PChoose;
import com.kh.bubblebee.purchase.model.vo.PPoint;
import com.kh.bubblebee.purchase.model.vo.Purchase;

@Service("pService")
public class PurchaseServiceImpl implements PurchaseService {
	
	@Autowired
	private PurchaseDAO pDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<PBoard> selectBList(String fno) {
		
		System.out.println("pService : " + fno);
		return pDAO.selectList(sqlSession, fno);
	}

	@Override
	public ArrayList<PChoose> selectPList(String ono) {
		return pDAO.selectPSList(sqlSession, ono);
	}

	@Override
	public ArrayList<Purchase> selectOption(int fno) {
		return pDAO.selectOption(sqlSession, fno);
	}

	@Override
	public PChoose selectPChoose(String ono) {
		return pDAO.selectPChoose(sqlSession, ono);
	}

	@Override
	public int insertPurchase2(Map<String, String> param) {
		return pDAO.purchaseThis2(sqlSession, param);
	}

	@Override
	public PBoard selectBPBoard(String fno) {
		return pDAO.selectPBoard(sqlSession, fno);
	}

	@Override
	public int insertPurchase(Map<String, String> param) {
		return pDAO.purchaseThis1(sqlSession, param);
	}

	@Override
	public int selectGno(String dcode) {
		return pDAO.selectGno(sqlSession, dcode);
	}

	@Override
	public Purchase selectPurchase2(String gno) {
		return pDAO.selectPurchase2(sqlSession, gno);
	}

	@Override
	public PChoose selectPChoose2(String ono) {
		return pDAO.selectPChoose2(sqlSession, ono);
	}

	@Override
	public PBoard selectBPBoard2(String fno) {
		return pDAO.selectBPBoard2(sqlSession, fno);
	}

	@Override
	public int selectPcost(String user_id) {
		return pDAO.selectPcost(sqlSession, user_id);
	}

	@Override
	public int insertPused(String user_id, String discountPrice, String comment) {
		return pDAO.insertPused(sqlSession, user_id, discountPrice, comment);
	}

	@Override
	public int selectPPoint(String user_id) {
		return pDAO.selectPPoint(sqlSession, user_id);
	}

	@Override
	public int addSlist(HashMap<String, String> map) {
		return pDAO.addSlist(sqlSession, map);
	}

	@Override
	public ArrayList<PBoard> selectPBoard2() {
		return pDAO.selectPBoard2(sqlSession);
	}

	@Override
	public int insertplusPoint(String user_id, double d, String comment) {
		return pDAO.insertplusPoint(sqlSession, user_id, d, comment);
	}

	@Override
	public String selectUserName(String user_id) {
		return pDAO.selectUserName(sqlSession, user_id);
	}

}

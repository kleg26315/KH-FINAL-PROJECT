package com.kh.bubblebee.purchase.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bubblebee.board.model.vo.Board;
import com.kh.bubblebee.purchase.model.dao.PurchaseDAO;
import com.kh.bubblebee.purchase.model.vo.PBoard;
import com.kh.bubblebee.purchase.model.vo.PSList;
import com.kh.bubblebee.purchase.model.vo.Purchase;

@Service("pService")
public class PurchaseServiceImpl implements PurchaseService {
	
	@Autowired
	private PurchaseDAO pDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<PBoard> selectBList(int fno) {
		
		System.out.println("pService : " + fno);
		return pDAO.selectList(sqlSession, fno);
	}

	@Override
	public ArrayList<PSList> selectPList(String ono) {
		return pDAO.selectPSList(sqlSession, ono);
	}

	@Override
	public int insertPurchase(Purchase p) {
	
		return pDAO.purchaseThis1(sqlSession, p);
	}

	
	
}

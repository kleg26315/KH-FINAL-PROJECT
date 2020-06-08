package com.kh.bubblebee.purchase.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bubblebee.board.model.vo.Board;
import com.kh.bubblebee.purchase.model.dao.PurchaseDAO;
import com.kh.bubblebee.purchase.model.vo.Purchase;

@Service("pService")
public class PurchaseServiceImpl implements PurchaseService{

	@Autowired
	private PurchaseDAO pDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertOption(Purchase p) {
		
		
		return pDAO.insertOption(sqlSession, p);
	}

	@Override
	public String purchaseView(String fNo) {
		// TODO Auto-generated method stub
		return pDAO.purchaseView(sqlSession, fNo);
	}

	@Override
	public Board selectBoard(int Fno) {
		// TODO Auto-generated method stub
		return pDAO.thisView(sqlSession, Fno);
	}
	
	
}

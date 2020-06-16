package com.kh.bubblebee.purchase.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bubblebee.board.model.vo.Board;
import com.kh.bubblebee.member.model.vo.Member;
import com.kh.bubblebee.purchase.model.vo.PBoard;
import com.kh.bubblebee.purchase.model.vo.PChoose;
import com.kh.bubblebee.purchase.model.vo.PSList;
import com.kh.bubblebee.purchase.model.vo.Purchase;

@Repository("pDAO")
public class PurchaseDAO {


	public ArrayList<PBoard> selectList(SqlSessionTemplate sqlSession, int fNo) {

		System.out.println("pDAO : " + fNo);
		
		return (ArrayList)sqlSession.selectList("purchaseMapper.selectProduct", fNo);
	}

	public ArrayList<PSList> selectPSList(SqlSessionTemplate sqlSession, String ono) {
		return (ArrayList)sqlSession.selectList("purchaseMapper.selectSList", ono);
	}

	public int purchaseThis1(SqlSessionTemplate sqlSession, Map<String, String> param) {
		
		return sqlSession.insert("purchaseMapper.purchaseThis1",param);
	}

	public ArrayList<Purchase> selectOption(SqlSessionTemplate sqlSession, int fno) {
		return (ArrayList)sqlSession.selectList("purchaseMapper.selectOption", fno);
	}

	

	public PChoose selectPChoose(SqlSessionTemplate sqlSession, String ono) {
		return sqlSession.selectOne("purchaseMapper.selectPChoose", ono);
	}

	public PBoard selectPBoard(SqlSessionTemplate sqlSession, String fno) {
		return sqlSession.selectOne("purchaseMapper.selectPBoard", fno);
	}


	public int purchaseThis2(SqlSessionTemplate sqlSession, Map<String, String> param) {
		return sqlSession.insert("purchaseMapper.purchaseThis2", param);
	}

	public int selectGno(SqlSessionTemplate sqlSession, String dcode) {
		return sqlSession.selectOne("purchaseMapper.selectGno", dcode);
	}

	public Purchase selectPurchase2(SqlSessionTemplate sqlSession, String gno) {
		return sqlSession.selectOne("purchaseMapper.selectPurchase2", gno);
	}

	public PChoose selectPChoose2(SqlSessionTemplate sqlSession, String ono) {
		return sqlSession.selectOne("purchaseMapper.selectPChoose2", ono);
	}

	public PBoard selectBPBoard2(SqlSessionTemplate sqlSession, String fno) {
		return sqlSession.selectOne("purchaseMapper.selectBPBoard2", fno);
	}


}

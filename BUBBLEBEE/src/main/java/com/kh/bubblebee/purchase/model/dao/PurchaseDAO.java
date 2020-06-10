package com.kh.bubblebee.purchase.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bubblebee.board.model.vo.Board;
import com.kh.bubblebee.purchase.model.vo.PBoard;
import com.kh.bubblebee.purchase.model.vo.Purchase;

@Repository("pDAO")
public class PurchaseDAO {


	public ArrayList<PBoard> selectList(SqlSessionTemplate sqlSession, int fNo) {

		System.out.println("pDAO : " + fNo);
		
		return (ArrayList)sqlSession.selectList("purchaseMapper.selectProduct", fNo);
	}

	

}

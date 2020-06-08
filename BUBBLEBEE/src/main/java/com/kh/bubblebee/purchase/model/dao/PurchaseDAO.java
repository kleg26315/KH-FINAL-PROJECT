package com.kh.bubblebee.purchase.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bubblebee.board.model.vo.Board;
import com.kh.bubblebee.purchase.model.vo.Purchase;

@Repository("pDAO")
public class PurchaseDAO {



	public int insertOption(SqlSessionTemplate sqlSession, Purchase p) {
		
		int r = sqlSession.insert("purchaseMapper.insertOption", p);
		
		return r;
	}

	public String purchaseView(SqlSessionTemplate sqlSession, String fNo) {
		
		return sqlSession.selectOne("purchaseMapper.selectList", fNo);
	}

	public Board thisView(SqlSessionTemplate sqlSession, int Fno) {
		
		return sqlSession.selectOne("purchaseMapper.thisView", Fno);
	}

}

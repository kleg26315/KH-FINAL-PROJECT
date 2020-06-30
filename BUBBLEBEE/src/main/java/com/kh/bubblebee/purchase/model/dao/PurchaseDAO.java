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
import com.kh.bubblebee.purchase.model.vo.PPoint;
import com.kh.bubblebee.purchase.model.vo.PSList;
import com.kh.bubblebee.purchase.model.vo.Purchase;

@Repository("pDAO")
public class PurchaseDAO {


	public ArrayList<PBoard> selectList(SqlSessionTemplate sqlSession, String fno) {

		System.out.println("pDAO : " + fno);
		
		return (ArrayList)sqlSession.selectList("purchaseMapper.selectProduct", fno);
	}

	public ArrayList<PChoose> selectPSList(SqlSessionTemplate sqlSession, String ono) {
		return (ArrayList)sqlSession.selectList("purchaseMapper.selectCList", ono);
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

	public int selectPcost(SqlSessionTemplate sqlSession, String user_id) {
		return sqlSession.selectOne("purchaseMapper.selectPcost", user_id);
	}

	public int insertPused(SqlSessionTemplate sqlSession, String user_id, String discountPrice, String comment) {
		HashMap<String, String>map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("discountPrice", discountPrice);
		map.put("comment", comment);
		return sqlSession.insert("purchaseMapper.insertPused", map);
	}

	public int selectPPoint(SqlSessionTemplate sqlSession, String user_id) {
		return sqlSession.selectOne("purchaseMapper.selectPPoint", user_id);
	}

	public int addSlist(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.insert("purchaseMapper.addSlist", map);
	}

	public ArrayList<PBoard> selectPBoard2(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("purchaseMapper.selectPBoard2");
	}

	public int insertplusPoint(SqlSessionTemplate sqlSession, String user_id, double d, String comment) {
		HashMap<String, String>map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("d", Double.toString(d));
		map.put("comment", comment);
		return sqlSession.insert("purchaseMapper.insertplusPoint", map);
	}

	public String selectUserName(SqlSessionTemplate sqlSession, String user_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("purchaseMapper.selectUserName", user_id);
	}


}

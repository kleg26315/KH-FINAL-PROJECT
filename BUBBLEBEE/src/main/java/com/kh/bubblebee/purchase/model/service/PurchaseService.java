package com.kh.bubblebee.purchase.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.bubblebee.board.model.vo.Board;
import com.kh.bubblebee.member.model.vo.Member;
import com.kh.bubblebee.purchase.model.vo.PBoard;
import com.kh.bubblebee.purchase.model.vo.PChoose;
import com.kh.bubblebee.purchase.model.vo.PPoint;
import com.kh.bubblebee.purchase.model.vo.PSList;
import com.kh.bubblebee.purchase.model.vo.Purchase;

public interface PurchaseService {

	ArrayList<PBoard> selectBList(int fno);

	ArrayList<PSList> selectPList(String ono);

	int insertPurchase(Map<String, String> param);

	ArrayList<Purchase> selectOption(int fno);

	PChoose selectPChoose(String ono);

	PBoard selectBPBoard(String fno);

	

	int insertPurchase2(Map<String, String> param);

	int selectGno(String dcode);

	Purchase selectPurchase2(String gno);

	PChoose selectPChoose2(String ono);

	PBoard selectBPBoard2(String fno);

	PPoint selectPcost(String user_id);


}

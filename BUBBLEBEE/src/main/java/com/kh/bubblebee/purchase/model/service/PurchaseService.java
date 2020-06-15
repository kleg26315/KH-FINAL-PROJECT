package com.kh.bubblebee.purchase.model.service;

import java.util.ArrayList;

import com.kh.bubblebee.board.model.vo.Board;
import com.kh.bubblebee.purchase.model.vo.PBoard;
import com.kh.bubblebee.purchase.model.vo.PChoose;
import com.kh.bubblebee.purchase.model.vo.PSList;
import com.kh.bubblebee.purchase.model.vo.Purchase;

public interface PurchaseService {

	ArrayList<PBoard> selectBList(int fno);

	ArrayList<PSList> selectPList(String ono);

	int insertPurchase(Purchase p);

	ArrayList<Purchase> selectOption(int fno);

	PChoose selectPChoose(String ono);

	PBoard selectBPBoard(int fno);


}

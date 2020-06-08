package com.kh.bubblebee.purchase.model.service;

import com.kh.bubblebee.board.model.vo.Board;
import com.kh.bubblebee.purchase.model.vo.Purchase;

public interface PurchaseService {
	
	int insertOption(Purchase p);

	String purchaseView(String fNo);

	Board selectBoard(int Fno);
	
}

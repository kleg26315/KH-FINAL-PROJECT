package com.kh.bubblebee.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.bubblebee.board.model.vo.Board;
import com.kh.bubblebee.common.PageInfo;
import com.kh.bubblebee.member.model.vo.Hlike;
import com.kh.bubblebee.member.model.vo.Member;
import com.kh.bubblebee.purchase.model.vo.PPoint;
import com.kh.bubblebee.purchase.model.vo.Paylist;
import com.kh.bubblebee.purchase.model.vo.Slist;

public interface MypageService {

	// 내 정보 수정
	int updateInfo(Member m);

	// 프로필 바꾸기
	int updateprofile(HashMap<String, String> map);

	// 마일리지 목록 개수
	int getListCount(String userId);

	// 마일리지 전체 목록
	ArrayList<PPoint> selectpList(PageInfo pi, String userId);

	// 장바구니 전체 글 개수 조회
	int getSListCount(String userId);

	// 장바구니 목록 조회
	ArrayList<Slist> selectsList(PageInfo pi, String userId);

	// 장바구니 삭제하기
	int sListdelete(int tno);

	// 결제내역 글 개수 조회
	int getPListCount(String userId);

	// 결제내역 가져오기
	ArrayList<Paylist> selectpayList(PageInfo pi, String userId);

	// 좋아요 호스트 개수 가져오기
	int gethListCount(String userId);

	// 호스트 목록 전체
	ArrayList<Hlike> selecthList(PageInfo pi, String userId);

	// 좋아요 게시물 전체 갯수
	int getbListCount(String userId);

	// 좋아요 게시물
	ArrayList<Board> selectbList(PageInfo pi, String userId);

	

	

	
	
}

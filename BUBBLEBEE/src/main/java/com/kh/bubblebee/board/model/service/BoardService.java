
package com.kh.bubblebee.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.bubblebee.board.model.vo.Board;
import com.kh.bubblebee.board.model.vo.Option;
import com.kh.bubblebee.board.model.vo.Review;
import com.kh.bubblebee.board.model.vo.SearchCondition;
import com.kh.bubblebee.common.PageInfo;
import com.kh.bubblebee.host.model.vo.Host;
import com.kh.bubblebee.member.model.vo.Member;

public interface BoardService {

	int getListCount(String cate);

	ArrayList<Board> selectList(PageInfo pi, HashMap<String, String> map);

	ArrayList<Board> selectLtList(HashMap<String, String> map, PageInfo pi);

	ArrayList<Board> selectHtList(HashMap<String, String> map, PageInfo pi);

	Board selectBoard(int fno);

	int insertBoard(Board b);

	int insertBoardOption(HashMap<String, Option> map);

	Host selectHost(String hostId);
  
	int getSearchListCount(HashMap<String, Object> map);

	ArrayList<Board> selectSearchList(HashMap<String, Object> map, PageInfo pi);

	int insertHeart(HashMap<String, Object> map);

	int readHeart(HashMap<String, Object> map);

	int deleteHeart(HashMap<String, Object> map);

	ArrayList<Board> selectFindList(String search);

	int getFindListCount(String search);

	ArrayList<Board> selectwList(String cate);

	ArrayList<Board> markLocation();

	int boardUpdate(Board b);

	int boardUpdateOption(HashMap<String, Option> map);

	int deleteBoard(int fno);

	int deleteBoardOption(int fno);

	int plusHeart(int fno);

	int minusHeart(int fno);

	ArrayList<Board> selectMList();
	
	ArrayList<Board> selectCList();

	ArrayList<Board> selectUpMList();

	ArrayList<Board> selectUpCList();

}

package com.kh.bubblebee.host.model.service;

import java.util.ArrayList;

import com.kh.bubblebee.board.model.vo.Board;
import com.kh.bubblebee.board.model.vo.Reply;
import com.kh.bubblebee.board.model.vo.Review;
import com.kh.bubblebee.common.PageInfo;
import com.kh.bubblebee.host.model.vo.Host;
import com.kh.bubblebee.member.model.vo.Member;

public interface HostService {

	// 호스트 등록시에 입력한 정보로 업데이트
	int updateMemberInfo(Member m);

	// 호스트 정보 추가하기
	int enrollHost(Host h);

	// 호스트 정보 가져오기
	Host selectHost(String hostId);
	
	// 해당 호스트가 작성한 게시글 개수 가져오기
	int getListCount(String hostId);

	// 해당 호스트가 작성한 게시글 가져오기
	ArrayList<Board> selectBoard(PageInfo pi, String hostId);

	// 문의글 작성
	int insertHostQnA(Review r);

	// QnA 개수 
	int selectQnACount(int fno);

	// QnA 목록
	ArrayList<Review> selectQnAList(PageInfo pi, int fno);

	// QnA 삭제
	int deleteQnA(int qno);

	// 문의에 답변 달기 
	int insertHostReply(Reply r);

	// 해당 답변 가져오기
	Reply selectHostReply(Reply r);

	// 답변 목록 가져오기
	ArrayList<Reply> selectReplyList(String hostId);

	
}

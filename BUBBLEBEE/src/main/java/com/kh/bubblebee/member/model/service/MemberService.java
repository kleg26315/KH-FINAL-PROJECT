package com.kh.bubblebee.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.bubblebee.board.model.vo.Board;
import com.kh.bubblebee.board.model.vo.Option;
import com.kh.bubblebee.member.model.vo.Member;

public interface MemberService {

	Member checkMember(String id);

	int signupMember(Member member);

	Member memberLogin(Member m);

	int insertMember(Member m);

	int insertkakaoMember(HashMap<String, String> userInfo);

	int memberPwdUpdate(HashMap<String, String> map);

	int setPoint(String id);

	int getPoint(String id);

	ArrayList<Board> getSlist(String id);

	ArrayList<Board> getHlist(String id);

	Member loginCheck(String email);

	Member emailSameCheck(String id);

}

package com.kh.bubblebee.board.model.vo;

import java.sql.Date;

import com.google.gson.annotations.JsonAdapter;
import com.kh.bubblebee.member.model.vo.Member;

public class Reply {
	private int rno; //후기번호
	private String recontent; // 답변 내용
	private Date re_create_date; // 답변 작성 날짜
	private String user_id; // 답변 작성자
	private Member member;
	
	public Reply() {}

	public Reply(int rno, String recontent, Date re_create_date, String user_id, Member member) {
		super();
		this.rno = rno;
		this.recontent = recontent;
		this.re_create_date = re_create_date;
		this.user_id = user_id;
		this.member = member;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public String getRecontent() {
		return recontent;
	}

	public void setRecontent(String recontent) {
		this.recontent = recontent;
	}

	public Date getRe_create_date() {
		return re_create_date;
	}

	public void setRe_create_date(Date re_create_date) {
		this.re_create_date = re_create_date;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	@Override
	public String toString() {
		return "Reply [rno=" + rno + ", recontent=" + recontent + ", re_create_date=" + re_create_date + ", user_id="
				+ user_id + ", member=" + member + "]";
	}
	
	
	
}

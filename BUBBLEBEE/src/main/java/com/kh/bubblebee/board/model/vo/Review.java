package com.kh.bubblebee.board.model.vo;

import java.sql.Date;

import com.kh.bubblebee.member.model.vo.Member;

public class Review {
	
	private int qno; //후기번호
	private String qcontent; //내용
	private Date q_create_date; //작성날짜
	private Date q_modify_date; //수정날짜
	private String q_status; //상태
	private int ref_fid; //모임번호
	private String user_id; //작성자
	private String secret_yn; //비밀여부
	private int grade; //평점
	private int qtype; //게시판 타입 1.후기 2.QnA
	private Member member;
	
	//후기페이지시 필요한 항목
	private String bday;//참가신청일
	private Date odeadline; //참석일자
	private String category;//카테고리
	private String ftitle;//모임이름
	private String renamefilename;//모임썸네일
	private String profile; //프로필사진
	private String ono; //옵션번호
	
	public Review() {}

	public Review(int qno, String qcontent, Date q_create_date, Date q_modify_date, String q_status, int ref_fid,
			String user_id, String secret_yn, int grade, int qtype, Member member, String bday, Date odeadline,
			String category, String ftitle, String renamefilename, String profile, String ono) {
		super();
		this.qno = qno;
		this.qcontent = qcontent;
		this.q_create_date = q_create_date;
		this.q_modify_date = q_modify_date;
		this.q_status = q_status;
		this.ref_fid = ref_fid;
		this.user_id = user_id;
		this.secret_yn = secret_yn;
		this.grade = grade;
		this.qtype = qtype;
		this.member = member;
		this.bday = bday;
		this.odeadline = odeadline;
		this.category = category;
		this.ftitle = ftitle;
		this.renamefilename = renamefilename;
		this.profile = profile;
		this.ono = ono;
	}

	public int getQno() {
		return qno;
	}

	public void setQno(int qno) {
		this.qno = qno;
	}

	public String getQcontent() {
		return qcontent;
	}

	public void setQcontent(String qcontent) {
		this.qcontent = qcontent;
	}

	public Date getQ_create_date() {
		return q_create_date;
	}

	public void setQ_create_date(Date q_create_date) {
		this.q_create_date = q_create_date;
	}

	public Date getQ_modify_date() {
		return q_modify_date;
	}

	public void setQ_modify_date(Date q_modify_date) {
		this.q_modify_date = q_modify_date;
	}

	public String getQ_status() {
		return q_status;
	}

	public void setQ_status(String q_status) {
		this.q_status = q_status;
	}

	public int getRef_fid() {
		return ref_fid;
	}

	public void setRef_fid(int ref_fid) {
		this.ref_fid = ref_fid;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getSecret_yn() {
		return secret_yn;
	}

	public void setSecret_yn(String secret_yn) {
		this.secret_yn = secret_yn;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public int getQtype() {
		return qtype;
	}

	public void setQtype(int qtype) {
		this.qtype = qtype;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public String getBday() {
		return bday;
	}

	public void setBday(String bday) {
		this.bday = bday;
	}

	public Date getOdeadline() {
		return odeadline;
	}

	public void setOdeadline(Date odeadline) {
		this.odeadline = odeadline;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getFtitle() {
		return ftitle;
	}

	public void setFtitle(String ftitle) {
		this.ftitle = ftitle;
	}

	public String getRenamefilename() {
		return renamefilename;
	}

	public void setRenamefilename(String renamefilename) {
		this.renamefilename = renamefilename;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getOno() {
		return ono;
	}

	public void setOno(String ono) {
		this.ono = ono;
	}

	@Override
	public String toString() {
		return "Review [qno=" + qno + ", qcontent=" + qcontent + ", q_create_date=" + q_create_date + ", q_modify_date="
				+ q_modify_date + ", q_status=" + q_status + ", ref_fid=" + ref_fid + ", user_id=" + user_id
				+ ", secret_yn=" + secret_yn + ", grade=" + grade + ", qtype=" + qtype + ", member=" + member
				+ ", bday=" + bday + ", odeadline=" + odeadline + ", category=" + category + ", ftitle=" + ftitle
				+ ", renamefilename=" + renamefilename + ", profile=" + profile + ", ono=" + ono + "]";
	}

	

	
	

	
}

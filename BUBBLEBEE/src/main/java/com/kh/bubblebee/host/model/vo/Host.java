package com.kh.bubblebee.host.model.vo;

import java.sql.Date;

import com.kh.bubblebee.member.model.vo.Member;

public class Host {
	
	private String id; // 회원 아이디
	private int fid; // 글번호
	private Date enroll_date; // 호스트가입일
	private String ac_bname; // 계좌은행
	private String ac_name; // 예금주
	private String ac_no; // 계좌번호
	private String introduction; // 호스트 소개
	private Member member;
	
	
	public Host() {}


	public Host(String id, int fid, Date enroll_date, String ac_bname, String ac_name, String ac_no,
			String introduction, Member member) {
		super();
		this.id = id;
		this.fid = fid;
		this.enroll_date = enroll_date;
		this.ac_bname = ac_bname;
		this.ac_name = ac_name;
		this.ac_no = ac_no;
		this.introduction = introduction;
		this.member = member;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public int getFid() {
		return fid;
	}


	public void setFid(int fid) {
		this.fid = fid;
	}


	public Date getEnroll_date() {
		return enroll_date;
	}


	public void setEnroll_date(Date enroll_date) {
		this.enroll_date = enroll_date;
	}


	public String getAc_bname() {
		return ac_bname;
	}


	public void setAc_bname(String ac_bname) {
		this.ac_bname = ac_bname;
	}


	public String getAc_name() {
		return ac_name;
	}


	public void setAc_name(String ac_name) {
		this.ac_name = ac_name;
	}


	public String getAc_no() {
		return ac_no;
	}


	public void setAc_no(String ac_no) {
		this.ac_no = ac_no;
	}


	public String getIntroduction() {
		return introduction;
	}


	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	
	public Member getMember() {
		return member;
	}
	
	public void setMember(Member member) {
		this.member = member;
	}

	@Override
	public String toString() {
		return "Host [id=" + id + ", fid=" + fid + ", enroll_date=" + enroll_date + ", ac_bname=" + ac_bname
				+ ", ac_name=" + ac_name + ", ac_no=" + ac_no + ", introduction=" + introduction + ", member" + member + "]";
	}

	
	
}

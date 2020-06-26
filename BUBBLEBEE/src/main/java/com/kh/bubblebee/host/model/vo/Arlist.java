package com.kh.bubblebee.host.model.vo;

import java.sql.Date;

public class Arlist {
	private int fno; // 글번호 
	private int ono; // 옵션 번호
	private Date q_create_date;  // 작성날짜
	private String nickName; // 작성자 닉네임
	private String profile;// 작성자 프사
	private String qcontent; // 작성 내용
	private int grade; //평점
	private String ftitle; // 게시판 제목 
	private String oname; // 옵션 이름
	private int price; //옵션가격
	private String hostId; // 호스트 아이디
	
	public Arlist() {}

	public Arlist(int fno, int ono, Date q_create_date, String nickName, String profile, String qcontent, int grade,
			String ftitle, String oname, int price, String hostId) {
		super();
		this.fno = fno;
		this.ono = ono;
		this.q_create_date = q_create_date;
		this.nickName = nickName;
		this.profile = profile;
		this.qcontent = qcontent;
		this.grade = grade;
		this.ftitle = ftitle;
		this.oname = oname;
		this.price = price;
		this.hostId = hostId;
	}

	public int getFno() {
		return fno;
	}

	public void setFno(int fno) {
		this.fno = fno;
	}

	public int getOno() {
		return ono;
	}

	public void setOno(int ono) {
		this.ono = ono;
	}

	public Date getQ_create_date() {
		return q_create_date;
	}

	public void setQ_create_date(Date q_create_date) {
		this.q_create_date = q_create_date;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getQcontent() {
		return qcontent;
	}

	public void setQcontent(String qcontent) {
		this.qcontent = qcontent;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public String getFtitle() {
		return ftitle;
	}

	public void setFtitle(String ftitle) {
		this.ftitle = ftitle;
	}

	public String getOname() {
		return oname;
	}

	public void setOname(String oname) {
		this.oname = oname;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getHostId() {
		return hostId;
	}

	public void setHostId(String hostId) {
		this.hostId = hostId;
	}

	@Override
	public String toString() {
		return "Arlist [fno=" + fno + ", ono=" + ono + ", q_create_date=" + q_create_date + ", nickName=" + nickName
				+ ", profile=" + profile + ", qcontent=" + qcontent + ", grade=" + grade + ", ftitle=" + ftitle
				+ ", oname=" + oname + ", price=" + price + ", hostId=" + hostId + "]";
	}

	
	
}

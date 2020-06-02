package com.kh.bubblebee.notice.model.vo;

import java.sql.Date;

public class Notice {
	private int bno;
	private int btype;
	private String btitle;
	private String bcontent;
	private int bcount;
	private Date b_create_date;
	private Date b_modify_date;
	private String b_status;
	private String user_id;
	
	public Notice() {}

	public Notice(int bno, int btype, String btitle, String bcontent, int bcount, Date b_create_date,
			Date b_modify_date, String b_status, String user_id) {
		super();
		this.bno = bno;
		this.btype = btype;
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.bcount = bcount;
		this.b_create_date = b_create_date;
		this.b_modify_date = b_modify_date;
		this.b_status = b_status;
		this.user_id = user_id;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public int getBtype() {
		return btype;
	}

	public void setBtype(int btype) {
		this.btype = btype;
	}

	public String getBtitle() {
		return btitle;
	}

	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}

	public String getBcontent() {
		return bcontent;
	}

	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}

	public int getBcount() {
		return bcount;
	}

	public void setBcount(int bcount) {
		this.bcount = bcount;
	}

	public Date getB_create_date() {
		return b_create_date;
	}

	public void setB_create_date(Date b_create_date) {
		this.b_create_date = b_create_date;
	}

	public Date getB_modify_date() {
		return b_modify_date;
	}

	public void setB_modify_date(Date b_modify_date) {
		this.b_modify_date = b_modify_date;
	}

	public String getB_status() {
		return b_status;
	}

	public void setB_status(String b_status) {
		this.b_status = b_status;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	@Override
	public String toString() {
		return "Notice [bno=" + bno + ", btype=" + btype + ", btitle=" + btitle + ", bcontent=" + bcontent + ", bcount="
				+ bcount + ", b_create_date=" + b_create_date + ", b_modify_date=" + b_modify_date + ", b_status="
				+ b_status + ", user_id=" + user_id + "]";
	}
}

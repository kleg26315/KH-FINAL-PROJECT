package com.kh.bubblebee.alert.model.vo;

import java.sql.Date;

public class Alert {
	private int aid;
	private String user_id;
	private String check_yn;
	private String a_content;
	private Date a_create_date;
	
	public Alert() {}

	public Alert(int aid, String user_id, String check_yn, String a_content, Date a_create_date) {
		super();
		this.aid = aid;
		this.user_id = user_id;
		this.check_yn = check_yn;
		this.a_content = a_content;
		this.a_create_date = a_create_date;
	}

	public int getAid() {
		return aid;
	}

	public void setAid(int aid) {
		this.aid = aid;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getCheck_yn() {
		return check_yn;
	}

	public void setCheck_yn(String check_yn) {
		this.check_yn = check_yn;
	}

	public String getA_content() {
		return a_content;
	}

	public void setA_content(String a_content) {
		this.a_content = a_content;
	}

	public Date getA_create_date() {
		return a_create_date;
	}

	public void setA_create_date(Date a_create_date) {
		this.a_create_date = a_create_date;
	}

	@Override
	public String toString() {
		return aid +"," + a_content + "," + a_create_date + "/";
	}
	
	
}

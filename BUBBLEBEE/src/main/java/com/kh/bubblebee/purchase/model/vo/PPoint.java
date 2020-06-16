package com.kh.bubblebee.purchase.model.vo;

import java.sql.Date;

public class PPoint {
	
	private int pno;
	private int p_money;
	private String p_content;
	private Date p_date;
	private Date p_useday;
	private String user_id;
	
	public PPoint() {
		
	}
	
	public PPoint(int pno, int p_money, String p_content, Date p_date, Date p_useday, String user_id) {
		super();
		this.pno = pno;
		this.p_money = p_money;
		this.p_content = p_content;
		this.p_date = p_date;
		this.p_useday = p_useday;
		this.user_id = user_id;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public int getP_money() {
		return p_money;
	}

	public void setP_money(int p_money) {
		this.p_money = p_money;
	}

	public String getP_content() {
		return p_content;
	}

	public void setP_content(String p_content) {
		this.p_content = p_content;
	}

	public Date getP_date() {
		return p_date;
	}

	public void setP_date(Date p_date) {
		this.p_date = p_date;
	}

	public Date getP_useday() {
		return p_useday;
	}

	public void setP_useday(Date p_useday) {
		this.p_useday = p_useday;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	@Override
	public String toString() {
		return "PPoint [pno=" + pno + ", p_money=" + p_money + ", p_content=" + p_content + ", p_date=" + p_date
				+ ", p_useday=" + p_useday + ", user_id=" + user_id + "]";
	}
	
	

}

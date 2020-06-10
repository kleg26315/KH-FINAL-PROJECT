package com.kh.bubblebee.purchase.model.vo;

public class PSList {
	
	private int tno;
	private String ono;
	private String user_id;
	private int tcount;
	
	public PSList(int tno, String ono, String user_id, int tcount) {
		super();
		this.tno = tno;
		this.ono = ono;
		this.user_id = user_id;
		this.tcount = tcount;
	}
	public int getTno() {
		return tno;
	}
	public void setTno(int tno) {
		this.tno = tno;
	}
	public String getOno() {
		return ono;
	}
	public void setOno(String ono) {
		this.ono = ono;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getTcount() {
		return tcount;
	}
	public void setTcount(int tcount) {
		this.tcount = tcount;
	}
	@Override
	public String toString() {
		return "PSList [tno=" + tno + ", ono=" + ono + ", user_id=" + user_id + ", tcount=" + tcount + "]";
	}
	
	

}

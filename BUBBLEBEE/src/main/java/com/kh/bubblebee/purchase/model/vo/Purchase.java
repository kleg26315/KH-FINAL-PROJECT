package com.kh.bubblebee.purchase.model.vo;

public class Purchase {
		
	private int gno;
	private String gname;
	private String gphone;
	private String address;
	private String gmsg;
	private int gpay;
	private int ocount;
	private String user_id;
	private String ono;
	
	
	public Purchase() {
		
	}


	public Purchase(int gno, String gname, String gphone, String address, String gmsg, int gpay, int ocount, String user_id, String ono) {
		super();
		this.gno = gno;
		this.gname = gname;
		this.gphone = gphone;
		this.address = address;
		this.gmsg = gmsg;
		this.gpay = gpay;
		this.ocount = ocount;
		this.user_id = user_id;
		this.ono = ono;
	}


	public int getGno() {
		return gno;
	}


	public void setGno(int gno) {
		this.gno = gno;
	}


	public String getGname() {
		return gname;
	}


	public void setGname(String gname) {
		this.gname = gname;
	}


	public String getGphone() {
		return gphone;
	}


	public void setGphone(String gphone) {
		this.gphone = gphone;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getGmsg() {
		return gmsg;
	}


	public void setGmsg(String gmsg) {
		this.gmsg = gmsg;
	}
	
	public int getGpay() {
		return gpay;
	}

	public void setGpay(int gpay) {
		this.gpay = gpay;
	}

	@Override
	public String toString() {
		return "Purchase [gno=" + gno + ", gname=" + gname + ", gphone=" + gphone + ", address=" + address + ", gmsg="
				+ gmsg + "]";
	}


	public int getOcount() {
		return ocount;
	}


	public void setOcount(int ocount) {
		this.ocount = ocount;
	}


	public String getUser_id() {
		return user_id;
	}


	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}


	public String getOno() {
		return ono;
	}


	public void setOno(String ono) {
		this.ono = ono;
	}

	
		
}

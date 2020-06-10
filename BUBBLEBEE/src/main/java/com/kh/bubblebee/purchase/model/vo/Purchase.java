package com.kh.bubblebee.purchase.model.vo;

public class Purchase {
		
	private int gno;
	private String gname;
	private String gphone;
	private String address;
	private String gmsg;
	
	
	public Purchase() {
		
	}


	public Purchase(int gno, String gname, String gphone, String address, String gmsg) {
		super();
		this.gno = gno;
		this.gname = gname;
		this.gphone = gphone;
		this.address = address;
		this.gmsg = gmsg;
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


	@Override
	public String toString() {
		return "Purchase [gno=" + gno + ", gname=" + gname + ", gphone=" + gphone + ", address=" + address + ", gmsg="
				+ gmsg + "]";
	}

	
		
}

package com.kh.bubblebee.purchase.model.vo;

public class Purchase {
		
	private int gno;
	private String gname;
	private String gphone;
	private String gaddress;
	private String gmsg;
	private int gpay;
	private int ocount;
	private String user_id;
	private String ono;
	private String discount;
	
	public Purchase() {
		
	}


	public Purchase(int gno, String gname, String gphone, String gaddress, String gmsg, int gpay, int ocount,
			String user_id, String ono, String discount) {
		super();
		this.gno = gno;
		this.gname = gname;
		this.gphone = gphone;
		this.gaddress = gaddress;
		this.gmsg = gmsg;
		this.gpay = gpay;
		this.ocount = ocount;
		this.user_id = user_id;
		this.ono = ono;
		this.discount = discount;
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


	public String getGaddress() {
		return gaddress;
	}


	public void setGaddress(String gaddress) {
		this.gaddress = gaddress;
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

	
	public String getDiscount(){
		return discount;
	}
	
	public void setDiscount(String discount) {
		this.discount = discount;
	}

	@Override
	public String toString() {
		return "Purchase [gno=" + gno + ", gname=" + gname + ", gphone=" + gphone + ", gaddress=" + gaddress + ", gmsg="
				+ gmsg + ", gpay=" + gpay + ", ocount=" + ocount + ", user_id=" + user_id + ", ono=" + ono + "]";
	}

	

}

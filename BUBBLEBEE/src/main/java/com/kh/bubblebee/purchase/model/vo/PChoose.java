package com.kh.bubblebee.purchase.model.vo;

import java.sql.Date;

public class PChoose {

	private String ono;
	private String oname;
	private String price;
	private String ocount;
	private int fno;
	private Date odeadline;
	public PChoose(String ono, String oname, String price, String ocount, int fno, Date odeadline) {
		super();
		this.ono = ono;
		this.oname = oname;
		this.price = price;
		this.ocount = ocount;
		this.fno = fno;
		this.odeadline = odeadline;
	}
	public String getOno() {
		return ono;
	}
	public void setOno(String ono) {
		this.ono = ono;
	}
	public String getOname() {
		return oname;
	}
	public void setOname(String oname) {
		this.oname = oname;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getOcount() {
		return ocount;
	}
	public void setOcount(String ocount) {
		this.ocount = ocount;
	}
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	public Date getOdeadline() {
		return odeadline;
	}
	public void setOdeadline(Date odeadline) {
		this.odeadline = odeadline;
	}
	
	@Override
	public String toString() {
		return "PSList [ono=" + ono + ", oname=" + oname + ", price=" + price + ", ocount=" + ocount + ", fno=" + fno
				+ "]";
	}
	
	
	
	
	
}

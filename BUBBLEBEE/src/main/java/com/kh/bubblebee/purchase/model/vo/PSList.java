package com.kh.bubblebee.purchase.model.vo;

public class PSList {
	
	private String ono;
	private String ocategory;
	private String oname;
	private String ocost;
	private int ocount;
	private int fno;
	public PSList(String ono, String ocategory, String oname, String ocost, int ocount, int fno) {
		super();
		this.ono = ono;
		this.ocategory = ocategory;
		this.oname = oname;
		this.ocost = ocost;
		this.ocount = ocount;
		this.fno = fno;
	}
	public String getOno() {
		return ono;
	}
	public void setOno(String ono) {
		this.ono = ono;
	}
	public String getOcategory() {
		return ocategory;
	}
	public void setOcategory(String ocategory) {
		this.ocategory = ocategory;
	}
	public String getOname() {
		return oname;
	}
	public void setOname(String oname) {
		this.oname = oname;
	}
	public String getOcost() {
		return ocost;
	}
	public void setOcost(String ocost) {
		this.ocost = ocost;
	}
	public int getOcount() {
		return ocount;
	}
	public void setOcount(int ocount) {
		this.ocount = ocount;
	}
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	
	
	@Override
	public String toString() {
		return "PSList [ono=" + ono + ", ocategory=" + ocategory + ", oname=" + oname + ", ocost=" + ocost + ", ocount="
				+ ocount + ", fno=" + fno + "]";
	}
	
	
	
	
}

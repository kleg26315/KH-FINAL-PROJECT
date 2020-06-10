package com.kh.bubblebee.board.model.vo;

public class Option {

	private String ono;			//옵션 번호
	private String ocategory;	//옵션 대분류(모임, 클래스, 판매)
	private String oname;		//옵션 이름
	private String ocost;		//옵션 가격
	private int ocount;			//수량
	private int fno;			//게시판 번호
	
	public Option() {}

	public Option(String ono, String ocategory, String oname, String ocost, int ocount, int fno) {
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
		return "Option [ono=" + ono + ", ocategory=" + ocategory + ", oname=" + oname + ", ocost=" + ocost + ", ocount="
				+ ocount + ", fno=" + fno + "]";
	}
	
	
	
	
}

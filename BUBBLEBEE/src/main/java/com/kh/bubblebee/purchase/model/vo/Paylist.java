package com.kh.bubblebee.purchase.model.vo;

import java.sql.Date;

public class Paylist {
	private Date bdate; // 구매날짜
	private String ftitle; // 보드제목
	private String oname; // 옵션이름
	private String renamefilename; // 보드 사진
	private int ocode; // 구매 수량
	private String nickname; // 판매자 이름
	private int price; // 상품 가격
	private int gpay; // 결제금액
	private String gname;// 구매자
	private String gphone; //구매자 번호
	private String address; // 구매자 주소
	private String gmsg; // 배송 메세지
	
	public Paylist() {}

	

	public Paylist(Date bdate, String ftitle, String oname, String renamefilename, int ocode, String nickname,
			int price, int gpay, String gname, String gphone, String address, String gmsg) {
		super();
		this.bdate = bdate;
		this.ftitle = ftitle;
		this.oname = oname;
		this.renamefilename = renamefilename;
		this.ocode = ocode;
		this.nickname = nickname;
		this.price = price;
		this.gpay = gpay;
		this.gname = gname;
		this.gphone = gphone;
		this.address = address;
		this.gmsg = gmsg;
	}



	public Date getBdate() {
		return bdate;
	}

	public void setBdate(Date bdate) {
		this.bdate = bdate;
	}

	public String getFtitle() {
		return ftitle;
	}

	public void setFtitle(String ftitle) {
		this.ftitle = ftitle;
	}

	public String getOname() {
		return oname;
	}

	public void setOname(String oname) {
		this.oname = oname;
	}

	public int getOcode() {
		return ocode;
	}

	public void setOcode(int ocode) {
		this.ocode = ocode;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getGpay() {
		return gpay;
	}

	public void setGpay(int gpay) {
		this.gpay = gpay;
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

	
	public String getRenamefilename() {
		return renamefilename;
	}



	public void setRenamefilename(String renamefilename) {
		this.renamefilename = renamefilename;
	}



	@Override
	public String toString() {
		return "Paylist [bdate=" + bdate + ", ftitle=" + ftitle + ", oname=" + oname + ", renamefilename="
				+ renamefilename + ", ocode=" + ocode + ", nickname=" + nickname + ", price=" + price + ", gpay=" + gpay
				+ ", gname=" + gname + ", gphone=" + gphone + ", address=" + address + ", gmsg=" + gmsg + "]";
	}


	
	
}

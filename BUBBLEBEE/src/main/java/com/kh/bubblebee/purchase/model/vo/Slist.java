package com.kh.bubblebee.purchase.model.vo;

/**
 * @author HE
 *
 */
public class Slist {
	private int tno; // 장바구니 번호 
	private String user_id; // 장바구니 조회 아이디
	private int ono;// 옵션 번호 
	private String oname; //옵션 이름 
	private int price; // 옵션 가격
	private int tcount; // 장바구니 수량
	private String nickName; // 호스트 닉네임
	private String renamefilename; // 사진 
	private int fno; // 게시글 번호
	private String ftitle; // 게시글 제목
	
	public Slist() {}



	public Slist(int tno, String user_id, int ono, String oname, int price, int tcount, String nickName,
			String renamefilename, int fno, String ftitle) {
		super();
		this.tno = tno;
		this.user_id = user_id;
		this.ono = ono;
		this.oname = oname;
		this.price = price;
		this.tcount = tcount;
		this.nickName = nickName;
		this.renamefilename = renamefilename;
		this.fno = fno;
		this.ftitle = ftitle;
	}



	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getOno() {
		return ono;
	}

	public void setOno(int ono) {
		this.ono = ono;
	}

	public String getOname() {
		return oname;
	}

	public void setOname(String oname) {
		this.oname = oname;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getRenamefilename() {
		return renamefilename;
	}

	public void setRenamefilename(String renamefilename) {
		this.renamefilename = renamefilename;
	}

	public int getFno() {
		return fno;
	}

	public void setFno(int fno) {
		this.fno = fno;
	}

	
	
	public int getTno() {
		return tno;
	}

	public void setTno(int tno) {
		this.tno = tno;
	}

	public int getTcount() {
		return tcount;
	}

	public void setTcount(int tcount) {
		this.tcount = tcount;
	}



	public String getFtitle() {
		return ftitle;
	}



	public void setFtitle(String ftitle) {
		this.ftitle = ftitle;
	}



	@Override
	public String toString() {
		return "Slist [tno=" + tno + ", user_id=" + user_id + ", ono=" + ono + ", oname=" + oname + ", price=" + price
				+ ", tcount=" + tcount + ", nickName=" + nickName + ", renamefilename=" + renamefilename + ", fno="
				+ fno + ", ftitle=" + ftitle + "]";
	}

	
	
	
}

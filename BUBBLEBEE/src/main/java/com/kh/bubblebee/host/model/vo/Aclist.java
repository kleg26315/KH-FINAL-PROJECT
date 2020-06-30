package com.kh.bubblebee.host.model.vo;

import java.sql.Date;

public class Aclist {
	private String hostId; // 호스트 아이디
	private int fno;// 글 번호
	private String bdate; //구매 날짜
	private String ftitle; // 버블 제목
	private int amount; // 수량
	private String total; // 총액
	private String fees; // 수수료
	private String cprice; // 실수령액
	private String buy_status; // 정산 상태
	
	public Aclist() {}
	
	public Aclist(String hostId, int fno, String bdate, String ftitle, int amount, String total, String fees,
			String cprice, String buy_status) {
		super();
		this.hostId = hostId;
		this.fno = fno;
		this.bdate = bdate;
		this.ftitle = ftitle;
		this.amount = amount;
		this.total = total;
		this.fees = fees;
		this.cprice = cprice;
		this.buy_status = buy_status;
	}

	public String getHostId() {
		return hostId;
	}

	public void setHostId(String hostId) {
		this.hostId = hostId;
	}

	public int getFno() {
		return fno;
	}

	public void setFno(int fno) {
		this.fno = fno;
	}

	public String getBdate() {
		return bdate;
	}

	public void setBdate(String bdate) {
		this.bdate = bdate;
	}

	public String getFtitle() {
		return ftitle;
	}

	public void setFtitle(String ftitle) {
		this.ftitle = ftitle;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getTotal() {
		return total;
	}

	public void setTotal(String total) {
		this.total = total;
	}

	public String getFees() {
		return fees;
	}

	public void setFees(String fees) {
		this.fees = fees;
	}

	public String getCprice() {
		return cprice;
	}

	public void setCprice(String cprice) {
		this.cprice = cprice;
	}

	public String getBuy_status() {
		return buy_status;
	}

	public void setBuy_status(String buy_status) {
		this.buy_status = buy_status;
	}

	@Override
	public String toString() {
		return "Aclist [hostId=" + hostId + ", fno=" + fno + ", bdate=" + bdate + ", ftitle=" + ftitle + ", amount="
				+ amount + ", total=" + total + ", fees=" + fees + ", cprice=" + cprice + ", buy_status=" + buy_status
				+ "]";
	}
	
}

package com.kh.bubblebee.purchase.model.vo;

public class Purchase {
	
	private int gNo;
	private String gName;
	private String gPhone;
	private String gAddress;
	private String gMsg;
	private String user_id;
	private String oNo;
	private int oCount;
	private int gPay;
	
	public Purchase() {
		
	}

	public Purchase(int gNo, String gName, String gPhone, String gAddress, String gMsg, String user_id, String oNo,
			int oCount, int gPay) {
		super();
		this.gNo = gNo;
		this.gName = gName;
		this.gPhone = gPhone;
		this.gAddress = gAddress;
		this.gMsg = gMsg;
		this.user_id = user_id;
		this.oNo = oNo;
		this.oCount = oCount;
		this.gPay = gPay;
	}

	public int getgNo() {
		return gNo;
	}

	public void setgNo(int gNo) {
		this.gNo = gNo;
	}

	public String getgName() {
		return gName;
	}

	public void setgName(String gName) {
		this.gName = gName;
	}

	public String getgPhone() {
		return gPhone;
	}

	public void setgPhone(String gPhone) {
		this.gPhone = gPhone;
	}

	public String getgAddress() {
		return gAddress;
	}

	public void setgAddress(String gAddress) {
		this.gAddress = gAddress;
	}

	public String getgMsg() {
		return gMsg;
	}

	public void setgMsg(String gMsg) {
		this.gMsg = gMsg;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getoNo() {
		return oNo;
	}

	public void setoNo(String oNo) {
		this.oNo = oNo;
	}

	public int getoCount() {
		return oCount;
	}

	public void setoCount(int oCount) {
		this.oCount = oCount;
	}

	public int getgPay() {
		return gPay;
	}

	public void setgPay(int gPay) {
		this.gPay = gPay;
	}

	@Override
	public String toString() {
		return "Purchase [gNo=" + gNo + ", gName=" + gName + ", gPhone=" + gPhone + ", gAddress=" + gAddress + ", gMsg="
				+ gMsg + ", user_id=" + user_id + ", oNo=" + oNo + ", oCount=" + oCount + ", gPay=" + gPay + "]";
	}

	
	
}

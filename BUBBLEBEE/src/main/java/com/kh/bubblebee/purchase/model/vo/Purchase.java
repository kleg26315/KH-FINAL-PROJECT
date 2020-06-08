package com.kh.bubblebee.purchase.model.vo;

public class Purchase {
	
	private int gNo;
	private String gName;
	private String gPhone;
	private String gAddress;
	private String gMsg;
	private String user_Id;
	private int gPay;
	
	
	private String oNo;
	private String oCategory;
	private String oName;
	private String oCost;
	private int oCount;
	
	
	public Purchase() {
		
	}


	public Purchase(int gNo, String gName, String gPhone, String gAddress, String gMsg, String user_Id, int gPay,
			String oNo, String oCategory, String oName, String oCost, int oCount) {
		super();
		this.gNo = gNo;
		this.gName = gName;
		this.gPhone = gPhone;
		this.gAddress = gAddress;
		this.gMsg = gMsg;
		this.user_Id = user_Id;
		this.gPay = gPay;
		this.oNo = oNo;
		this.oCategory = oCategory;
		this.oName = oName;
		this.oCost = oCost;
		this.oCount = oCount;
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


	public String getUser_Id() {
		return user_Id;
	}


	public void setUser_Id(String user_Id) {
		this.user_Id = user_Id;
	}


	public int getgPay() {
		return gPay;
	}


	public void setgPay(int gPay) {
		this.gPay = gPay;
	}


	public String getoNo() {
		return oNo;
	}


	public void setoNo(String oNo) {
		this.oNo = oNo;
	}


	public String getoCategory() {
		return oCategory;
	}


	public void setoCategory(String oCategory) {
		this.oCategory = oCategory;
	}


	public String getoName() {
		return oName;
	}


	public void setoName(String oName) {
		this.oName = oName;
	}


	public String getoCost() {
		return oCost;
	}


	public void setoCost(String oCost) {
		this.oCost = oCost;
	}


	public int getoCount() {
		return oCount;
	}


	public void setoCount(int oCount) {
		this.oCount = oCount;
	}


	@Override
	public String toString() {
		return "Purchase [gNo=" + gNo + ", gName=" + gName + ", gPhone=" + gPhone + ", gAddress=" + gAddress + ", gMsg="
				+ gMsg + ", user_Id=" + user_Id + ", gPay=" + gPay + ", oNo=" + oNo + ", oCategory=" + oCategory
				+ ", oName=" + oName + ", oCost=" + oCost + ", oCount=" + oCount + "]";
	}

	
		
} 

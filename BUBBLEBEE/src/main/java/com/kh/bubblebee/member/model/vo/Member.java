package com.kh.bubblebee.member.model.vo;

public class Member {
	private String id;
	private String pwd;
	private String userName;
	private String nickName;
	private String phone;
	private String host_yn;
	private String mStatus;
	private String profile;
	private String email;
	
	public Member() {}

	public Member(String id, String pwd, String userName, String nickName, String phone, String host_yn, String mStatus,
			String profile, String email) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.userName = userName;
		this.nickName = nickName;
		this.phone = phone;
		this.host_yn = host_yn;
		this.mStatus = mStatus;
		this.profile = profile;
		this.email = email;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getHost_yn() {
		return host_yn;
	}

	public void setHost_yn(String host_yn) {
		this.host_yn = host_yn;
	}

	public String getmStatus() {
		return mStatus;
	}

	public void setmStatus(String mStatus) {
		this.mStatus = mStatus;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", pwd=" + pwd + ", userName=" + userName + ", nickName=" + nickName + ", phone="
				+ phone + ", host_yn=" + host_yn + ", mStatus=" + mStatus + ", profile=" + profile + ", email=" + email
				+ "]";
	}

}
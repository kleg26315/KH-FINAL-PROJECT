package com.kh.bubblebee.member.model.vo;

public class Hlike {
	private String host_id; // 호스트 아이디
	private String nickname; // 호스트 닉네임
	private String profile; // 호스트 프로필
	private int lcount; // 호스트 별 좋아요수 
	private int fcount; // 호스트가 작성한 게시물 개수
	
	public Hlike () {}

	public Hlike(String host_id, String nickname, String profile, int lcount, int fcount) {
		super();
		this.host_id = host_id;
		this.nickname = nickname;
		this.profile = profile;
		this.lcount = lcount;
		this.fcount = fcount;
	}

	public String getHost_id() {
		return host_id;
	}

	public void setHost_id(String host_id) {
		this.host_id = host_id;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public int getLcount() {
		return lcount;
	}

	public void setLcount(int lcount) {
		this.lcount = lcount;
	}

	public int getFcount() {
		return fcount;
	}

	public void setFcount(int fcount) {
		this.fcount = fcount;
	}

	@Override
	public String toString() {
		return "Hlike [host_id=" + host_id + ", nickname=" + nickname + ", profile=" + profile + ", lcount=" + lcount
				+ ", fcount=" + fcount + "]";
	}
	
	
	
}

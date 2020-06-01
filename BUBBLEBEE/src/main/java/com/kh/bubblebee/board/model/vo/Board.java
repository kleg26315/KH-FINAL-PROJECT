package com.kh.bubblebee.board.model.vo;

import java.sql.Date;

public class Board {
	
	private int rnum; //ROWNUM
	private int fno; //번호
	private int ftype; //게시판 타입
	private int price; //가격
	private String small_title; //소제목
	private String ftitle; //제목
	private String category; //카테고리
	private String location; //장소
	private int lat; //위도
	private int lon; //경도
	private String fcontain; //포함사항
	private String fncontain; //불포함사항
	private String fcalendar; //세부일정
	private String fmaterials; //준비물
	private String fminfo; //추가정보
	private String fprecaution; //유의사항
	private String user_id; //주최자
	private int heart; //좋아요
	private int rsum; //해당 리뷰점수합
	private int rcount; //해당 리뷰갯수
	private Date f_create_date; //작성날짜
	private String f_status; //상태
	private String originalFileName; 
	private String renameFileName;
	
	public Board() {}

	public Board(int rnum, int fno, int ftype, int price, String small_title, String ftitle, String category,
			String location, int lat, int lon, String fcontain, String fncontain, String fcalendar, String fmaterials,
			String fminfo, String fprecaution, String user_id, int heart, int rsum, int rcount, Date f_create_date,
			String f_status, String originalFileName, String renameFileName) {
		super();
		this.rnum = rnum;
		this.fno = fno;
		this.ftype = ftype;
		this.price = price;
		this.small_title = small_title;
		this.ftitle = ftitle;
		this.category = category;
		this.location = location;
		this.lat = lat;
		this.lon = lon;
		this.fcontain = fcontain;
		this.fncontain = fncontain;
		this.fcalendar = fcalendar;
		this.fmaterials = fmaterials;
		this.fminfo = fminfo;
		this.fprecaution = fprecaution;
		this.user_id = user_id;
		this.heart = heart;
		this.rsum = rsum;
		this.rcount = rcount;
		this.f_create_date = f_create_date;
		this.f_status = f_status;
		this.originalFileName = originalFileName;
		this.renameFileName = renameFileName;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public int getFno() {
		return fno;
	}

	public void setFno(int fno) {
		this.fno = fno;
	}

	public int getFtype() {
		return ftype;
	}

	public void setFtype(int ftype) {
		this.ftype = ftype;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getSmall_title() {
		return small_title;
	}

	public void setSmall_title(String small_title) {
		this.small_title = small_title;
	}

	public String getFtitle() {
		return ftitle;
	}

	public void setFtitle(String ftitle) {
		this.ftitle = ftitle;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public int getLat() {
		return lat;
	}

	public void setLat(int lat) {
		this.lat = lat;
	}

	public int getLon() {
		return lon;
	}

	public void setLon(int lon) {
		this.lon = lon;
	}

	public String getFcontain() {
		return fcontain;
	}

	public void setFcontain(String fcontain) {
		this.fcontain = fcontain;
	}

	public String getFncontain() {
		return fncontain;
	}

	public void setFncontain(String fncontain) {
		this.fncontain = fncontain;
	}

	public String getFcalendar() {
		return fcalendar;
	}

	public void setFcalendar(String fcalendar) {
		this.fcalendar = fcalendar;
	}

	public String getFmaterials() {
		return fmaterials;
	}

	public void setFmaterials(String fmaterials) {
		this.fmaterials = fmaterials;
	}

	public String getFminfo() {
		return fminfo;
	}

	public void setFminfo(String fminfo) {
		this.fminfo = fminfo;
	}

	public String getFprecaution() {
		return fprecaution;
	}

	public void setFprecaution(String fprecaution) {
		this.fprecaution = fprecaution;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getHeart() {
		return heart;
	}

	public void setHeart(int heart) {
		this.heart = heart;
	}

	public int getRsum() {
		return rsum;
	}

	public void setRsum(int rsum) {
		this.rsum = rsum;
	}

	public int getRcount() {
		return rcount;
	}

	public void setRcount(int rcount) {
		this.rcount = rcount;
	}

	public Date getF_create_date() {
		return f_create_date;
	}

	public void setF_create_date(Date f_create_date) {
		this.f_create_date = f_create_date;
	}

	public String getF_status() {
		return f_status;
	}

	public void setF_status(String f_status) {
		this.f_status = f_status;
	}

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

	public String getRenameFileName() {
		return renameFileName;
	}

	public void setRenameFileName(String renameFileName) {
		this.renameFileName = renameFileName;
	}

	@Override
	public String toString() {
		return "Board [rnum=" + rnum + ", fno=" + fno + ", ftype=" + ftype + ", price=" + price + ", small_title="
				+ small_title + ", ftitle=" + ftitle + ", category=" + category + ", location=" + location + ", lat="
				+ lat + ", lon=" + lon + ", fcontain=" + fcontain + ", fncontain=" + fncontain + ", fcalendar="
				+ fcalendar + ", fmaterials=" + fmaterials + ", fminfo=" + fminfo + ", fprecaution=" + fprecaution
				+ ", user_id=" + user_id + ", heart=" + heart + ", rsum=" + rsum + ", rcount=" + rcount
				+ ", f_create_date=" + f_create_date + ", f_status=" + f_status + ", originalFileName="
				+ originalFileName + ", renameFileName=" + renameFileName + "]";
	}

	
	

	
	

}

package com.kh.bubblebee.purchase.model.vo;

import java.sql.Date;

public class PBoard {

	private int fno;
	private String ftitle;
	private int ftype;
	private int price;
	private String small_title;
	private String category;
	private String location;
	private int lat;
	private int lon;
	private String fcontain;
	private String fncontain;
	private String fcalendar;
	private String fmaterials;
	private String fminfo;
	private String fprecaution;
	private String user_id;
	private String heart;
	private int rsum;
	private int rcount;
	private Date f_create_date;
	private char f_status;
	private String originalfilename;
	private String renamefilename;
	private String introduce;
	private int maxmember;

	public PBoard() {
		
	}

	public PBoard(int fno, String ftitle, int ftype, int price, String small_title, String category, String location,
			int lat, int lon, String fcontain, String fncontain, String fcalendar, String fmaterials, String fminfo,
			String fprecaution, String user_id, String heart, int rsum, int rcount, Date f_create_date, char f_status,
			String originalfilename, String renamefilename, String introduce, int maxmember) {
		super();
		this.fno = fno;
		this.ftitle = ftitle;
		this.ftype = ftype;
		this.price = price;
		this.small_title = small_title;
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
		this.originalfilename = originalfilename;
		this.renamefilename = renamefilename;
		this.introduce = introduce;
		this.maxmember = maxmember;
	}

	public int getFno() {
		return fno;
	}

	public void setFno(int fno) {
		this.fno = fno;
	}

	public String getFtitle() {
		return ftitle;
	}

	public void setFtitle(String ftitle) {
		this.ftitle = ftitle;
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

	public String getHeart() {
		return heart;
	}

	public void setHeart(String heart) {
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

	public char getF_status() {
		return f_status;
	}

	public void setF_status(char f_status) {
		this.f_status = f_status;
	}

	public String getOriginalfilename() {
		return originalfilename;
	}

	public void setOriginalfilename(String originalfilename) {
		this.originalfilename = originalfilename;
	}

	public String getRenamefilename() {
		return renamefilename;
	}

	public void setRenamefilename(String renamefilename) {
		this.renamefilename = renamefilename;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public int getMaxmember() {
		return maxmember;
	}

	public void setMaxmemter(int maxmember) {
		this.maxmember = maxmember;
	}

	@Override
	public String toString() {
		return "PBoard [fno=" + fno + ", ftitle=" + ftitle + ", ftype=" + ftype + ", price=" + price + ", small_title="
				+ small_title + ", category=" + category + ", location=" + location + ", lat=" + lat + ", lon=" + lon
				+ ", fcontain=" + fcontain + ", fncontain=" + fncontain + ", fcalendar=" + fcalendar + ", fmaterials="
				+ fmaterials + ", fminfo=" + fminfo + ", fprecaution=" + fprecaution + ", user_id=" + user_id
				+ ", heart=" + heart + ", rsum=" + rsum + ", rcount=" + rcount + ", f_create_date=" + f_create_date
				+ ", f_status=" + f_status + ", originalfilename=" + originalfilename + ", renamefilename="
				+ renamefilename + ", introduce=" + introduce + ", maxmember=" + maxmember + "]";
	}

		
}

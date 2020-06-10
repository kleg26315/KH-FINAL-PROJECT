package com.kh.bubblebee.purchase.model.vo;

public class PBoard {

	private int fno;
	private int ftype;
	private int price;
	private String small_title;
	private String category;
	private String location;
	private String fcontain;
	private String fncontain;
	private String fcalendar;
	private String fmaterials;
	private String fminfo;
	private String fprecaution;
	private String user_id;
	private String like;

	public PBoard() {
		
	}

	public PBoard(int fno, int ftype, int price, String small_title, String category, String location, String fcontain,
			String fncontain, String fcalendar, String fmaterials, String fminfo, String fprecaution, String user_id,
			String like) {
		super();
		this.fno = fno;
		this.ftype = ftype;
		this.price = price;
		this.small_title = small_title;
		this.category = category;
		this.location = location;
		this.fcontain = fcontain;
		this.fncontain = fncontain;
		this.fcalendar = fcalendar;
		this.fmaterials = fmaterials;
		this.fminfo = fminfo;
		this.fprecaution = fprecaution;
		this.user_id = user_id;
		this.like = like;
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

	public String getLike() {
		return like;
	}

	public void setLike(String like) {
		this.like = like;
	}

	@Override
	public String toString() {
		return "PBoard [fno=" + fno + ", ftype=" + ftype + ", price=" + price + ", small_title=" + small_title
				+ ", category=" + category + ", location=" + location + ", fcontain=" + fcontain + ", fncontain="
				+ fncontain + ", fcalendar=" + fcalendar + ", fmaterials=" + fmaterials + ", fminfo=" + fminfo
				+ ", fprecaution=" + fprecaution + ", user_id=" + user_id + ", like=" + like + "]";
	}
	
	
	
}

package com.kh.bubblebee.board.model.vo;

public class SearchCondition {
	
	private String location;
	private String popular;
	private String latest;
	private String rate;
	private String highprice;
	private String lowprice;
	private int startPrice;
	private int endPrice;
	
	public SearchCondition() {}

	public SearchCondition(String location, String popular, String latest, String rate, String highprice,
			String lowprice, int startPrice, int endPrice) {
		super();
		this.location = location;
		this.popular = popular;
		this.latest = latest;
		this.rate = rate;
		this.highprice = highprice;
		this.lowprice = lowprice;
		this.startPrice = startPrice;
		this.endPrice = endPrice;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getPopular() {
		return popular;
	}

	public void setPopular(String popular) {
		this.popular = popular;
	}

	public String getLatest() {
		return latest;
	}

	public void setLatest(String latest) {
		this.latest = latest;
	}

	public String getRate() {
		return rate;
	}

	public void setRate(String rate) {
		this.rate = rate;
	}

	public String getHighprice() {
		return highprice;
	}

	public void setHighprice(String highprice) {
		this.highprice = highprice;
	}

	public String getLowprice() {
		return lowprice;
	}

	public void setLowprice(String lowprice) {
		this.lowprice = lowprice;
	}

	public int getStartPrice() {
		return startPrice;
	}

	public void setStartPrice(int startPrice) {
		this.startPrice = startPrice;
	}

	public int getEndPrice() {
		return endPrice;
	}

	public void setEndPrice(int endPrice) {
		this.endPrice = endPrice;
	}

	@Override
	public String toString() {
		return "SearchCondition [location=" + location + ", popular=" + popular + ", latest=" + latest + ", rate="
				+ rate + ", highprice=" + highprice + ", lowprice=" + lowprice + ", startPrice=" + startPrice
				+ ", endPrice=" + endPrice + "]";
	}
	
	

	
	
	
	
	
	
	

}

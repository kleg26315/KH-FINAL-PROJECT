package com.kh.bubblebee.account.model.vo;

import java.sql.Date;

public class Account {
	private int acno;
	private String user_id;
	private Date period;
	private String name;
	private int people;
	private String sales;
	private String amount;
	private String progress;
	private String user_name;
	
	public Account() {}

	public Account(int acno, String user_id, Date period, String name, int people, String sales, String amount,
			String progress, String user_name) {
		super();
		this.acno = acno;
		this.user_id = user_id;
		this.period = period;
		this.name = name;
		this.people = people;
		this.sales = sales;
		this.amount = amount;
		this.progress = progress;
		this.user_name = user_name;
	}

	public int getAcno() {
		return acno;
	}

	public void setAcno(int acno) {
		this.acno = acno;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public Date getPeriod() {
		return period;
	}

	public void setPeriod(Date period) {
		this.period = period;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPeople() {
		return people;
	}

	public void setPeople(int people) {
		this.people = people;
	}

	public String getSales() {
		return sales;
	}

	public void setSales(String sales) {
		this.sales = sales;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public String getProgress() {
		return progress;
	}

	public void setProgress(String progress) {
		this.progress = progress;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	@Override
	public String toString() {
		return "Account [acno=" + acno + ", user_id=" + user_id + ", period=" + period + ", name=" + name + ", people="
				+ people + ", sales=" + sales + ", amount=" + amount + ", progress=" + progress + ", user_name="
				+ user_name + "]";
	}
	
	
}
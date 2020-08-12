package com.rsh.smp.vo;

public class CartVO {
	private int userNumber;
	private String cookieNumber;
	private int productNumber;
	private int amount;
	private String color;
	private String sizes;
	public int getUserNumber() {
		return userNumber;
	}
	public void setUserNumber(int userNumber) {
		this.userNumber = userNumber;
	}
	public String getCookieNumber() {
		return cookieNumber;
	}
	public void setCookieNumber(String cookieNumber) {
		this.cookieNumber = cookieNumber;
	}
	public int getProductNumber() {
		return productNumber;
	}
	public void setProductNumber(int productNumber) {
		this.productNumber = productNumber;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getSizes() {
		return sizes;
	}
	public void setSizes(String sizes) {
		this.sizes = sizes;
	}
	
}

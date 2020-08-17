package com.rsh.smp.vo;

import java.util.List;

public class OrdersVO {
	private int ordernumber;
	private int usernumber;
	private int nonusernumber;
	private int productnumber;
	private int amount;
	private String state;
	private int price;
	private String color;
	private String sizes;
	private List<OrdersVO> ordersVOList;
	
	

	public List<OrdersVO> getOrdersVOList() {
		return ordersVOList;
	}
	public void setOrdersVOList(List<OrdersVO> ordersVOList) {
		this.ordersVOList = ordersVOList;
	}
	public int getOrdernumber() {
		return ordernumber;
	}
	public void setOrdernumber(int ordernumber) {
		this.ordernumber = ordernumber;
	}
	public int getUsernumber() {
		return usernumber;
	}
	public void setUsernumber(int usernumber) {
		this.usernumber = usernumber;
	}
	public int getNonusernumber() {
		return nonusernumber;
	}
	public void setNonusernumber(int nonusernumber) {
		this.nonusernumber = nonusernumber;
	}
	public int getProductnumber() {
		return productnumber;
	}
	public void setProductnumber(int productnumber) {
		this.productnumber = productnumber;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
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

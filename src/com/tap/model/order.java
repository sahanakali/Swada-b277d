package com.tap.model;

import java.sql.Timestamp;

public class order {
	
	private int OrderID;
	private int UserID;
	private int RestaurantID;
	private Timestamp orderDate;
	private double TotalAmount;
	private String Status;
	private String PaymentMethod;
	public int getOrderID() {
		return OrderID;
	}
	public void setOrderID(int orderID) {
		OrderID = orderID;
	}
	public int getUserID() {
		return UserID;
	}
	public void setUserID(int userID) {
		UserID = userID;
	}
	public int getRestaurantID() {
		return RestaurantID;
	}
	public void setRestaurantID(int restaurantID) {
		RestaurantID = restaurantID;
	}
	public Timestamp getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Timestamp orderDate) {
		this.orderDate = orderDate;
	}
	public void setTotalAmount(double d) {
	    TotalAmount = d;
	}
	public double getTotalAmount() {
	    return TotalAmount;
	}
	
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		Status = status;
	}
	public String getPaymentMethod() {
		return PaymentMethod;
	}
	public void setPaymentMethod(String paymentMethod) {
		PaymentMethod = paymentMethod;
	}
	@Override
	public String toString() {
		return "orderTable [OrderID=" + OrderID + ", UserID=" + UserID + ", RestaurantID=" + RestaurantID
				+ ", orderDate=" + orderDate + ", TotalAmount=" + TotalAmount + ", Status=" + Status
				+ ", PaymentMethod=" + PaymentMethod + "]";
	}
	public order(int userID, int restaurantID, Timestamp timestamp, double grandTotal, String status,
			String paymentMethod) {
		super();
		UserID = userID;
		RestaurantID = restaurantID;
		this.orderDate = timestamp;
		TotalAmount = grandTotal;
		Status = status;
		PaymentMethod = paymentMethod;
	}
	public order() {
		super();
	}
	
	
	
	
	
	
	
}

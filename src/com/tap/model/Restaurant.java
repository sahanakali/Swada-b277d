package com.tap.model;

public class Restaurant {
	
	private int resturantID;
	private String name;
	private String cusineType;
	private int deliveryTime;
	private String address;
	private int adminUserId;
	private float rating;
	private boolean isActive;
	private String imagepath; 
	public Restaurant() {
		super();
	}
	public Restaurant(int resturantID, String name, String cusineType, int deliveryTime, String address, int adminUserId,
			float rating, boolean isActive, String imagepath) {
		super();
		this.resturantID = resturantID;
		this.name = name;
		this.cusineType = cusineType;
		this.deliveryTime = deliveryTime;
		this.address = address;
		this.adminUserId = adminUserId;
		this.rating = rating;
		this.isActive = isActive;
		this.imagepath = imagepath;
	}
	@Override
	public String toString() {
		return "resturant [resturantID=" + resturantID + ", name=" + name + ", cusineType=" + cusineType
				+ ", deliveryTime=" + deliveryTime + ", address=" + address + ", adminUserId=" + adminUserId
				+ ", rating=" + rating + ", isActive=" + isActive + ", imagepath=" + imagepath + "]";
	}
	public int getResturantID() {
		return resturantID;
	}
	public void setResturantID(int resturantID) {
		this.resturantID = resturantID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCusineType() {
		return cusineType;
	}
	public void setCusineType(String cusineType) {
		this.cusineType = cusineType;
	}
	public int getDeliveryTime() {
		return deliveryTime;
	}
	public void setDeliveryTime(int deliveryTime) {
		this.deliveryTime = deliveryTime;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getAdminUserId() {
		return adminUserId;
	}
	public void setAdminUserId(int adminUserId) {
		this.adminUserId = adminUserId;
	}
	public float getRating() {
		return rating;
	}
	public void setRating(float rating) {
		this.rating = rating;
	}
	public boolean isActive() {
		return isActive;
	}
	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}
	public String getImagepath() {
		return imagepath;
	}
	public void setImagepath(String imagepath) {
		this.imagepath = imagepath;
	}
}

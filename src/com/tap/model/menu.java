package com.tap.model;

public class menu {
	
	private int menuId;
	private int resturantId;
	private String itemName;
	private String description;
	private float Price;
	private boolean isAvailable;
	private String category;
	private String imagePath;
	private float rating;
	private String foodType;

	
	

	public menu(int menuId, int resturantId, String itemName,
            String description, float price, boolean isAvailable,
            String category, String imagePath, float rating,String foodType) {

    this.menuId = menuId;
    this.resturantId = resturantId;
    this.itemName = itemName;
    this.description = description;
    this.Price = price;
    this.isAvailable = isAvailable;
    this.category = category;
    this.imagePath = imagePath;
    this.rating = rating;
    this.foodType = foodType;
}





	public int getMenuId() {
		return menuId;
	}





	


	@Override
	public String toString() {
		return "menu [menuId=" + menuId + ", resturantId=" + resturantId + ", itemName=" + itemName + ", description="
				+ description + ", Price=" + Price + ", isAvailable=" + isAvailable + ", category=" + category
				+ ", imagePath=" + imagePath + ", rating=" + rating + ", foodType=" + foodType + "]";
	}
	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}
	public int getResturantId() {
		return resturantId;
	}
	public void setResturantId(int resturantId) {
		this.resturantId = resturantId;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public float getPrice() {
		return Price;
	}
	public void setPrice(float price) {
		Price = price;
	}
	public boolean isAvailable() {
		return isAvailable;
	}
	public void setAvailable(boolean isAvailable) {
		this.isAvailable = isAvailable;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public float getRating() {
		return rating;
	}

	public void setRating(float rating) {
		this.rating = rating;
	}
	public String getFoodType() {
		return foodType;
	}
	public void setFoodType(String foodType) {
		this.foodType = foodType;
	}

}

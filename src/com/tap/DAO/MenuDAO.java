package com.tap.DAO;

import java.util.List;

import com.tap.model.menu;

public interface MenuDAO {

		void addMenu(menu menu);

	    menu getMenu(int menuId);

	    void updateMenu(menu menu);

	    void deleteMenu(int menuId);

	    List<menu> getAllMenu();

	    List<menu> getMenuByRestaurantId(int restaurantId);
}


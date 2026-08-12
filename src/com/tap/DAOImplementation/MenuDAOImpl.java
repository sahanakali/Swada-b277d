package com.tap.DAOImplementation;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.MenuDAO;
import com.tap.model.menu;
import com.tap.utility.DBConnection; 

public class MenuDAOImpl implements MenuDAO {

	private static final String INSERT_MENU =
			"INSERT INTO menu(resturantID,itemName,description,Price,isAvailable,category,imagePath,rating,foodType) "
			+ "VALUES(?,?,?,?,?,?,?,?,?)";

	private static final String GET_MENU =
			"SELECT * FROM menu WHERE menuId=?";

	private static final String GET_ALL_MENU =
			"SELECT * FROM menu";

	private static final String GET_MENU_BY_RESTAURANT =
			"SELECT * FROM menu WHERE resturantID=?";

	private static final String UPDATE_MENU =
			" UPDATE menu SET resturantID=?, itemName=?, description=?, Price=?, isAvailable=?, category=?, imagePath=?, rating=?, foodType=? WHERE menuId=?";
	private static final String DELETE_MENU =
			"DELETE FROM menu WHERE menuId=?";

	@Override
	public void addMenu(menu m) {

		try (Connection con = DBConnection.getConnection();
				PreparedStatement pstmt = con.prepareStatement(INSERT_MENU)) {

			pstmt.setInt(1, m.getResturantId());
			pstmt.setString(2, m.getItemName());
			pstmt.setString(3, m.getDescription());
			pstmt.setFloat(4, m.getPrice());
			pstmt.setBoolean(5, m.isAvailable());
			pstmt.setString(6, m.getCategory());
			pstmt.setString(7, m.getImagePath());
			pstmt.setFloat(8, m.getRating());
			pstmt.setString(9, m.getFoodType());
			pstmt.setInt(10, m.getMenuId()); 
			

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public menu getMenu(int menuId) {

		menu m = null;

		try (Connection con = DBConnection.getConnection();
				PreparedStatement pstmt = con.prepareStatement(GET_MENU)) {

			pstmt.setInt(1, menuId);

			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {

				m = new menu(
						rs.getInt("menuId"),
	                    rs.getInt("resturantID"),    
	                    rs.getString("itemName"),
	                    rs.getString("description"),
	                    rs.getFloat("Price"),         
	                    rs.getBoolean("isAvailable"),
	                    rs.getString("category"),
	                    rs.getString("imagePath"),    
	                    rs.getFloat("rating"),
	                    rs.getString("foodType")
						);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return m;
	}

	@Override
	public List<menu> getAllMenu() {

		List<menu> menuList = new ArrayList<>();

		try (Connection con = DBConnection.getConnection();
				Statement stmt = con.createStatement()) {

			ResultSet rs = stmt.executeQuery(GET_ALL_MENU);

			while (rs.next()) {

				menuList.add(new menu(
						rs.getInt("menuId"),
						rs.getInt("resturantID"),
						rs.getString("itemName"),
						rs.getString("description"),
						rs.getFloat("Price"),
						rs.getBoolean("isAvailable"),
						rs.getString("category"), 
						rs.getString("imagePath"),
						rs.getFloat("rating"),
						rs.getString("foodType")
						));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return menuList;
	}

	@Override
	public List<menu> getMenuByRestaurantId(int restaurantId) {

	    List<menu> menuList = new ArrayList<>();

	    try (Connection con = DBConnection.getConnection();
	         PreparedStatement pstmt = con.prepareStatement(GET_MENU_BY_RESTAURANT)) {

	        pstmt.setInt(1, restaurantId);

	        ResultSet rs = pstmt.executeQuery();

	        while (rs.next()) {
	        	
	        	System.out.println(
        		        rs.getString("itemName") + " -> " + rs.getFloat("rating")
        		    );

	        	  menuList.add(new menu(
	        		        rs.getInt("menuId"),
	        		        rs.getInt("resturantID"),
	        		        rs.getString("itemName"),
	        		        rs.getString("description"),
	        		        rs.getFloat("Price"),
	        		        rs.getBoolean("isAvailable"),
	        		        rs.getString("category"),
	        		        rs.getString("imagePath"),
	        		        rs.getFloat("rating"),
	        		        rs.getString("foodType")
	        		    ));
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return menuList;
	}

	@Override
	public void updateMenu(menu m) {

		try (Connection con = DBConnection.getConnection();
				PreparedStatement pstmt = con.prepareStatement(UPDATE_MENU)) {

			pstmt.setInt(1, m.getResturantId());
			pstmt.setString(2, m.getItemName());
			pstmt.setString(3, m.getDescription());
			pstmt.setFloat(4, m.getPrice());
			pstmt.setBoolean(5, m.isAvailable());
			pstmt.setString(6, m.getCategory());
			pstmt.setString(7, m.getImagePath());
			pstmt.setFloat(8, m.getRating());
			pstmt.setInt(9, m.getMenuId());

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteMenu(int menuId) {

		try (Connection con = DBConnection.getConnection();
				PreparedStatement pstmt = con.prepareStatement(DELETE_MENU)) {

			pstmt.setInt(1, menuId);

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
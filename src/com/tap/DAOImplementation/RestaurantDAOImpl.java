package com.tap.DAOImplementation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.ResturantDAO;
import com.tap.model.Restaurant;
import com.tap.utility.DBConnection;


public class RestaurantDAOImpl implements ResturantDAO {

    private Connection con;

	private int restaurantId;

    private static final String INSERT =
            "INSERT INTO restaurant(name,cusineType,deliveryTime,address,adminUserId,rating,isActive,imagepath) VALUES(?,?,?,?,?,?,?,?)";

    private static final String GET =
            "SELECT * FROM restaurant WHERE resturantID=?";

    private static final String UPDATE =
            "UPDATE restaurant SET name=?, cusineType=?, deliveryTime=?, address=?, adminUserId=?, rating=?, isActive=?, imagepath=? WHERE resturantID=?";

    private static final String DELETE =
            "DELETE FROM restaurant WHERE resturantID=?";

    private static final String GETALL =
            "SELECT * FROM restaurant";

    public RestaurantDAOImpl() {
        con = DBConnection.getConnection();
    }

    public void addRestaurant(Restaurant restaurant) {

        try {

            PreparedStatement pstmt = con.prepareStatement(INSERT);

            pstmt.setString(1, restaurant.getName());
            pstmt.setString(2, restaurant.getCusineType());
            pstmt.setInt(3, restaurant.getDeliveryTime());
            pstmt.setString(4, restaurant.getAddress());
            pstmt.setInt(5, restaurant.getAdminUserId());
            pstmt.setFloat(6, restaurant.getRating());
            pstmt.setBoolean(7, restaurant.isActive());
            pstmt.setString(8, restaurant.getImagepath());

            pstmt.executeUpdate();

            System.out.println("Restaurant Added Successfully");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void UpdateRestaurant(Restaurant restaurant) {

        try {

            PreparedStatement pstmt = con.prepareStatement(UPDATE);

            pstmt.setString(1, restaurant.getName());
            pstmt.setString(2, restaurant.getCusineType());
            pstmt.setInt(3, restaurant.getDeliveryTime());
            pstmt.setString(4, restaurant.getAddress());
            pstmt.setInt(5, restaurant.getAdminUserId());
            pstmt.setFloat(6, restaurant.getRating());
            pstmt.setBoolean(7, restaurant.isActive());
            pstmt.setString(8, restaurant.getImagepath());
            pstmt.setInt(9, restaurant.getResturantID());

            pstmt.executeUpdate();

            System.out.println("Restaurant Updated Successfully");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteRestaurant(int restaurantId) {

        try {

            PreparedStatement pstmt = con.prepareStatement(DELETE);

            pstmt.setInt(1, restaurantId);

            pstmt.executeUpdate();

            System.out.println("Restaurant Deleted Successfully");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Restaurant> getAllRestaurant() {

        List<Restaurant> restaurantList = new ArrayList<>();

        try {

            Statement stmt = con.createStatement();

            ResultSet rs = stmt.executeQuery(GETALL);

            while (rs.next()) {

                restaurantList.add(extractRestaurant(rs));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return restaurantList;
    }

    private Restaurant extractRestaurant(ResultSet rs) {

        try {

            return new Restaurant(
                    rs.getInt("resturantId"),
                    rs.getString("name"),
                    rs.getString("cusineType"),
                    rs.getInt("deliveryTime"),
                    rs.getString("address"),
                    rs.getInt("adminUserId"),
                    rs.getFloat("rating"),
                    rs.getBoolean("isActive"),
                    rs.getString("imagepath")
            );

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    @Override
    public Restaurant getRestaurant(int restaurantId) {

        Restaurant restaurant = null;

        try {

            PreparedStatement pstmt = con.prepareStatement(GET);
            pstmt.setInt(1, restaurantId);

            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                restaurant = extractRestaurant(rs);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return restaurant;
    }

	public int getRestaurantId() {
		return restaurantId;
	}

	public void setRestaurantId(int restaurantId) {
		this.restaurantId = restaurantId;
	}
}
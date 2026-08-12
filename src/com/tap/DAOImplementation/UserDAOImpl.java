package com.tap.DAOImplementation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;



import com.tap.DAO.UserDAO;
import com.tap.model.user;
import com.tap.utility.DBConnection;

public class UserDAOImpl implements UserDAO {
	
	String INSERT_QUERY = "INSERT INTO user(user_name, email, phone, password, address, city, pincode, role, created_Date, lastLogin_Date)"
			+ "VALUES (?,?,?,?,?,?,?,?,?,?)";
	String GET_QUERY = "SELECT * FROM user WHERE user_id = ?";
	
	private static final String GET_USER_BY_USERNAME =
	        "SELECT * FROM user WHERE user_name = ?";
	
	private user user;
	
	@Override
	public int addUser(user user) {
		Connection connection = DBConnection.getConnection();
		int i = 0;
		try {
			PreparedStatement psmt = connection.prepareStatement(INSERT_QUERY);
			
			psmt.setString(1, user.getUserName());
			psmt.setString(2, user.getEmail());
			psmt.setString(3, user.getPhone());
			psmt.setString(4, user.getPassword());
			psmt.setString(5, user.getAddress());
			psmt.setString(6, user.getCity());
			psmt.setString(7, user.getPincode());
			psmt.setString(8, user.getRole());
			psmt.setTimestamp(9, new Timestamp(System.currentTimeMillis()));
			psmt.setTimestamp(10, new Timestamp(System.currentTimeMillis()));
			
			i = psmt.executeUpdate();
			System.out.println("Rows inserted: " + i);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;
	}

	@Override
	public user getUser(int userId) {
		Connection connection = DBConnection.getConnection();
		
		try {
			PreparedStatement psmt = connection.prepareStatement(GET_QUERY);
			psmt.setInt(1, userId);
			ResultSet res = psmt.executeQuery();
			
			while(res.next())
			{
				int id = res.getInt("user_id");
				String name = res.getString("user_name");
				String email = res.getString("email");
				String phone = res.getString("phone");
				String password = res.getString("password");
				String address = res.getString("address");
				String city = res.getString("city");
				String pincode = res.getString("pincode");
				String role = res.getString("role");
				Timestamp createdDate = res.getTimestamp("created_Date");
				Timestamp lastLoginDate = res.getTimestamp("lastLogin_Date");
				
				user = new user(id, name, email, phone, password, address, city, pincode, role, createdDate, lastLoginDate);
			}
			return user;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
		
	}

	@Override
	public List<user> getAllUser() {
		
		String GET_ALL_USER = "SELECT * FROM user";
		ArrayList<user> list = new ArrayList<>();
		
		Connection connection = DBConnection.getConnection();
		try {
			Statement smt = connection.createStatement();
			ResultSet res = smt.executeQuery(GET_ALL_USER);
			
			while(res.next()) {
				user u = extractUserFromResultSet(res);
				list.add(u);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
			
	}
	private user extractUserFromResultSet(ResultSet res) throws SQLException 
	{
			int id = res.getInt("user_id");
			String name = res.getString("user_name");
			String email = res.getString("email");
			String phone = res.getString("phone");
			String password = res.getString("password");
			String address = res.getString("address");
			String city = res.getString("city");
			String pincode = res.getString("pincode");
			String role = res.getString("role");
			Timestamp createdDate = res.getTimestamp("created_Date");
			Timestamp lastLoginDate = res.getTimestamp("lastLogin_Date");
			
			user u = new user(id, name, email, phone, password, address, city, pincode, role, createdDate, lastLoginDate);
			return u;
		
	}
	
	@Override
	public void UpdateUser(user user) {

	    		String UPDATE_USER = "UPDATE user SET user_name=?, password=?, email=?, address=?, lastLogin_Date=? WHERE user_id=?";

	    Connection connection = DBConnection.getConnection();

	    try {
	        PreparedStatement pstmt = connection.prepareStatement(UPDATE_USER);

	        pstmt.setString(1, user.getUserName());
	        pstmt.setString(2, user.getPassword());
	        pstmt.setString(3, user.getEmail());
	        pstmt.setString(4, user.getAddress());
	        pstmt.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
	        pstmt.setInt(6, user.getUserid());

	        int rows = pstmt.executeUpdate();

	        System.out.println("Rows Updated = " + rows);

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}
	

	@Override
	public user getUserByUsername(String userName) {

	    Connection connection = DBConnection.getConnection();

	    try {
	        PreparedStatement pstmt = connection.prepareStatement(GET_USER_BY_USERNAME);
	        pstmt.setString(1, userName);

	        ResultSet res = pstmt.executeQuery();

	        if (res.next()) {

	        		    return new user(
						    res.getInt("user_id"),
						    res.getString("user_name"),
						    res.getString("email"),
						    res.getString("phone"),
						    res.getString("password"),
						    res.getString("address"),
						    res.getString("city"),
						    res.getString("pincode"),
						    res.getString("role"),
						    res.getTimestamp("created_Date"),
						    res.getTimestamp("lastLogin_Date")
				    );
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return null;
	}

}

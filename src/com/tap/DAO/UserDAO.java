package com.tap.DAO;

import java.util.List;

import com.tap.model.user;

public interface UserDAO {
	int addUser(user user);
	user getUser(int userId);
	void UpdateUser(user user);
	List<user> getAllUser();
	user getUserByUsername(String userName);
}

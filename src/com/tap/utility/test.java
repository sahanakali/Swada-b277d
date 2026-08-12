package com.tap.utility;

import com.tap.DAOImplementation.UserDAOImpl;
import com.tap.model.user;

public class test {

	public static void main(String[] args) {
		
		UserDAOImpl userDAOImpl = new UserDAOImpl();
		user user = userDAOImpl.getUser(1);
		user.setEmail("sahana@gmail.com");
		userDAOImpl.UpdateUser(user);
		
	}

}

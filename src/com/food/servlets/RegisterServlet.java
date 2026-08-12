package com.food.servlets;

import java.io.IOException;

import org.mindrot.jbcrypt.BCrypt;

import com.tap.DAOImplementation.UserDAOImpl;
import com.tap.model.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("Register Servlet Called");

		String name     = req.getParameter("name");
		String email    = req.getParameter("email");
		String phone    = req.getParameter("phone");
		String password = req.getParameter("password");
		String address  = req.getParameter("address");
		String city     = req.getParameter("city");
		String pincode  = req.getParameter("pincode");
		String role     = req.getParameter("role");

		String hashpw = BCrypt.hashpw(password, BCrypt.gensalt(12));

		user user = new user(name, email, phone, hashpw, address, city, pincode, role);

		UserDAOImpl userDAOImpl = new UserDAOImpl();
		int i = userDAOImpl.addUser(user);

		if (i > 0) {
			resp.sendRedirect("login.html");
		} else {
			resp.sendRedirect("register.html?error=failed");
		}
	}
}

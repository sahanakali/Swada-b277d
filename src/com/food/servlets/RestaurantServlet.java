package com.food.servlets;

import java.io.IOException;
import java.util.List;

import com.tap.DAOImplementation.RestaurantDAOImpl;
import com.tap.model.Restaurant;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/Restaurant")
public class RestaurantServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		RestaurantDAOImpl restaurantDAOImplementation = new RestaurantDAOImpl();
		List<Restaurant> allRestaurants = restaurantDAOImplementation.getAllRestaurant();

		req.setAttribute("allRestaurants", allRestaurants);
		
		RequestDispatcher rd = req.getRequestDispatcher("Restaurant.jsp");
		rd.forward(req, resp);
	}
}
package com.food.servlets;

import java.io.IOException;
import java.util.List;

import com.tap.DAO.ResturantDAO;
import com.tap.DAOImplementation.MenuDAOImpl;
import com.tap.DAOImplementation.RestaurantDAOImpl;
import com.tap.model.Restaurant;
import com.tap.model.menu;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/MenuServlet")
public class MenuServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private MenuDAOImpl menuDAO;
	private ResturantDAO restaurantDAO;

	@Override
	public void init() throws ServletException {

		menuDAO = new MenuDAOImpl();
		restaurantDAO = new RestaurantDAOImpl();

	}

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response)
					throws ServletException, IOException {

		try {

			int restaurantId = Integer.parseInt(request.getParameter("restaurantId"));
			HttpSession session = request.getSession();
			session.setAttribute("currentRestaurantId", restaurantId);
			System.out.println("Restaurant ID = " + restaurantId);

			Restaurant restaurant = restaurantDAO.getRestaurant(restaurantId);

			List<menu> menuList = menuDAO.getMenuByRestaurantId(restaurantId);


			System.out.println("Menu List = " + menuList);
			System.out.println("Size = " + menuList.size());
			for (menu m : menuList) {
			    System.out.println(m.getItemName());
			}
			request.setAttribute("restaurant", restaurant);
			request.setAttribute("menuList", menuList);

			request.getRequestDispatcher("/Menu.jsp").forward(request, response);

		} catch (Exception e) {

			e.printStackTrace();
			response.getWriter().println("Something went wrong while loading menu.");

		}

	}

}
package com.food.servlets;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import com.tap.DAOImplementation.MenuDAOImpl;
import com.tap.model.Cart;
import com.tap.model.Cartitem;
import com.tap.model.menu;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();

        /*
         * Get all restaurant-wise carts
         */
        @SuppressWarnings("unchecked")
        Map<Integer, Cart> carts =
                (Map<Integer, Cart>) session.getAttribute("carts");

        /*
         * If carts map does not exist, create it
         */
        if (carts == null) {
            carts = new HashMap<>();
            session.setAttribute("carts", carts);
        }

        /*
         * Get restaurant id
         */
        Integer restaurantId =
                Integer.parseInt(req.getParameter("restaurantId"));

        /*
         * Remember which restaurant is currently being viewed
         */
        session.setAttribute("currentRestaurantId", restaurantId);

        /*
         * Get cart belonging to this restaurant
         */
        Cart cart = carts.get(restaurantId);

        /*
         * If this restaurant does not have a cart,
         * create a NEW cart for this restaurant
         */
        if (cart == null) {
            cart = new Cart();
            carts.put(restaurantId, cart);
        }

        /*
         * Get action
         */
        String action = req.getParameter("action");

        if ("add".equals(action)) {

            addItemToCart(req, cart);

        } else if ("update".equals(action)) {

            updateItemToCart(req, cart);

        } else if ("delete".equals(action)) {

            removeItemToCart(req, cart);
        }

        /*
         * Save updated carts map
         */
        session.setAttribute("carts", carts);

        /*
         * Go to cart page
         */
        RequestDispatcher rd =
                req.getRequestDispatcher("/Cart.jsp");

        rd.forward(req, resp);
    }


    private void addItemToCart(HttpServletRequest req, Cart cart) {

        int menuId =
                Integer.parseInt(req.getParameter("menuId"));

        int qty =
                Integer.parseInt(req.getParameter("qty"));

        MenuDAOImpl menuDAOImpl =
                new MenuDAOImpl();

        menu menu =
                menuDAOImpl.getMenu(menuId);

        Cartitem cartitem =
                new Cartitem(
                        menu.getMenuId(),
                        menu.getResturantId(),
                        menu.getItemName(),
                        menu.getPrice(),
                        qty
                );

        cart.addItem(cartitem);
    }


    private void updateItemToCart(HttpServletRequest req, Cart cart) {

        int menuId =
                Integer.parseInt(req.getParameter("menuId"));

        int quantity =
                Integer.parseInt(req.getParameter("quantity"));

        cart.updateItem(menuId, quantity);
    }


    private void removeItemToCart(HttpServletRequest req, Cart cart) {

        int menuId =
                Integer.parseInt(req.getParameter("menuId"));

        cart.remove(menuId);
    }
}
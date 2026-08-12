package com.food.servlets;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Map;

import com.tap.DAOImplementation.OrderItemDAOImpl;
import com.tap.DAOImplementation.orderDAOImpl;
import com.tap.model.Cart;
import com.tap.model.Cartitem;
import com.tap.model.order;
import com.tap.model.orderItem;
import com.tap.model.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/CheckoutServlet")
public class CheckoutServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();

        System.out.println("========== CHECKOUT START ==========");

        // =====================================================
        // 1. GET LOGGED-IN USER
        // =====================================================

        user loggedInUser =
                (user) session.getAttribute("user");

        if (loggedInUser == null) {

            System.out.println("ERROR: User is not logged in");

            resp.sendRedirect(
                    req.getContextPath() + "/login.html"
            );

            return;
        }

        System.out.println(
                "Logged-in user ID = "
                + loggedInUser.getUserid()
        );


        // =====================================================
        // 2. GET CURRENT RESTAURANT ID
        // =====================================================

        Integer restaurantId =
                (Integer) session.getAttribute(
                        "currentRestaurantId"
                );

        if (restaurantId == null) {

            System.out.println(
                    "ERROR: currentRestaurantId is null"
            );

            resp.sendRedirect(
                    req.getContextPath() + "/Restaurant"
            );

            return;
        }

        System.out.println(
                "Restaurant ID = " + restaurantId
        );


        // =====================================================
        // 3. GET RESTAURANT-WISE CARTS
        // =====================================================

        @SuppressWarnings("unchecked")
        Map<Integer, Cart> carts =
                (Map<Integer, Cart>)
                        session.getAttribute("carts");

        if (carts == null) {

            System.out.println(
                    "ERROR: carts session attribute is null"
            );

            resp.sendRedirect(
                    req.getContextPath() + "/Cart.jsp"
            );

            return;
        }


        // =====================================================
        // 4. GET CURRENT RESTAURANT CART
        // =====================================================

        Cart cart = carts.get(restaurantId);

        if (cart == null ||
            cart.getItems() == null ||
            cart.getItems().isEmpty()) {

            System.out.println(
                    "ERROR: Cart is empty"
            );

            resp.sendRedirect(
                    req.getContextPath() + "/Cart.jsp"
            );

            return;
        }

        System.out.println(
                "Cart item count = "
                + cart.getItems().size()
        );


        // =====================================================
        // 5. GET PAYMENT METHOD
        // =====================================================

        String paymentMode =
                req.getParameter("paymentMode");

        if (paymentMode == null ||
            paymentMode.trim().isEmpty()) {

            System.out.println(
                    "ERROR: Payment method not selected"
            );

            resp.sendRedirect(
                    req.getContextPath()
                            + "/Checkout.jsp?error=payment"
            );

            return;
        }

        paymentMode = paymentMode.trim();

        System.out.println(
                "Payment Mode = " + paymentMode
        );


        // =====================================================
        // 6. CALCULATE ITEM TOTAL
        // =====================================================

        double itemTotal = 0.0;

        for (Cartitem item :
                cart.getItems().values()) {

            itemTotal +=
                    item.getPrice() * item.getQty();
        }


        // =====================================================
        // 7. CALCULATE CHARGES
        // =====================================================

        double deliveryCharges = 30.0;

        double platformFee = 10.0;

        double gst =
                Math.round(
                        itemTotal * 0.08 * 100.0
                ) / 100.0;


        double grandTotal =
                Math.round(
                        (itemTotal
                        + deliveryCharges
                        + platformFee
                        + gst) * 100.0
                ) / 100.0;


        System.out.println(
                "Item Total = " + itemTotal
        );

        System.out.println(
                "Grand Total = " + grandTotal
        );


        // =====================================================
        // 8. CREATE ORDER OBJECT
        // =====================================================

        order newOrder =
                new order(
                        loggedInUser.getUserid(),
                        restaurantId,
                        new Timestamp(
                                System.currentTimeMillis()
                        ),
                        grandTotal,
                        "Pending",
                        paymentMode
                );


        // =====================================================
        // 9. INSERT ORDER
        // =====================================================

        orderDAOImpl orderDAO =
                new orderDAOImpl();

        int orderId =
                orderDAO.addOrder(newOrder);


        System.out.println(
                "Generated Order ID = " + orderId
        );


        if (orderId <= 0) {

            System.out.println(
                    "ERROR: Order insertion failed"
            );

            session.setAttribute(
                    "checkoutError",
                    "Unable to create your order. Please try again."
            );

            resp.sendRedirect(
                    req.getContextPath()
                            + "/Checkout.jsp"
            );

            return;
        }


        // =====================================================
        // 10. INSERT ORDER ITEMS
        // =====================================================

        OrderItemDAOImpl orderItemDAO =
                new OrderItemDAOImpl();

        boolean orderItemsInserted = true;


        for (Cartitem cartitem :
                cart.getItems().values()) {

            int menuId =
                    cartitem.getMenuId();

            int quantity =
                    cartitem.getQty();

            int orderItemTotal =
                    (int) Math.round(
                            cartitem.getPrice()
                            * quantity
                    );


            orderItem item =
                    new orderItem(
                            orderId,
                            menuId,
                            quantity,
                            orderItemTotal
                    );


            int orderItemId =
                    orderItemDAO.addOrderItem(item);


            System.out.println(
                    "Order Item ID = "
                    + orderItemId
            );


            if (orderItemId <= 0) {

                orderItemsInserted = false;

                break;
            }
        }


        // =====================================================
        // 11. IF ORDER ITEMS FAILED
        // =====================================================

        if (!orderItemsInserted) {

            System.out.println(
                    "ERROR: Order item insertion failed"
            );

            session.setAttribute(
                    "checkoutError",
                    "Unable to add items to your order."
            );

            resp.sendRedirect(
                    req.getContextPath()
                            + "/Checkout.jsp"
            );

            return;
        }


        // =====================================================
        // 12. SAVE ORDER DETAILS FOR CONFIRMATION PAGE
        // =====================================================

        session.setAttribute(
                "lastOrderId",
                orderId
        );

        session.setAttribute(
                "lastOrderGrandTotal",
                grandTotal
        );

        session.setAttribute(
                "lastOrderPaymentMode",
                paymentMode
        );

        session.setAttribute(
                "lastOrderItemTotal",
                itemTotal
        );

        session.setAttribute(
                "lastOrderDeliveryCharges",
                deliveryCharges
        );

        session.setAttribute(
                "lastOrderPlatformFee",
                platformFee
        );

        session.setAttribute(
                "lastOrderGst",
                gst
        );


        // =====================================================
        // 13. SAVE DELIVERY DETAILS
        // =====================================================

        session.setAttribute(
                "lastOrderName",
                req.getParameter("name")
        );

        session.setAttribute(
                "lastOrderPhone",
                req.getParameter("phone")
        );

        session.setAttribute(
                "lastOrderEmail",
                req.getParameter("email")
        );

        session.setAttribute(
                "lastOrderAddress",
                req.getParameter("address")
        );

        session.setAttribute(
                "lastOrderCity",
                req.getParameter("city")
        );

        session.setAttribute(
                "lastOrderPincode",
                req.getParameter("pincode")
        );

        session.setAttribute(
                "lastOrderAddressType",
                req.getParameter("addressType")
        );


        // =====================================================
        // 14. REMOVE ONLY CURRENT RESTAURANT CART
        // =====================================================

        carts.remove(restaurantId);

        session.setAttribute(
                "carts",
                carts
        );


        // =====================================================
        // 15. REMOVE CHECKOUT-ONLY VALUES
        // =====================================================

        session.removeAttribute(
                "currentRestaurantId"
        );

        session.removeAttribute(
                "grandTotal"
        );

        session.removeAttribute(
                "checkoutError"
        );


        // =====================================================
        // 16. SUCCESS
        // =====================================================

        System.out.println(
                "ORDER CREATED SUCCESSFULLY"
        );

        System.out.println(
                "Order ID = " + orderId
        );

        System.out.println(
                "========== CHECKOUT END =========="
        );


        resp.sendRedirect(
                req.getContextPath()
                        + "/OderConfirmation.jsp"
        );
    }
}
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.tap.model.Cart"%>
<%@ page import="com.tap.model.Cartitem"%>
<%@ page import="java.util.Map"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Your Cart - FoodHub</title>


<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: Arial, sans-serif;
}

body {
	background-color: #f8f8f8;
	color: #333;
}

/* ================= NAVBAR ================= */
.navbar {
	background-color: #ffffff;
	height: 70px;
	padding: 0 60px;
	display: flex;
	align-items: center;
	justify-content: space-between;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

.logo {
	font-size: 28px;
	font-weight: bold;
	color: #ff5200;
}

.logo span {
	color: #333;
}

.nav-links {
	display: flex;
	align-items: center;
	gap: 30px;
}

.nav-links a {
	text-decoration: none;
	color: #333;
	font-size: 16px;
	font-weight: 500;
}

.nav-links a:hover {
	color: #ff5200;
}

/* ================= CART CONTAINER ================= */
.cart-container {
	width: 85%;
	max-width: 1200px;
	margin: 40px auto;
}

.cart-heading {
	margin-bottom: 25px;
}

.cart-heading h1 {
	font-size: 32px;
	color: #222;
	margin-bottom: 8px;
}

.cart-heading p {
	color: #777;
	font-size: 16px;
}

/* ================= RESTAURANT CART ================= */
.cart-box {
	background-color: #ffffff;
	border-radius: 12px;
	padding: 25px;
	margin-bottom: 25px;
	/* Box shadow */
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
	/* Smooth hover animation */
	transition: transform 0.25s ease, box-shadow 0.25s ease, border-color
		0.25s ease;
	border: 1px solid #eeeeee;
}

.cart-box:hover {
	transform: translateY(-4px);
	box-shadow: 0 12px 30px rgba(0, 0, 0, 0.13);
	border-color: #ffd2bf;
}

.restaurant-title {
	font-size: 22px;
	color: #222;
	margin-bottom: 20px;
	padding-bottom: 15px;
	border-bottom: 1px solid #eeeeee;
}

/* ================= CART HEADER ================= */
.cart-header {
	display: grid;
	grid-template-columns: 2fr 1fr 1fr 1.5fr 1fr;
	gap: 15px;
	padding: 12px 0;
	border-bottom: 1px solid #eeeeee;
	color: #777;
	font-size: 14px;
	font-weight: bold;
}

/* ================= CART ITEM ================= */
.cart-item {
	display: grid;
	grid-template-columns: 2fr 1fr 1fr 1.5fr 1fr;
	gap: 15px;
	align-items: center;
	padding: 20px 12px;
	border-bottom: 1px solid #eeeeee;
	border-radius: 8px;
	transition: background-color 0.2s ease, transform 0.2s ease, box-shadow
		0.2s ease;
}

.cart-item:hover {
	background-color: #fff8f4;
	transform: translateX(3px);
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.06);
}

.cart-item:last-child {
	border-bottom: none;
}

.item-name {
	font-size: 17px;
	font-weight: 600;
	color: #333;
}

.item-price {
	color: #555;
	font-size: 16px;
}

.item-total {
	color: #ff5200;
	font-size: 17px;
	font-weight: bold;
}

/* ================= QUANTITY ================= */
.quantity-box {
	display: flex;
	align-items: center;
	gap: 12px;
}

.quantity {
	min-width: 25px;
	text-align: center;
	font-size: 16px;
	font-weight: bold;
}

.qty-btn {
	width: 32px;
	height: 32px;
	border: 1px solid #ff5200;
	background-color: #ffffff;
	color: #ff5200;
	border-radius: 50%;
	font-size: 18px;
	font-weight: bold;
	cursor: pointer;
	transition: all 0.2s ease;
	box-shadow: 0 2px 6px rgba(255, 82, 0, 0.12);
}

.qty-btn:hover {
	background-color: #ff5200;
	color: white;
	transform: scale(1.12);
	box-shadow: 0 5px 12px rgba(255, 82, 0, 0.25);
}

.qty-btn:active {
	transform: scale(0.95);
}

/* ================= REMOVE ================= */
.remove-btn {
	background-color: transparent;
	border: 1px solid #ff3d00;
	color: #ff3d00;
	padding: 8px 15px;
	border-radius: 20px;
	cursor: pointer;
	font-size: 14px;
	transition: all 0.2s ease;
}

.remove-btn:hover {
	background-color: #ff3d00;
	color: white;
	transform: translateY(-2px);
	box-shadow: 0 5px 12px rgba(255, 61, 0, 0.22);
}

.remove-btn:active {
	transform: translateY(0);
}

/* ================= SUMMARY ================= */
.cart-summary {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-top: 20px;
	padding-top: 20px;
	border-top: 1px solid #eeeeee;
}

.total-text {
	font-size: 20px;
	font-weight: bold;
	color: #333;
}

.total-price {
	font-size: 23px;
	font-weight: bold;
	color: #ff5200;
}

/* ================= ACTIONS ================= */
.cart-actions {
	display: flex;
	justify-content: flex-end;
	gap: 15px;
	margin-top: 20px;
}

/* ================= ACTION BUTTONS ================= */
.add-more-btn, .checkout-btn {
	text-decoration: none;
	padding: 12px 22px;
	border-radius: 25px;
	font-size: 15px;
	font-weight: 600;
	text-align: center;
	/* Smooth animation */
	transition: all 0.25s ease;
	/* Box shadow */
	box-shadow: 0 3px 8px rgba(0, 0, 0, 0.10);
}

/* ================= ADD MORE ITEMS ================= */
.add-more-btn {
	background-color: white;
	color: #ff5200;
	border: 1px solid #ff5200;
}

.add-more-btn:hover {
	background-color: #fff3ed;
	/* Hover movement */
	transform: translateY(-3px);
	/* Stronger shadow */
	box-shadow: 0 8px 18px rgba(255, 82, 0, 0.18);
}

/* ================= CHECKOUT ================= */
.checkout-btn {
	background-color: #ff5200;
	color: white;
	border: 1px solid #ff5200;
	/* Slightly stronger initial shadow */
	box-shadow: 0 4px 10px rgba(255, 82, 0, 0.20);
}

.checkout-btn:hover {
	background-color: #e64600;
	/* Lift button */
	transform: translateY(-3px);
	/* Strong hover shadow */
	box-shadow: 0 9px 20px rgba(255, 82, 0, 0.30);
}

/* ================= CLICK EFFECT ================= */
.add-more-btn:active, .checkout-btn:active {
	transform: translateY(0);
	box-shadow: 0 3px 7px rgba(0, 0, 0, 0.15);
}

/* ================= GRAND TOTAL ================= */
.grand-total-box {
	background-color: #ffffff;
	border-radius: 12px;
	padding: 25px;
	margin-top: 30px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.08);
}

.grand-total {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.grand-total h2 {
	font-size: 24px;
	color: #222;
}

.grand-total-price {
	font-size: 28px;
	font-weight: bold;
	color: #ff5200;
}

/* ================= EMPTY CART ================= */
.empty-cart {
	background-color: #ffffff;
	border-radius: 12px;
	padding: 60px 30px;
	text-align: center;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.08);
}

.empty-cart h2 {
	font-size: 26px;
	color: #333;
	margin-bottom: 12px;
}

.empty-cart p {
	color: #777;
	margin-bottom: 25px;
}

/* ================= RESPONSIVE ================= */
@media ( max-width : 900px) {
	.cart-container {
		width: 95%;
	}
	.cart-header {
		display: none;
	}
	.cart-item {
		grid-template-columns: 1fr;
		gap: 12px;
	}
	.quantity-box {
		justify-content: flex-start;
	}
	.cart-actions {
		flex-direction: column;
	}
	.add-more-btn, .checkout-btn {
		width: 100%;
	}
}

@media ( max-width : 600px) {
	.navbar {
		padding: 0 20px;
	}
	.nav-links {
		gap: 10px;
	}
	.nav-links a {
		font-size: 13px;
	}
	.cart-heading h1 {
		font-size: 26px;
	}
}
</style>

</head>


<body>


	<!-- ================= NAVBAR ================= -->

	<div class="navbar">

		<div class="logo">
			🍽 Food<span>Express</span>
		</div>

		<div class="nav-links">

			<a href="${pageContext.request.contextPath}/Restaurant"> Home </a> <a
				href="${pageContext.request.contextPath}/Restaurant">
				Restaurants </a> <a href="${pageContext.request.contextPath}/Cart.jsp">
				Cart </a> <a href="${pageContext.request.contextPath}/login.html">
				Profile </a> <a href="${pageContext.request.contextPath}/register.html">
				Sign Up </a> <a href="${pageContext.request.contextPath}/login.html">
				Sign In </a>

		</div>

	</div>



	<!-- ================= CART CONTAINER ================= -->

	<div class="cart-container">


		<div class="cart-heading">

			<h1>Your Cart</h1>

			<p>Review your selected food items</p>

		</div>



		<%

            /*
             * Get all restaurant-wise carts
             */

            @SuppressWarnings("unchecked")

            Map<Integer, Cart> carts =
                    (Map<Integer, Cart>)
                    session.getAttribute("carts");


            double grandTotal = 0;

            boolean hasItems = false;


            /*
             * Check whether carts exist
             */

            if (carts != null && !carts.isEmpty()) {


                /*
                 * Loop through every restaurant cart
                 */

                for (Map.Entry<Integer, Cart> entry
                        : carts.entrySet()) {


                    Integer restaurantId =
                            entry.getKey();


                    Cart cart =
                            entry.getValue();


                    /*
                     * Skip empty carts
                     */

                    if (cart == null
                            || cart.getItems().isEmpty()) {

                        continue;
                    }


                    hasItems = true;


                    double restaurantTotal = 0;

        %>



		<!-- ================= ONE RESTAURANT CART ================= -->

		<div class="cart-box">





			<!-- CART HEADER -->

			<div class="cart-header">

				<div>Item</div>

				<div>Price</div>

				<div>Total</div>

				<div>Quantity</div>

				<div>Action</div>

			</div>



			<%

                /*
                 * Display items of this restaurant
                 */

                for (Cartitem item
                        : cart.getItems().values()) {


                    restaurantTotal +=
                            item.getTotalPrice();


                    grandTotal +=
                            item.getTotalPrice();

            %>



			<!-- ================= CART ITEM ================= -->

			<div class="cart-item">


				<div class="item-name">

					<%= item.getName() %>

				</div>


				<div class="item-price">

					₹<%= item.getPrice() %>

				</div>


				<div class="item-total">

					₹<%= item.getTotalPrice() %>

				</div>



				<!-- ================= QUANTITY ================= -->

				<div class="quantity-box">


					<!-- MINUS -->

					<form action="CartServlet" method="post">


						<input type="hidden" name="menuId" value="<%= item.getMenuId() %>">


						<input type="hidden" name="restaurantId"
							value="<%= restaurantId %>">


						<%

                            if (item.getQty() <= 1) {

                        %>


						<input type="hidden" name="action" value="delete">


						<%

                            } else {

                        %>


						<input type="hidden" name="action" value="update"> <input
							type="hidden" name="quantity" value="<%= item.getQty() - 1 %>">


						<%

                            }

                        %>


						<button class="qty-btn" type="submit">-</button>


					</form>



					<!-- CURRENT QUANTITY -->

					<span class="quantity"> <%= item.getQty() %>

					</span>



					<!-- PLUS -->

					<form action="CartServlet" method="post">


						<input type="hidden" name="menuId" value="<%= item.getMenuId() %>">


						<input type="hidden" name="restaurantId"
							value="<%= restaurantId %>"> <input type="hidden"
							name="action" value="update"> <input type="hidden"
							name="quantity" value="<%= item.getQty() + 1 %>">


						<button class="qty-btn" type="submit">+</button>


					</form>


				</div>



				<!-- ================= REMOVE ================= -->

				<form action="CartServlet" method="post">


					<input type="hidden" name="menuId" value="<%= item.getMenuId() %>">


					<input type="hidden" name="restaurantId"
						value="<%= restaurantId %>"> <input type="hidden"
						name="action" value="delete">


					<button class="remove-btn" type="submit">Remove</button>


				</form>


			</div>



			<%

                }

            %>



			<!-- ================= RESTAURANT TOTAL ================= -->

			<div class="cart-summary">


				<div class="total-text">Restaurant Total</div>


				<div class="total-price">

					₹<%= restaurantTotal %>

				</div>


			</div>



			<!-- ================= ADD MORE ITEMS ================= -->

			<div class="cart-actions">


				<a class="add-more-btn"
					href="MenuServlet?restaurantId=<%= restaurantId %>"> Add More
					Items </a>


			</div>


		</div>



		<%

                }

            }

        %>



		<!-- ================= ALL CARTS GRAND TOTAL ================= -->

		<%

            if (hasItems) {

        %>


		<div class="grand-total-box">


			<div class="grand-total">


				<h2>Grand Total</h2>


				<div class="grand-total-price">

					₹<%= grandTotal %>

				</div>


			</div>



			<div class="cart-actions">


				<a class="add-more-btn" href="Restaurant"> Continue Shopping </a> <a
					class="checkout-btn"
					href="${pageContext.request.contextPath}/Checkout.jsp"> Proceed
					to Checkout </a>

			</div>


		</div>


		<%

            } else {

        %>



		<!-- ================= EMPTY CART ================= -->

		<div class="empty-cart">


			<h2>Your cart is empty</h2>


			<p>Please add some food items from the menu.</p>


			<a class="checkout-btn" href="Restaurant"> Browse Restaurants </a>


		</div>


		<%

            }

        %>


	</div>


</body>

</html>
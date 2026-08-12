<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.Map"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.tap.model.Cart"%>
<%@ page import="com.tap.model.Cartitem"%>
<%@ page import="com.tap.model.user"%>

<%
    user loggedInUser =
            (user) session.getAttribute("user");

    if (loggedInUser == null) {
        response.sendRedirect("login.html");
        return;
    }
%>

<%
    @SuppressWarnings("unchecked")
    Map<Integer, Cart> carts =
            (Map<Integer, Cart>) session.getAttribute("carts");

    List<Cartitem> checkoutItems = new ArrayList<Cartitem>();
    double itemTotal = 0.0;

    if (carts != null && !carts.isEmpty()) {

        for (Map.Entry<Integer, Cart> entry : carts.entrySet()) {

            Cart cart = entry.getValue();

            if (cart == null ||
                cart.getItems() == null ||
                cart.getItems().isEmpty()) {

                continue;
            }

            for (Cartitem item : cart.getItems().values()) {

                checkoutItems.add(item);

                itemTotal += item.getTotalPrice();
            }
        }
    }

    double deliveryCharges = 30.0;
    double platformFee = 10.0;
    double gst = Math.round(itemTotal * 0.08 * 100.0) / 100.0;

    double grandTotal =
            itemTotal +
            deliveryCharges +
            platformFee +
            gst;

    session.setAttribute("grandTotal", grandTotal);
%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Checkout - FoodExpress</title>


<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: Arial, Helvetica, sans-serif;
}

body {
	background: #f7f7f8;
	color: #222;
}

/* ================= NAVBAR ================= */
.navbar {
	width: 100%;
	height: 70px;
	background: #ffffff;
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 0 70px;
	border-bottom: 1px solid #eeeeee;
}

.logo {
	font-size: 27px;
	font-weight: 700;
	color: #ff5200;
}

.logo span {
	color: #333333;
}

.nav-links {
	display: flex;
	align-items: center;
	gap: 28px;
}

.nav-links a {
	text-decoration: none;
	color: #333333;
	font-size: 15px;
	font-weight: 500;
}

.nav-links a:hover {
	color: #ff5200;
}

/* ================= PAGE ================= */
.checkout-container {
	width: 92%;
	max-width: 1180px;
	margin: 32px auto 55px;
}

.checkout-title {
	margin-bottom: 24px;
}

.checkout-title h1 {
	font-size: 30px;
	line-height: 1.2;
	color: #222222;
	margin-bottom: 7px;
}

.checkout-title p {
	color: #777777;
	font-size: 14px;
}

/* ================= MAIN TWO-COLUMN LAYOUT ================= */
.checkout-grid {
	display: grid;
	grid-template-columns: minmax(0, 1.55fr) minmax(340px, 0.85fr);
	gap: 24px;
	align-items: start;
}

.checkout-left {
	min-width: 0;
}

.summary-card {
	min-width: 0;
	position: sticky;
	top: 20px;
}

/* ================= COMMON CARD ================= */
.checkout-card {
	width: 100%;
	background: #ffffff;
	border: 1px solid #eeeeee;
	border-radius: 12px;
	padding: 24px;
	margin-bottom: 20px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.06);
}

/* ================= SECTION TITLE ================= */
.section-title, .summary-title {
	display: flex;
	align-items: center;
	gap: 10px;
	color: #222222;
	font-size: 19px;
	font-weight: 700;
	margin-bottom: 21px;
}

.section-number {
	width: 28px;
	height: 28px;
	min-width: 28px;
	border-radius: 50%;
	background: #ff5200;
	color: #ffffff;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 13px;
	font-weight: 700;
}

/* ================= DELIVERY FORM ================= */
.form-row {
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 18px;
}

.form-group {
	margin-bottom: 17px;
}

.form-group label {
	display: block;
	margin-bottom: 7px;
	color: #333333;
	font-size: 13px;
	font-weight: 600;
}

.required {
	color: #ff5200;
}

.form-group input, .form-group textarea {
	width: 100%;
	border: 1px solid #dddddd;
	border-radius: 7px;
	padding: 12px 13px;
	background: #ffffff;
	color: #222222;
	outline: none;
	font-size: 13px;
}

.form-group input {
	height: 43px;
}

.form-group textarea {
	height: 88px;
	resize: none;
}

.form-group input:focus, .form-group textarea:focus {
	border-color: #ff5200;
	box-shadow: 0 0 0 2px rgba(255, 82, 0, 0.08);
}

/* ================= PHONE ================= */
.phone-box {
	width: 100%;
	display: flex;
}

.country-code {
	height: 43px;
	display: flex;
	align-items: center;
	padding: 0 12px;
	background: #f5f5f5;
	border: 1px solid #dddddd;
	border-right: none;
	border-radius: 7px 0 0 7px;
	color: #555555;
	font-size: 13px;
}

.phone-box input {
	flex: 1;
	min-width: 0;
	border-radius: 0 7px 7px 0;
}

/* ================= SAVE ADDRESS ================= */
.save-title {
	margin: 3px 0 10px;
	font-size: 13px;
	font-weight: 600;
	color: #333333;
}

.address-options {
	display: flex;
	gap: 10px;
	flex-wrap: wrap;
}

.address-option input {
	display: none;
}

.address-option span {
	display: inline-flex;
	align-items: center;
	padding: 9px 17px;
	border: 1px solid #eeeeee;
	border-radius: 20px;
	background: #f4f4f6;
	color: #555555;
	font-size: 13px;
	cursor: pointer;
}

.address-option input:checked+span {
	background: #fff0e9;
	border-color: #ff5200;
	color: #ff5200;
	font-weight: 700;
}

/* ================= PAYMENT ================= */
.payment-grid {
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 13px;
}

.payment-option {
	min-width: 0;
}

.payment-option input {
	display: none;
}

.payment-box {
	min-height: 78px;
	width: 100%;
	padding: 14px;
	border: 1px solid #dddddd;
	border-radius: 8px;
	display: flex;
	align-items: center;
	gap: 12px;
	cursor: pointer;
	background: #ffffff;
}

.payment-option input:checked+.payment-box {
	border: 2px solid #ff5200;
	background: #fff7f3;
}

.payment-icon {
	width: 36px;
	height: 36px;
	min-width: 36px;
	border-radius: 7px;
	background: #fff0e9;
	color: #ff5200;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 17px;
}

.payment-name {
	display: block;
	font-size: 13px;
	font-weight: 700;
	color: #333333;
	margin-bottom: 4px;
}

.payment-description {
	display: block;
	font-size: 11px;
	line-height: 1.3;
	color: #777777;
}

/* ================= ORDER SUMMARY ================= */
.summary-title {
	margin-bottom: 15px;
}

.summary-item {
	display: flex;
	justify-content: space-between;
	align-items: flex-start;
	gap: 15px;
	padding: 14px 0;
	border-bottom: 1px solid #eeeeee;
}

.summary-item-left {
	display: flex;
	align-items: flex-start;
	gap: 10px;
	min-width: 0;
}

.item-dot {
	width: 10px;
	height: 10px;
	min-width: 10px;
	margin-top: 4px;
	border: 2px solid #159447;
	border-radius: 2px;
}

.item-name {
	color: #333333;
	font-size: 13px;
	font-weight: 600;
	line-height: 1.35;
}

.item-quantity {
	display: block;
	margin-top: 5px;
	color: #777777;
	font-size: 11px;
	font-weight: 500;
}

.item-price {
	color: #ff5200;
	font-size: 13px;
	font-weight: 700;
	white-space: nowrap;
}

.bill-title {
	margin: 20px 0 10px;
	font-size: 16px;
	font-weight: 700;
	color: #333333;
}

.bill-row {
	display: flex;
	justify-content: space-between;
	align-items: center;
	gap: 15px;
	padding: 6px 0;
	font-size: 13px;
}

.bill-row span:first-child {
	color: #666666;
}

.bill-row span:last-child {
	color: #333333;
	white-space: nowrap;
}

.bill-divider {
	border-top: 1px solid #dddddd;
	margin: 10px 0;
}

.grand-total {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-top: 12px;
}

.grand-total-label {
	font-size: 17px;
	font-weight: 700;
	color: #222222;
}

.grand-total-value {
	font-size: 21px;
	font-weight: 700;
	color: #ff5200;
}

/* ================= DELIVERY TIME ================= */
.delivery-box {
	margin-top: 17px;
	padding: 13px;
	border: 1px solid #eeeeee;
	border-radius: 9px;
	background: #f8f8fb;
	display: flex;
	align-items: center;
	gap: 11px;
}

.delivery-icon {
	width: 36px;
	height: 36px;
	min-width: 36px;
	border-radius: 50%;
	background: #fff0e9;
	color: #ff5200;
	display: flex;
	align-items: center;
	justify-content: center;
}

.delivery-title {
	display: block;
	font-size: 12px;
	font-weight: 700;
	color: #333333;
}

.delivery-text {
	display: block;
	margin-top: 3px;
	font-size: 10px;
	color: #777777;
}

/* ================= BUTTONS ================= */
.place-order-btn {
	width: 100%;
	height: 45px;
	margin-top: 17px;
	border: none;
	border-radius: 24px;
	background: #ff5200;
	color: #ffffff;
	font-size: 14px;
	font-weight: 700;
	cursor: pointer;
}

.place-order-btn:hover {
	background: #e64700;
}

.back-cart-btn {
	display: block;
	width: 100%;
	height: 42px;
	line-height: 40px;
	margin-top: 10px;
	border: 1px solid #ff5200;
	border-radius: 22px;
	color: #ff5200;
	text-align: center;
	text-decoration: none;
	font-size: 13px;
	font-weight: 700;
}

.back-cart-btn:hover {
	background: #fff3ed;
}

.secure-text {
	margin-top: 12px;
	color: #888888;
	font-size: 10px;
	line-height: 1.4;
	text-align: center;
}

/* ================= RESPONSIVE ================= */
@media ( max-width : 900px) {
	.checkout-grid {
		grid-template-columns: 1fr;
	}
	.summary-card {
		position: static;
	}
}

@media ( max-width : 650px) {
	.navbar {
		height: auto;
		min-height: 65px;
		padding: 14px 20px;
		flex-direction: column;
		gap: 12px;
	}
	.nav-links {
		gap: 15px;
	}
	.checkout-container {
		width: 94%;
		margin-top: 25px;
	}
	.form-row {
		grid-template-columns: 1fr;
		gap: 0;
	}
	.payment-grid {
		grid-template-columns: 1fr;
	}
	.checkout-card {
		padding: 18px;
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

			<a href="Restaurant"> Home </a> <a href="Restaurant"> Restaurants
			</a> <a href="Cart.jsp"> Cart </a> <a href="Login.jsp"> Profile </a>
			<a href="Register.jsp"> Sign Up </a> <a href="Login.jsp"> Sign In </a>

		</div>

	</div>


	<!-- ================= CHECKOUT ================= -->

	<div class="checkout-container">


		<!-- ================= TITLE ================= -->

		<div class="checkout-title">

			<h1>Checkout</h1>

			<p>Complete your delivery details and payment method</p>

		</div>


		<!-- =====================================================
             FORM START
             ===================================================== -->

		<form action="${pageContext.request.contextPath}/CheckoutServlet"
			method="post">


			<!-- ================= TWO COLUMNS ================= -->

			<div class="checkout-grid">


				<!-- =================================================
                     LEFT COLUMN
                ================================================== -->

				<div class="checkout-left">


					<!-- ================= DELIVERY INFORMATION ================= -->

					<div class="checkout-card">


						<div class="section-title">

							<div class="section-number">1</div>

							Delivery Information

						</div>


						<!-- NAME + PHONE -->

						<div class="form-row">


							<div class="form-group">

								<label for="name"> Full Name <span class="required">
										* </span>

								</label> <input type="text" id="name" name="name"
									value="<%= loggedInUser.getUserName() %>"
									placeholder="Enter your full name" required>

							</div>


							<div class="form-group">

								<label for="phone"> Phone Number <span class="required">
										* </span>

								</label>


								<div class="phone-box">

									<span class="country-code"> +91 </span>
									<input type="tel"
										id="phone" name="phone"
										value="<%= loggedInUser.getPhone() != null ? loggedInUser.getPhone() : "" %>"
										placeholder="Enter 10-digit phone number" maxlength="10"
										required>

								</div>

							</div>

						</div>


						<!-- EMAIL -->

						<div class="form-group">

							<label for="email"> Email Address </label>
							<input type="email"
								id="email" name="email"
								value="<%= loggedInUser.getEmail() != null ? loggedInUser.getEmail() : "" %>"
								placeholder="Enter your email address">

						</div>


						<!-- ADDRESS -->

						<div class="form-group">

							<label for="address"> Complete Address <span
								class="required"> * </span>

							</label>

							<textarea id="address" name="address"
								placeholder="House number, building name, street and area"
								required><%= loggedInUser.getAddress() != null ? loggedInUser.getAddress() : "" %></textarea>

						</div>


						<!-- CITY + PINCODE -->

						<div class="form-row">


							<div class="form-group">

								<label for="city"> City <span class="required"> *
								</span>

								</label>
								<input type="text" id="city" name="city"
									value="<%= loggedInUser.getCity() != null ? loggedInUser.getCity() : "" %>"
									placeholder="Enter city" required>

							</div>


							<div class="form-group">

								<label for="pincode"> Pincode <span class="required">
										* </span>

								</label>
								<input type="text" id="pincode" name="pincode"
									value="<%= loggedInUser.getPincode() != null ? loggedInUser.getPincode() : "" %>"
									placeholder="Enter 6-digit pincode" maxlength="6" required>

							</div>

						</div>


						<!-- SAVE ADDRESS -->

						<div class="save-title">Save Address As</div>


						<div class="address-options">


							<label class="address-option"> <input type="radio"
								name="addressType" value="Home" checked> <span>
									🏠 Home </span>

							</label> <label class="address-option"> <input type="radio"
								name="addressType" value="Work"> <span> 💼 Work </span>

							</label> <label class="address-option"> <input type="radio"
								name="addressType" value="Other"> <span> 📍 Other
							</span>

							</label>


						</div>


					</div>


					<!-- ================= PAYMENT METHOD ================= -->

					<div class="checkout-card">


						<div class="section-title">

							<div class="section-number">2</div>

							Payment Method

						</div>


						<div class="payment-grid">


							<!-- UPI -->

							<div class="payment-option">


								<input type="radio" id="upiPayment" name="paymentMode"
									value="UPI" required> <label for="upiPayment"
									class="payment-box"> <span class="payment-icon">
										📱 </span> <span> <span class="payment-name"> UPI
											Payment </span> <span class="payment-description"> Google
											Pay, PhonePe, Paytm </span>

								</span>


								</label>


							</div>


							<!-- CARD -->

							<div class="payment-option">


								<input type="radio" id="cardPayment" name="paymentMode"
									value="Credit Card"> <label for="cardPayment"
									class="payment-box"> <span class="payment-icon">
										💳 </span> <span> <span class="payment-name"> Card
											Payment </span> <span class="payment-description"> Credit or
											debit card </span>

								</span>


								</label>


							</div>


							<!-- CASH ON DELIVERY -->

							<div class="payment-option">


								<input type="radio" id="codPayment" name="paymentMode"
									value="Cash on Delivery"> <label for="codPayment"
									class="payment-box"> <span class="payment-icon">
										💵 </span> <span> <span class="payment-name"> Cash on
											Delivery </span> <span class="payment-description"> Pay when
											delivered </span>

								</span>


								</label>


							</div>


						</div>


					</div>


				</div>


				<!-- =================================================
                     RIGHT COLUMN - ORDER SUMMARY
                ================================================== -->

				<div class="summary-card">


					<div class="checkout-card">


						<div class="summary-title">

							<div class="section-number">3</div>

							Order Summary

						</div>


						<!-- ================= CART ITEMS ================= -->

						<%

                            for (Cartitem item : checkoutItems) {

                        %>


						<div class="summary-item">


							<div class="summary-item-left">


								<div class="item-dot"></div>


								<div class="item-name">

									<%= item.getName() %>


									<span class="item-quantity"> Quantity: <%= item.getQty() %>

									</span>

								</div>


							</div>


							<div class="item-price">

								₹<%= item.getTotalPrice() %>

							</div>


						</div>


						<%

                            }

                        %>


						<!-- ================= BILL DETAILS ================= -->

						<div class="bill-title">Bill Details</div>


						<div class="bill-row">

							<span> Item Total </span> <span> ₹<%= itemTotal %>
							</span>

						</div>


						<div class="bill-row">

							<span> Delivery Charges </span> <span> ₹<%= deliveryCharges %>
							</span>

						</div>


						<div class="bill-row">

							<span> Platform Fee </span> <span> ₹<%= platformFee %>
							</span>

						</div>


						<div class="bill-row">

							<span> GST and Restaurant Charges </span> <span> ₹<%= gst %>
							</span>

						</div>


						<div class="bill-divider"></div>


						<!-- GRAND TOTAL -->

						<div class="grand-total">


							<span class="grand-total-label"> Grand Total </span> <span
								class="grand-total-value"> ₹<%= grandTotal %>
							</span>


						</div>


						<!-- ESTIMATED DELIVERY -->

						<div class="delivery-box">


							<span class="delivery-icon"> 🚚 </span> <span> <span
								class="delivery-title"> Estimated Delivery Time </span> <span
								class="delivery-text"> Your order will arrive in 30–40
									minutes. </span>


							</span>


						</div>


						<!-- ================= PLACE ORDER ================= -->

						<button type="submit" class="place-order-btn">

							Place Order • ₹<%= grandTotal %>

						</button>


						<!-- ================= BACK TO CART ================= -->

						<a href="${pageContext.request.contextPath}/Cart.jsp"
							class="back-cart-btn"> Back to Cart </a>


						<!-- ================= SECURITY ================= -->

						<div class="secure-text">🔒 Your payment and personal
							information are protected and securely processed</div>


					</div>


				</div>


			</div>


		</form>

		<!-- =====================================================
             FORM END
             ===================================================== -->


	</div>


</body>

</html>
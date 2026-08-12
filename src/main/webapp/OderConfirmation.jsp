<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Order Confirmed - FoodExpress</title>


<style>

/* ================= GLOBAL ================= */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: Arial, Helvetica, sans-serif;
}

body {
	background: #f7f7f8;
	color: #222222;
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
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.04);
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
	transition: all 0.25s ease;
}

.nav-links a:hover {
	color: #ff5200;
}

/* ================= PAGE ================= */
.confirmation-container {
	width: 92%;
	max-width: 900px;
	margin: 40px auto 60px;
}

/* ================= SUCCESS CARD ================= */
.success-card {
	background: #ffffff;
	border: 1px solid #eeeeee;
	border-radius: 14px;
	padding: 38px 40px;
	text-align: center;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.07);
	transition: all 0.3s ease;
}

.success-card:hover {
	box-shadow: 0 10px 28px rgba(0, 0, 0, 0.10);
	transform: translateY(-2px);
}

/* ================= SUCCESS ICON ================= */
.success-icon {
	width: 75px;
	height: 75px;
	margin: 0 auto 20px;
	border-radius: 50%;
	background: #eaf8ef;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 38px;
	color: #159447;
	box-shadow: 0 5px 15px rgba(21, 148, 71, 0.12);
}

/* ================= TITLE ================= */
.success-title {
	font-size: 29px;
	font-weight: 700;
	color: #222222;
	margin-bottom: 8px;
}

.success-message {
	color: #777777;
	font-size: 14px;
	line-height: 1.5;
	margin-bottom: 25px;
}

/* ================= ORDER ID ================= */
.order-id-box {
	display: inline-flex;
	align-items: center;
	justify-content: center;
	gap: 8px;
	padding: 10px 20px;
	background: #fff3ed;
	border: 1px solid #ffd5c3;
	border-radius: 22px;
	color: #ff5200;
	font-size: 14px;
	font-weight: 700;
	margin-bottom: 30px;
}

/* ================= INFORMATION GRID ================= */
.confirmation-grid {
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 20px;
	text-align: left;
}

/* ================= INFORMATION CARD ================= */
.info-card {
	background: #ffffff;
	border: 1px solid #eeeeee;
	border-radius: 12px;
	padding: 22px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
	transition: all 0.25s ease;
}

.info-card:hover {
	transform: translateY(-3px);
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.09);
	border-color: #ffddd0;
}

.info-title {
	display: flex;
	align-items: center;
	gap: 10px;
	font-size: 17px;
	font-weight: 700;
	color: #222222;
	margin-bottom: 15px;
}

.info-icon {
	width: 32px;
	height: 32px;
	min-width: 32px;
	border-radius: 50%;
	background: #fff0e9;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 15px;
}

.info-row {
	display: flex;
	justify-content: space-between;
	align-items: center;
	gap: 15px;
	padding: 8px 0;
	border-bottom: 1px solid #f0f0f0;
	font-size: 13px;
}

.info-row:last-child {
	border-bottom: none;
}

.info-label {
	color: #777777;
}

.info-value {
	color: #333333;
	font-weight: 600;
	text-align: right;
}

/* ================= DELIVERY ADDRESS ================= */
.address-box {
	background: #f8f8fb;
	border: 1px solid #eeeeee;
	border-radius: 9px;
	padding: 14px;
	color: #555555;
	font-size: 13px;
	line-height: 1.5;
}

/* ================= DELIVERY TIME ================= */
.delivery-box {
	margin-top: 20px;
	padding: 15px;
	border: 1px solid #eeeeee;
	border-radius: 9px;
	background: #f8f8fb;
	display: flex;
	align-items: center;
	gap: 12px;
	text-align: left;
	transition: all 0.25s ease;
}

.delivery-box:hover {
	background: #fff7f3;
	border-color: #ffd5c3;
	transform: translateY(-2px);
	box-shadow: 0 5px 14px rgba(255, 82, 0, 0.08);
}

.delivery-icon {
	width: 40px;
	height: 40px;
	min-width: 40px;
	border-radius: 50%;
	background: #fff0e9;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 18px;
}

.delivery-title {
	display: block;
	font-size: 13px;
	font-weight: 700;
	color: #333333;
}

.delivery-text {
	display: block;
	margin-top: 4px;
	font-size: 11px;
	color: #777777;
}

/* ================= ORDER STATUS ================= */
.status-box {
	margin-top: 20px;
	padding: 16px;
	background: #eaf8ef;
	border: 1px solid #c8ead5;
	border-radius: 10px;
	display: flex;
	align-items: center;
	gap: 12px;
	text-align: left;
}

.status-icon {
	width: 38px;
	height: 38px;
	min-width: 38px;
	border-radius: 50%;
	background: #159447;
	color: #ffffff;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 17px;
}

.status-title {
	display: block;
	font-size: 13px;
	font-weight: 700;
	color: #176b38;
}

.status-text {
	display: block;
	margin-top: 3px;
	font-size: 11px;
	color: #4d765b;
}

/* ================= BUTTONS ================= */
.confirmation-actions {
	display: flex;
	justify-content: center;
	gap: 15px;
	margin-top: 30px;
}

.home-btn, .orders-btn {
	display: inline-flex;
	align-items: center;
	justify-content: center;
	min-width: 180px;
	height: 45px;
	padding: 0 22px;
	border-radius: 24px;
	text-decoration: none;
	font-size: 14px;
	font-weight: 700;
	transition: all 0.25s ease;
	cursor: pointer;
}

/* ================= HOME BUTTON ================= */
.home-btn {
	background: #ff5200;
	color: #ffffff;
	border: 1px solid #ff5200;
	box-shadow: 0 4px 10px rgba(255, 82, 0, 0.20);
}

.home-btn:hover {
	background: #e64700;
	transform: translateY(-3px);
	box-shadow: 0 9px 20px rgba(255, 82, 0, 0.30);
}

/* ================= ORDERS BUTTON ================= */
.orders-btn {
	background: #ffffff;
	color: #ff5200;
	border: 1px solid #ff5200;
}

.orders-btn:hover {
	background: #fff3ed;
	transform: translateY(-3px);
	box-shadow: 0 8px 18px rgba(255, 82, 0, 0.15);
}

/* ================= SECURITY ================= */
.secure-text {
	margin-top: 22px;
	color: #888888;
	font-size: 10px;
	line-height: 1.4;
	text-align: center;
}

/* ================= RESPONSIVE ================= */
@media ( max-width : 700px) {
	.navbar {
		height: auto;
		min-height: 65px;
		padding: 14px 20px;
		flex-direction: column;
		gap: 12px;
	}
	.nav-links {
		gap: 15px;
		flex-wrap: wrap;
		justify-content: center;
	}
	.confirmation-container {
		width: 94%;
		margin-top: 25px;
	}
	.success-card {
		padding: 28px 18px;
	}
	.confirmation-grid {
		grid-template-columns: 1fr;
	}
	.confirmation-actions {
		flex-direction: column;
	}
	.home-btn, .orders-btn {
		width: 100%;
	}
}

@media ( max-width : 450px) {
	.success-title {
		font-size: 24px;
	}
	.success-message {
		font-size: 13px;
	}
	.info-card {
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

			<a href="${pageContext.request.contextPath}/Restaurant"> Home </a> <a
				href="${pageContext.request.contextPath}/Restaurant">
				Restaurants </a> <a href="${pageContext.request.contextPath}/Cart.jsp">
				Cart </a> <a href="${pageContext.request.contextPath}/login.html">
				Profile </a>

		</div>

	</div>


	<!-- ================= ORDER CONFIRMATION ================= -->

	<div class="confirmation-container">


		<div class="success-card">


			<!-- ================= SUCCESS ICON ================= -->

			<div class="success-icon">✓</div>


			<!-- ================= SUCCESS MESSAGE ================= -->

			<h1 class="success-title">Order Confirmed!</h1>


			<p class="success-message">Thank you for ordering with
				FoodExpress. Your order has been placed successfully.</p>


			<!-- ================= ORDER ID ================= -->

			<div class="order-id-box">🧾 Order ID: #<%= session.getAttribute("lastOrderId") != null ? session.getAttribute("lastOrderId") : "N/A" %></div>


			<!-- ================= INFORMATION ================= -->

			<div class="confirmation-grid">


				<!-- ================= DELIVERY INFORMATION ================= -->

				<div class="info-card">

					<div class="info-title">

						<span class="info-icon"> 📍 </span> Delivery Information

					</div>


					<div class="info-row">

						<span class="info-label"> Name </span> <span class="info-value">
							<%= session.getAttribute("lastOrderName") != null ? session.getAttribute("lastOrderName") : "" %> </span>

					</div>


					<div class="info-row">

						<span class="info-label"> Phone </span> <span class="info-value">
							<%= session.getAttribute("lastOrderPhone") != null ? session.getAttribute("lastOrderPhone") : "" %> </span>

					</div>


					<div class="info-row">

						<span class="info-label"> Address </span> <span class="info-value">
							<%= session.getAttribute("lastOrderAddress") != null ? session.getAttribute("lastOrderAddress") : "" %>, <%= session.getAttribute("lastOrderCity") != null ? session.getAttribute("lastOrderCity") : "" %> - <%= session.getAttribute("lastOrderPincode") != null ? session.getAttribute("lastOrderPincode") : "" %> (<%= session.getAttribute("lastOrderAddressType") != null ? session.getAttribute("lastOrderAddressType") : "Home" %>) </span>

					</div>


					<div class="address-box">Your delivery address will be used
						to deliver your order safely.</div>

				</div>


				<!-- ================= PAYMENT INFORMATION ================= -->

				<div class="info-card">

					<div class="info-title">

						<span class="info-icon"> 💳 </span> Payment Information

					</div>


					<div class="info-row">

						<span class="info-label"> Payment Method </span> <span
							class="info-value"> <%= session.getAttribute("lastOrderPaymentMode") != null ? session.getAttribute("lastOrderPaymentMode") : "N/A" %> </span>

					</div>


					<div class="info-row">

						<span class="info-label"> Item Total </span> <span
							class="info-value"> ₹<%= session.getAttribute("lastOrderItemTotal") != null ? session.getAttribute("lastOrderItemTotal") : "0.00" %> </span>

					</div>


					<div class="info-row">

						<span class="info-label"> Delivery Charges </span> <span
							class="info-value"> ₹<%= session.getAttribute("lastOrderDeliveryCharges") != null ? session.getAttribute("lastOrderDeliveryCharges") : "0.00" %> </span>

					</div>


					<div class="info-row">

						<span class="info-label"> Platform Fee </span> <span
							class="info-value"> ₹<%= session.getAttribute("lastOrderPlatformFee") != null ? session.getAttribute("lastOrderPlatformFee") : "0.00" %> </span>

					</div>


					<div class="info-row">

						<span class="info-label"> GST and Restaurant Charges </span> <span
							class="info-value"> ₹<%= session.getAttribute("lastOrderGst") != null ? session.getAttribute("lastOrderGst") : "0.00" %> </span>

					</div>


					<div class="info-row">

						<span class="info-label"> Grand Total </span> <span
							class="info-value" style="color: #ff5200; font-size: 16px;">

							₹<%= session.getAttribute("lastOrderGrandTotal") != null ? session.getAttribute("lastOrderGrandTotal") : "0.00" %> </span>

					</div>

				</div>


			</div>


			<!-- ================= ORDER STATUS ================= -->

			<div class="status-box">

				<div class="status-icon">✓</div>


				<div>

					<span class="status-title"> Order Placed Successfully </span> <span
						class="status-text"> Your restaurant has received your
						order and will start preparing it shortly. </span>

				</div>

			</div>


			<!-- ================= DELIVERY TIME ================= -->

			<div class="delivery-box">

				<div class="delivery-icon">🚚</div>


				<div>

					<span class="delivery-title"> Estimated Delivery Time </span> <span
						class="delivery-text"> Your order will arrive in 30–40
						minutes. </span>

				</div>

			</div>


			<!-- ================= ACTION BUTTONS ================= -->

			<div class="confirmation-actions">


				<a href="Restaurant" class="home-btn"> Continue Shopping </a> <a
					href="#" class="orders-btn"> View My Orders </a>


			</div>


			<!-- ================= SECURITY ================= -->

			<div class="secure-text">🔒 Your payment and personal
				information are protected and securely processed.</div>


		</div>


	</div>


</body>

</html>
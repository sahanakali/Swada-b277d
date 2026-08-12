<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List,com.tap.model.Restaurant"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Restaurant Home</title>

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: Arial, sans-serif;
}

body {
	background: #f7f7f7;
	color: #222;
}

header {
	position: sticky;
	top: 0;
	background: linear-gradient(90deg, #ff6b35, #ff914d);
	padding: 15px 40px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	box-shadow: 0 4px 12px rgba(0, 0, 0, .2);
	z-index: 1000;
}

.logo {
	font-size: 28px;
	font-weight: bold;
	color: white;
}

nav a {
	color: white;
	text-decoration: none;
	margin: 0 15px;
	font-weight: bold;
}

nav a:hover {
	border-bottom: 2px solid white;
}

.hero {
	padding: 40px 20px;
	text-align: center;
	background: linear-gradient(#fff7ef, #fff);
}

.hero h1 {
	color: #ff6b35;
	font-size: 42px;
}

.hero p {
	color: #666;
	margin: 10px 0 20px;
}

.search {
	width: 70%;
	margin: auto;
}

.search input {
	width: 100%;
	padding: 16px;
	border: none;
	border-radius: 30px;
	box-shadow: 0 3px 10px rgba(0, 0, 0, .15);
	font-size: 16px;
}

.categories {
	display: flex;
	justify-content: center;
	flex-wrap: wrap;
	gap: 12px;
	margin-top: 25px;
}

.categories span {
	background: white;
	padding: 10px 18px;
	border-radius: 30px;
	box-shadow: 0 2px 8px rgba(0, 0, 0, .15);
}

.banner {
	width: 90%;
	margin: 30px auto;
	background: linear-gradient(90deg, #ff6b35, #ff914d);
	color: white;
	text-align: center;
	padding: 20px;
	border-radius: 15px;
	font-size: 24px;
	font-weight: bold;
}

.grid {
	width: 92%;
	margin: auto;
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
	gap: 25px;
	margin-bottom: 40px;
}

.card {
	background: white;
	border-radius: 18px;
	overflow: hidden;
	box-shadow: 0 5px 18px rgba(0, 0, 0, .18);
	transition: .3s;
}

.card:hover {
	transform: translateY(-8px);
	box-shadow: 0 15px 30px rgba(0, 0, 0, .25);
}

.img {
	position: relative;
	overflow: hidden;
	background: #eee;
	height: 220px;
}

.img img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	transition: .4s;
	display: block;
}

.card:hover img {
	transform: scale(1.1);
}

.offer {
	position: absolute;
	bottom: 10px;
	left: 10px;
	background: #ff3b30;
	color: white;
	padding: 6px 12px;
	border-radius: 8px;
	font-size: 13px;
	font-weight: bold;
}

.fav {
	position: absolute;
	top: 12px;
	right: 12px;
	background: white;
	padding: 8px;
	border-radius: 50%;
}

.info {
	padding: 18px;
}

.info h2 {
	margin-bottom: 12px;
}

.row {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 12px;
}

.rating {
	background: #16a34a;
	color: white;
	padding: 5px 10px;
	border-radius: 8px;
	font-weight: bold;
}

.small {
	color: #666;
	margin-top: 5px;
}

.btn {
	width: 100%;
	margin-top: 15px;
	padding: 12px;
	border: none;
	background: #ff6b35;
	color: white;
	border-radius: 8px;
	cursor: pointer;
	font-size: 16px;
	transition: .3s;
}

.btn:hover {
	background: #e45720;
}

footer {
	text-align: center;
	padding: 20px;
	background: #222;
	color: white;
}
</style>

</head>

<body>

	<header class="navbar">

		<div class="logo">
			🍽 Food<span>Express</span>
		</div>

		<nav class="nav-links">

			<a href="${pageContext.request.contextPath}/Restaurant"> Home </a> <a
				href="${pageContext.request.contextPath}/Restaurant">
				Restaurants </a> <a href="${pageContext.request.contextPath}/Cart.jsp">
				Cart </a> <a href="${pageContext.request.contextPath}/Login.jsp">
				Profile </a> <a href="${pageContext.request.contextPath}/Register.jsp">
				Sign Up </a> <a href="${pageContext.request.contextPath}/Login.jsp">
				Sign In </a>

		</nav>

	</header>

	<section class="hero">

		<h1>Delicious Food Delivered Fast</h1>

		<p>Order from your favourite restaurants.</p>

		<div class="search">

			<input type="text" placeholder="Search Restaurants..."
				aria-label="Search Restaurants">

		</div>

		<div class="categories">

			<span>🍕 Pizza</span> <span>🍔 Burger</span> <span>🍗 Biryani</span>

			<span>☕ Cafe</span> <span>🥘 South Indian</span> <span>🍜
				Chinese</span>

		</div>

	</section>

	<div class="banner">🔥 50% OFF on First Order • FREE DELIVERY
		Above ₹199</div>

	<%
	@SuppressWarnings("unchecked")
	List<Restaurant> allRestaurants = (List<Restaurant>) request.getAttribute("allRestaurants");
	%>

	<div class="grid">

		<%
		if (allRestaurants != null && !allRestaurants.isEmpty()) {

			for (Restaurant restaurant : allRestaurants) {
		%>

		<div class="card">

			<div class="img">

				<img src="<%=restaurant.getImagepath()%>"
					alt="<%=restaurant.getName()%>"
					onerror="this.onerror=null; this.src='https://placehold.co/400x300/ff6b35/ffffff?text=Restaurant';">

				<div class="fav">❤</div>

				<div class="offer">50% OFF</div>

			</div>

			<div class="info">

				<h2>
					<%=restaurant.getName()%>
				</h2>

				<div class="row">

					<span class="rating"> ⭐ <%=restaurant.getRating()%>
					</span> <span> <%=restaurant.getDeliveryTime()%> mins
					</span>

				</div>

				<p class="small">
					🍽
					<%=restaurant.getCusineType()%>
				</p>

				<p class="small">
					📍
					<%=restaurant.getAddress()%>
				</p>

				<form action="MenuServlet" method="get">

					<input type="hidden" name="restaurantId"
						value="<%=restaurant.getResturantID()%>">

					<button type="submit" class="btn">View Menu</button>

				</form>

			</div>

		</div>

		<%
		}

		} else {
		%>

		<div style="width: 100%; text-align: center; padding: 60px;">

			<h2>No Restaurants Available</h2>

			<p>Please add restaurants to the database.</p>

		</div>

		<%
		}
		%>
	</div>

	<footer>

		<p>© 2026 FoodExpress | All Rights Reserved</p>

	</footer>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.tap.model.Restaurant"%>
<%@ page import="com.tap.model.menu"%>

<%
Restaurant restaurant = (Restaurant) request.getAttribute("restaurant");

@SuppressWarnings("unchecked")
List<menu> menuList = (List<menu>) request.getAttribute("menuList");
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title><%=restaurant != null ? restaurant.getName() : "Restaurant Menu"%></title>

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif;
}

body {
	background: #f8f8f8;
}

/**************** HEADER ****************/
.header {
	width: 100%;
	background: white;
	box-shadow: 0 2px 10px rgba(0, 0, 0, .08);
	padding: 25px 60px;
}

.restaurant {
	display: flex;
	gap: 30px;
	align-items: center;
}

.restaurant img {
	width: 220px;
	height: 170px;
	object-fit: cover;
	border-radius: 18px;
	box-shadow: 0 4px 15px rgba(0, 0, 0, .15);
}

.info {
	flex: 1;
}

.info h1 {
	font-size: 38px;
	color: #282c3f;
	margin-bottom: 15px;
}

.tag {
	display: inline-block;
	background: #fff3e5;
	color: #fc8019;
	padding: 8px 18px;
	border-radius: 30px;
	font-weight: 600;
	margin-bottom: 15px;
}

.details {
	display: flex;
	gap: 40px;
	flex-wrap: wrap;
	margin-top: 10px;
}

.detail-box {
	background: #fafafa;
	border-radius: 12px;
	padding: 15px 20px;
	min-width: 150px;
	box-shadow: 0 2px 8px rgba(0, 0, 0, .05);
}

.detail-box h4 {
	color: #777;
	margin-bottom: 5px;
}

.detail-box p {
	font-weight: bold;
	color: #333;
}

/**************** SEARCH ****************/
.search {
	width: 90%;
	margin: 30px auto;
}

.search input {
	width: 100%;
	padding: 18px 20px;
	border: none;
	border-radius: 40px;
	font-size: 17px;
	outline: none;
	box-shadow: 0 2px 12px rgba(0, 0, 0, .08);
}

/**************** FILTER ****************/
.filters {
	display: flex;
	gap: 15px;
	margin-top: 20px;
	flex-wrap: wrap;
	align-items: center;
}

.filters button {
	padding: 12px 22px;
	border: none;
	border-radius: 30px;
	background: white;
	box-shadow: 0 4px 15px rgba(0, 0, 0, .12);
	cursor: pointer;
	font-weight: 600;
	transition: .3s;
}

.filters button:hover {
	background: #ff7a00;
	color: white;
}

.filters button.active {
	background: #fc8019;
	color: white;
}

/**************** MENU ****************/
.container {
	width: 90%;
	margin: auto;
}

.menu-grid {
	display: flex;
	flex-direction: column;
	gap: 25px;
}

.card {
	background: white;
	border-radius: 18px;
	padding: 20px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	box-shadow: 0 5px 20px rgba(0, 0, 0, .08);
	transition: .3s;
}

.card:hover {
	transform: translateY(-4px);
}

.card-content {
	width: 70%;
}

.card-image {
	width: 220px;
	position: relative;
	text-align: center;
}

.card-image img {
	width: 200px;
	height: 170px;
	object-fit: cover;
	border-radius: 18px;
}

.badge {
	display: inline-block;
	color: #1ba672;
	border: 2px solid #1ba672;
	padding: 4px 10px;
	border-radius: 6px;
	margin-bottom: 10px;
	font-size: 13px;
}

.title {
	font-size: 28px;
	font-weight: bold;
	color: #282c3f;
	margin-bottom: 12px;
}

.price {
	font-size: 24px;
	font-weight: bold;
	margin-bottom: 10px;
}

.rating {
	color: #1ba672;
	font-weight: bold;
	margin-bottom: 12px;
}

.desc {
	color: #666;
	line-height: 1.6;
	margin-bottom: 15px;
}

.available {
	color: #666;
}

.add-btn {
	position: absolute;
	bottom: -12px;
	left: 50%;
	transform: translateX(-50%);
	width: 130px;
	background: white;
	color: #1ba672;
	border: 1px solid #ddd;
	padding: 12px;
	border-radius: 12px;
	cursor: pointer;
	font-weight: bold;
	box-shadow: 0 2px 10px rgba(0, 0, 0, .2);
	transition: .3s;
}

.add-btn:hover {
	background: #1ba672;
	color: white;
}

.back-restaurants {
	display: inline-block;
	margin: 15px 0 25px;
	color: #555;
	text-decoration: none;
	font-size: 15px;
	font-weight: 600;
	transition: color 0.2s ease;
}

.back-restaurants:hover {
	color: #ff5200;
}

@media ( max-width :900px) {
	.restaurant {
		flex-direction: column;
	}
	.card {
		flex-direction: column;
	}
	.card-content {
		width: 100%;
	}
	.card-image {
		margin-top: 20px;
	}
}
/* ================= NAVBAR STYLES ================= */
.navbar {
	background-color: #ffffff;
	height: 70px;
	padding: 0 60px;
	display: flex;
	align-items: center;
	justify-content: space-between;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
	margin-bottom: 20px;
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
	transition: color 0.2s ease;
}

.nav-links a:hover {
	color: #ff5200;
}
</style>

</head>

<body>

	<header class="navbar">

    <div class="logo">
        🍽 Food<span>Express</span>
    </div>

    <nav class="nav-links">

        <a href="${pageContext.request.contextPath}/Restaurant">
            Home
        </a>

        <a href="${pageContext.request.contextPath}/Restaurant">
            Restaurants
        </a>

        <a href="${pageContext.request.contextPath}/Cart.jsp">
            Cart
        </a>

        <a href="${pageContext.request.contextPath}/login.html">
            Profile
        </a>

        <a href="${pageContext.request.contextPath}/register.html">
            Sign Up
        </a>

        <a href="${pageContext.request.contextPath}/login.html">
            Sign In
        </a>

    </nav>

</header>


<!-- YOUR EXISTING MENU CODE STARTS HERE -->

	<div class="header">

		<%
		if (restaurant != null) {
		%>

		<div class="restaurant">

			<%
			String restImg = restaurant.getImagepath();
			String restImgSrc = (restImg != null && restImg.startsWith("http"))
					? restImg
					: request.getContextPath() + "/" + restImg;
			%>
			<img src="<%=restImgSrc%>" alt="<%=restaurant.getName()%>"
				onerror="this.onerror=null; this.src='https://placehold.co/600x400/ff6b35/ffffff?text=Restaurant';">

			<div class="info">

				<h1><%=restaurant.getName()%></h1>

				<div class="tag"><%=restaurant.getCusineType()%></div>

				<div class="details">

					<div class="detail-box">
						<h4>⭐ Rating</h4>
						<p><%=restaurant.getRating()%></p>
					</div>

					<div class="detail-box">
						<h4>🕒 Delivery</h4>
						<p><%=restaurant.getDeliveryTime()%>
							mins
						</p>
					</div>

					<div class="detail-box">
						<h4>📍 Address</h4>
						<p><%=restaurant.getAddress()%></p>
					</div>

				</div>

			</div>

		</div>

		<%
		}
		%>

	</div>

	<div class="search">

		<input type="text" placeholder="Search your favourite dishes..."
			id="searchBox">
		<%
		boolean hasVeg = false;
		boolean hasNonVeg = false;
		boolean hasDessert = false;
		boolean hasBeverage = false;

		if (menuList != null) {

			for (menu item : menuList) {

				String type = item.getCategory();

				if (type != null && type.toLowerCase().contains("non"))
					hasNonVeg = true;
				else if (type != null && (type.equalsIgnoreCase("Dessert") || type.equalsIgnoreCase("Sweet")))
					hasDessert = true;
				else if (type != null && (type.equalsIgnoreCase("Beverage") || type.equalsIgnoreCase("Drink") || type.equalsIgnoreCase("Coffee")))
					hasBeverage = true;
				else
					hasVeg = true;

				if (hasVeg && hasNonVeg && hasDessert && hasBeverage) {
					break;
				}
			}
		}
		%>
		<div class="filters">

			<button onclick="filterMenu('All', this)" class="active">All</button>

			<button onclick="filterMenu('Veg', this)">🟢 Veg</button>

			<button onclick="filterMenu('Non-Veg', this)">🔴 Non-Veg</button>

			<button onclick="filterMenu('Dessert', this)">🍰 Dessert</button>

			<button onclick="filterMenu('Beverage', this)">🥤 Beverage</button>

		</div>
	</div>

	<div class="container">

		<a href="${pageContext.request.contextPath}/Restaurant"
			class="back-restaurants"> ← Back to Restaurants </a>

		<div class="menu-grid">

			<%
			if (menuList != null && !menuList.isEmpty()) {

				for (menu m : menuList) {

					String category = m.getCategory() != null ? m.getCategory() : "";
					String name = m.getItemName() != null ? m.getItemName() : "";
					String combo = (category + " " + name).toLowerCase();
					
					String type = "Veg";
					if (combo.contains("chicken") || combo.contains("mutton") || combo.contains("egg") || combo.contains("fish") || combo.contains("prawn") || combo.contains("non-veg") || combo.contains("non veg") || combo.contains("kabab") || combo.contains("kebab") || combo.contains("wings") || combo.contains("bbq") || combo.contains("shawarma") || combo.contains("rogan")) {
						type = "Non-Veg";
					} else if (combo.contains("dessert") || combo.contains("sweet") || combo.contains("cake") || combo.contains("brownie") || combo.contains("ice cream") || combo.contains("jamun") || combo.contains("meetha") || combo.contains("tiramisu") || combo.contains("sundae") || combo.contains("falooda")) {
						type = "Dessert";
					} else if (combo.contains("beverage") || combo.contains("drink") || combo.contains("coffee") || combo.contains("soda") || combo.contains("shake") || combo.contains("pepsi") || combo.contains("coca") || combo.contains("lime")) {
						type = "Beverage";
					}
				
			%>

			<div class="card" data-type="<%=type%>">

				<!-- Left Section -->

				<div class="card-content">

					<%
					if ("Veg".equalsIgnoreCase(type)) {
					%>

					<div class="badge">🟢 Veg</div>

					<%
					} else if ("Non-Veg".equalsIgnoreCase(type)) {
					%>

					<div class="badge" style="color: #e53935; border-color: #e53935;">
						🔴 Non-Veg</div>

					<%
					} else if ("Dessert".equalsIgnoreCase(type)) {
					%>

					<div class="badge" style="color: #ff9800; border-color: #ff9800;">
						🍰 Dessert</div>

					<%
					} else if ("Beverage".equalsIgnoreCase(type)) {
					%>

					<div class="badge" style="color: #2196f3; border-color: #2196f3;">
						🥤 Beverage</div>

					<%
					}
					%>

					<div class="title">

						<%=m.getItemName()%>

					</div>

					<div class="price">

						₹
						<%=m.getPrice()%>

					</div>

					<div class="rating">

						⭐
						<%=m.getRating()%>

					</div>

					<div class="desc">

						<%=m.getDescription()%>

					</div>

					<div class="available">

						<%
						if (m.isAvailable()) {
						%>

						<span style="color: #1ba672; font-weight: bold;"> ●
							Available </span>

						<%
						} else {
						%>

						<span style="color: red; font-weight: bold;"> ● Not
							Available </span>

						<%
						}
						%>

					</div>

				</div>

				<!-- Right Section -->

				<div class="card-image">

					<%
					String img = m.getImagePath();
					String imgSrc = "";

					if (img == null || img.trim().isEmpty()) {
						imgSrc = request.getContextPath() + "/images/no-image.png";
					} else if (img.startsWith("http")) {
						imgSrc = img;
					} else {
						imgSrc = request.getContextPath() + "/" + img;
					}
					%>

					<img src="<%=imgSrc%>" alt="<%=m.getItemName()%>"
						onerror="this.onerror=null; this.src='https://placehold.co/400x300/eeeeee/333333?text=Dish';">

					<form action="CartServlet" method="post">

						<input type="hidden" name="menuId" value="<%=m.getMenuId()%>">

						<input type="hidden" name="restaurantId"
							value="<%=restaurant.getResturantID()%>"> <input
							type="hidden" name="qty" value="1"> <input type="hidden"
							name="action" value="add">

						<button type="submit" class="add-btn">ADD</button>

					</form>

				</div>

			</div>

			<%
			}
			} else {
			%>

			<div style="text-align: center; padding: 80px;">

				<img src="https://cdn-icons-png.flaticon.com/512/6134/6134065.png"
					width="180" alt="No Items">

				<h2 style="margin-top: 20px; color: #444;">No Menu Items
					Available</h2>

			</div>

			<%
}
%>

		</div>

	</div>

	<script>

let currentFilter = "All";

const searchBox = document.getElementById("searchBox");

searchBox.addEventListener("keyup", applyFilters);

function filterMenu(type, btnElement){

    currentFilter = type;

    document.querySelectorAll(".filters button").forEach(btn=>{

        btn.classList.remove("active");

    });

    if(btnElement) {
        btnElement.classList.add("active");
    }

    applyFilters();

}

function applyFilters(){

    const search = searchBox.value.toLowerCase();

    document.querySelectorAll(".card").forEach(card=>{

        const name = card.querySelector(".title")
                         .innerText
                         .toLowerCase();

        const type = card.dataset.type;

        const searchMatch = name.includes(search);

        const filterMatch =
            currentFilter==="All"
            ||
            type===currentFilter;

        if(searchMatch && filterMatch){

            card.style.display="flex";

        }else{

            card.style.display="none";

        }

    });

}

</script>
</body>


</html>
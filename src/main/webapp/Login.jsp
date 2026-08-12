<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login - FoodExpress</title>

<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Arial, Helvetica, sans-serif;
}

body {
    background: #f5f5f5;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

.container {
    width: 380px;
    background: #fff;
    padding: 35px;
    border-radius: 10px;
    box-shadow: 0 5px 15px rgba(0,0,0,0.2);
}

h2 {
    text-align: center;
    color: #ff5722;
    margin-bottom: 25px;
}

.form-group {
    margin-bottom: 18px;
}

label {
    display: block;
    margin-bottom: 6px;
    font-weight: bold;
}

input {
    width: 100%;
    padding: 12px;
    border: 1px solid #ccc;
    border-radius: 5px;
    outline: none;
    font-size: 15px;
}

input:focus {
    border-color: #ff5722;
}

button {
    width: 100%;
    padding: 12px;
    background: #ff5722;
    color: white;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
}

button:hover {
    background: #e64a19;
}

.register {
    text-align: center;
    margin-top: 18px;
}

.register a {
    text-decoration: none;
    color: #ff5722;
    font-weight: bold;
}

.register a:hover {
    text-decoration: underline;
}
</style>

</head>
<body>

<div class="container">

    <h2>User Login</h2>

    <form action="${pageContext.request.contextPath}/login" method="post">

        <div class="form-group">
            <label>User Name</label>
            <input type="text" name="name" placeholder="Enter your username" required>
        </div>

        <div class="form-group">
            <label>Password</label>
            <input type="password" name="password" placeholder="Enter your password" required>
        </div>

        <button type="submit">Login</button>

        <div class="register">
            Don't have an account?
            <a href="${pageContext.request.contextPath}/Register.jsp">Register</a>
        </div>

    </form>

</div>

</body>
</html>

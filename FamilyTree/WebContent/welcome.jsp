<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>My Family Tree</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700|Archivo+Narrow:400,700"
	rel="stylesheet" type="text/css">
<link href="default.css" rel="stylesheet" type="text/css" media="all" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

</head>
<body>
<div>
	<div id="header-wrapper">
		<div id="header" class="container">
			<div id="logo">
				<h1 align="left">
					<a href="/FamilyTree/welcome.jsp"> <img id="logoPic"
						src="images/logo.png">
					</a>
				</h1>
			</div>
			<div id="menu">
				<div align="left">
					<form method="GET" action="AccountController" name="loginForm"
						class="login">
						<p>
							<label for="login">Email:</label> <input type="email"
								name="username" id="login" value="">
						</p>

						<p>
							<label for="password">Password:</label> <input type="password"
								name="password" id="password" value="">
						</p>

						<p class="login-submit">
							<button type="submit" name="login" class="login-button">Login</button>
						</p>
						<div id="message">${message}</div>

						<p class="forgot-password">
							<a href="/FamilyTree/passwordReset.jsp">Forgot your password?</a>
						</p>
					</form>
				</div>
			</div>
		</div>
	</div>

	<div id="banner-wrapper">
		<div id="registerText" class="container">
			<p>
				Don't have an account? <a href="/FamilyTree/registration.jsp">Sign
					up now!</a>.
			</p>
		</div>

		<div id="banner" class="container">
			<img src="images/familytree.png" />
			<p>
				Keep in touch with your <strong>Family Ancestry</strong>.
			</p>
		</div>
	</div>


	<div id="copyright" class="container">
		<p>
			Copyright (c) 2013 <a href="http://www.familytree.com">FamilyTree.com</a>.
			All rights reserved.
		</p>
	</div>
</div>
</body>
</html>
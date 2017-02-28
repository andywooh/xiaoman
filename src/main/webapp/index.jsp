<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>

<head>
	<title>小满</title>
	<link rel="stylesheet" type="text/css" href="/static/css/login.css"/>
	<!-- <link rel='stylesheet' href='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css'> -->
</head>

<div id="login-modal">
	<div class="modal-dialog">
		<div class="loginmodal-container">
			<h1>XX 系  统  登  录</h1><br>
			<form action="login" method="post">
				<input type="text" name="userName" placeholder="用户名">
				<input type="password" name="passWord" placeholder="密码">
				<input type="submit" class="login loginmodal-submit" value="登录">
	        </form>
			<div class="login-help">
				<a href="#">Register</a> - <a href="#">Forgot Password</a>
			</div>
		</div>
	</div>
</div>

</html>
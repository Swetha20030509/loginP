<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#login1
{
	float:left;
	height:40px;
	margin-left:80%;
	width:100px;
}
#nav
{
	height:40px;
	width:100%;
	background-color:blue;
}
#signup1
{
	height:40px;
	float:left;
	width:100px;
	margin-left:20px;
}
</style>
</head>
<body>
Welcome to All
<div id="nav">
<form action="login.jsp">
 <input type="submit" value="Login" id="login1">
 </form>
 <form action="signup.jsp">
 <input type="submit" value="SignUp" id="signup1">
</form>
</div>
</body>
</html>
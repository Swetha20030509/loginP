<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DataLayer.DataBase" %>
<%@ page import="model.Product" %>
<%@ page import="model.User" %>
<%@ page import="java.util.List" %>
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
.welcome
{
		margin-left:80%;
}
#product-list
{
	height:300px;
	width:100%;
	border:1px solid black;
	 
}
#product
{
	height:100%;
	width:20%;
	border:1px solid black;
	display: inline;
	 float:left;
}
</style>
</head>
<body>
Welcome to All
 <%
        DataBase dao = new DataBase();
        List<Product> productList = dao.getProductList();
        User user=dao.getUser();
        
    %>
    <div id="nav">
    <%
    	if(user==null)
    	{
    %>
			<form action="login.jsp">
			 <input type="submit" value="Login" id="login1">
 			</form>
 			<form action="signup.jsp">
 			<input type="submit" value="SignUp" id="signup1">
			</form>
	<%
    	}
	%>
		<%
			if(user!=null)
			{
		%>
        <p class="welcome">Welcome, <%=user.getName() %></p>
        <%
			}
        %>
    </div>
      <div id="product-list">
           <%
    for (Product product : productList) {
           %>
        <div id="product">
            <p>Name: <%= product.getName() %></p>
            <p>Amount: <%= product.getAmount() %></p>
        </div>
        <%
         }
        %>
       </div>
</body>
</html>
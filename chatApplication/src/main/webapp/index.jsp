<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="DataLayer.DataBase" %>
<%@ page import="model.User" %>
<%@ page import="DAO.UserDAO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#nav
{
height:50px;
width:100%;
box-shadow: 10px 10px 20px 5px rgba(0, 0, 0, 0.5);

}
.welcome
{
		margin-left:80%;
		
		display: inline;
}
#search
{
	height:30px;
	width:30%;
	border-radius:10px;
	margin-left:150px;
	margin-top:5px;
	float:left;
	display: inline;
}
#login1
{
	float:left;
	height:40px;
	margin-left:80%;
	width:100px;
	
}
#signup1
{
	float:left;
	height:40px;
	width:100px;
	
}
#icon
{
	height:40px;
	width:50px;
	margin-left:95%;
	display: inline;
}
#w1
{
display: inline;
}
#container
{
height:5yh0px;
width:30%;
margin-top:10px;
border:1px solid black;
}
</style>
</head>
<body>
 <%
        DataBase dao = new DataBase();
       UserDAO userdao=new UserDAO();
        List<User> userList =userdao.getUser();
        User user=dao.getUser();
      System.out.println(userList.size());
        
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
		<form action="search">
		<input type="text" id="search" placeholder="search">
		<button>Submit</button>
		</form>
		<div id="w1">
        <p class="welcome">Welcome, <%=user.getName() %></p>
        <img alt="" src="icon.jpg" id="icon">
       </div>
        <%
			}
        %>
    </div>
    <%
    	for(User user1:userList)
    	{
    %>
    <div id="container">
    	<%= user1.getName()%>
    </div>
    <%
    	}
    %>
</body>
</html>
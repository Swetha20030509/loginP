<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.User" %>
<%@ page import = "DataLayer.DataBase" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Details</title>
</head>
<body>
	<%
		DataBase data=new DataBase();
	User user = data.getUser();
	out.println(user.getName());
	out.println(user.getEmail());
	
	%>
	
    <p><%= user.getName() %></p>

    
</body>
</html>
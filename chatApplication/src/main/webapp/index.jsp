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
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<script type="text/javascript">
function sendFriendRequest(receiverId) {
    $.ajax({
        url: 'sendFriendRequest',
        type: 'POST',
        data: {
            senderId: /* your logged-in user ID */,
            receiverId: receiverId
        },
        success: function(response) {
            alert('Friend request sent!');
        },
        error: function() {
            alert('Error sending friend request.');
        }
    });
}
</script>
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
	width:60%;
	border-radius:10px;
	margin-left:150px;
	margin-top:5px;
	
	
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
	
}

#container
{
height:30px;
width:30%;
margin-top:40px;
 box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
padding:20px;
}
#req
{
	height:30px;
	width:35%;
	float:right;
	background-color:rgb(133, 51, 255);
	border:1px solid #8533ff;
	color:white;
	border-radius:10px;
	  box-shadow: 1px 1px 5px rgb(133, 51, 255); 
	
}
#searchUser
{
	display:inline;
	color: rgb(133, 51, 255);
	font-family: Arial, Helvetica, sans-serif;
	font-weight:bold;
	}
#searchDiv
{
width:60%;
height:10px;
float:left;
}
#message
{
	height:30px;
	width:30px;
}
#connect
{
	height:30px;
	width:30px;
	margin-left:20px;
}
#submit
{
	height:40px;
	width:100px;
	margin-left:10px;
	background-color:rgb(133, 51, 255);
	border:1px solid #8533ff;
	color:white;
	border-radius:10px;
	  box-shadow: 1px 1px 5px rgb(133, 51, 255); 
	
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
		<div style="width:70%;height:10px;float:left">
		<form action="Search" method="post">
		<input type="text"  id="search" name="Search" placeholder="search">
		 <input type="submit" id="submit">
		 </div>
		</form>
		<div style="float:left;width:10%;height:10px;padding:10px;">
		<img alt="" src="message.png" id="message" style="float:left">
		<img alt="" src="connect.png" id="connect" style="float:left">
		
		</div>
		
		<div style="float:left">
		
			<span style="color: rgb(133, 51, 255);font-family: Arial, Helvetica, sans-serif;font-weight:bold;
}"><%= user.getName()%></span>
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
    	<div id="searchDiv"><p id="searchUser"><%= user1.getName()%></p></div>
    	<form action="request">
    	<button onclick="friendRequest()"id="req">Send Request</button>
    	</form>
    	
    </div>
    <%
    	}
    %>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="datalayer.DataBase"%>
<%@ page import="model.User"%>
<%@ page import="DAO.UserDAO"%>
<%@ page import="java.util.List"%>
<%@ page import="action.Friendrequest"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="model.User"%>
<%@ taglib uri="/struts-tags" prefix="s" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src='https://kit.fontawesome.com/a076d05399.js'
	crossorigin='anonymous'></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<style>
#nav {
	height: 50px;
	width: 100%;
	box-shadow: 10px 10px 20px 5px rgba(0, 0, 0, 0.5);
}

.welcome {
	margin-left: 80%;
	display: inline;
}

#search {
	height: 30px;
	width: 60%;
	border-radius: 10px;
	margin-left: 150px;
	margin-top: 5px;
}

#login1 {
	float: left;
	height: 40px;
	margin-left: 80%;
	width: 100px;
}

#signup1 {
	float: left;
	height: 40px;
	width: 100px;
}

#icon {
	height: 40px;
	width: 50px;
}

#container {
	height: 30px;
	width: 50%;
	margin-top: 40px;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
	padding: 20px;
	
}

#req {
	height: 30px;
	width: 35%;
	float: right;
	background-color: rgb(133, 51, 255);
	border: 1px solid #8533ff;
	color: white;
	border-radius: 10px;
	box-shadow: 1px 1px 5px rgb(133, 51, 255);
}

#searchUser {
	display: inline;
	color: rgb(133, 51, 255);
	font-family: Arial, Helvetica, sans-serif;
	font-weight: bold;
}

#searchDiv {
	width: 100%;
	height: 10px;
	float: left;
}

#message {
	height: 30px;
	width: 30px;
}

#connect {
	height: 30px;
	width: 30px;
	margin-left: 20px;
}

#submit {
	height: 40px;
	width: 100px;
	margin-left: 10px;
	background-color: rgb(133, 51, 255);
	border: 1px solid #8533ff;
	color: white;
	border-radius: 10px;
	box-shadow: 1px 1px 5px rgb(133, 51, 255);
}
.userDetail {
	height: 60px;
	width: 400px;
	margin-left: 50px;
	margin-top: 50px;
	background-color: white;
	box-shadow: 5px 10px 18px #888888;
}
.close-btn {
	position: absolute;
	margin-left:450px;
	cursor: pointer;
	font-size: 40px;
}
#displayFriendReq {
	height: 450px;
	width: 500px;
	margin: auto;
	margin-top: 50px;
	overflow-y: scroll;
	background-color: white;
	box-shadow: 5px 10px 18px #888888;
	position: relative;
	margin-left:350px;
	display:none;
}
#contact
{
	height:500px;
	width:100%;
	border:3px solid black;
	 position: absolute;
	 display:none;
}
#contactDetail
{
	height:500px;
	width:35%;
	border:1px solid black;
	float:left;
	overflow-y: scroll;
}
#messages
{
	height:400px;
	width:63%;
	border:1px solid blue;
	float:left;
	overflow-y: scroll;
}
#sendMessage
{
	height:100px;
	width:63%;
	border:1px solid pink;
	float:left;
	postion: absolute;
}
#contactBox
{
	height:80px;
	width:350px;
	border:1px solid black;
	margin:auto;
	margin-top:20px;
}
#msg
{
		height:40px;
		width:300px;
		border-radius:15px;
		margin-top:40px;
		margin-left:350px;
}
#send
{
	margin-left:10px;
	height:40px;
	width:40px;
	border-radius:20px;
	bakground-color:green;
}
</style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	function request() {
		
		
		$.ajax({
            type: "GET",
            url: "viewrequest", 
            success: function(response) {
            	document.getElementById("displayFriendReq").style.display = "block";
            },
            error: function(xhr, status, error) {
                
                console.error("Error:", error);
            }
        });
		
	}
	function closepopup()
	{
		document.getElementById("displayFriendReq").style.display = "none";
	}
	function acceptRequest(count)
	{
		$.ajax({
            type: "GET",
            url: "acceptrequest", 
            success: function(response) {
                console.log("AJAX request successful!");
            },
            error: function(xhr, status, error) {
                
                console.error("Error:", error);
            }
        });
		document.getElementById("div"+count).style.display = "none";
	}
	function search()
	{
		doucument.getElementById("container").style.display="block";
	}
</script>
</head>
<body>
	<%
	int count = 0;
	DataBase dao = new DataBase();
	UserDAO userdao = new UserDAO();
	List<User> userLists = userdao.getUser();
	User user = dao.getUser();
	if (user != null)
		System.out.println(user.getId() + "....");
	Friendrequest fq = new Friendrequest();
	ArrayList<User> Request = fq.getUserList();
	%>
	<div id="nav">
		<%
		if (user == null) {
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
		if (user != null) {
		%>
		<div id="searchCon" style="width: 70%; height: 10px; float: left">
			<form action="Search" method="post">
				<input type="text" id="search" name="Search" placeholder="search">
				<button onclick="submit() id="submit">submit</button>
		</div>
		</form>
		<div style="float: left; width: 10%; height: 10px; padding: 10px;">
			<img alt="" src="message.png" id="message" style="float: left">
			<form id="myForm" action="viewrequest" method="post">
				<input type="hidden" name="senderId" value="<%=user.getId()%>">
				<img alt="" src="connect.png" id="connect" style="float: left"
					onclick="request()">
			</form>
		</div>
		<div style="float: left">
			<span
				style="color: rgb(133, 51, 255); font-family: Arial, Helvetica, sans-serif; font-weight: bold;"><%=user.getName()%></span>
			<img alt="" src="icon.jpg" id="icon">
		</div>
		<%
		}
		%>
	</div>
	<div id="search1" style="position: relative;height:600px;width:50%;float:left">
	<%
	for (User user1 :  userLists) {
	%>
	<div id="container">
		<div id="searchDiv">
			<p id="searchUser"><%=user1.getName()%></p>
		</div>
		<form action="request">
			<input type="hidden" name="senderId" value="<%=user.getId()%>">
			<input type="hidden" name="receiverId" value="<%=user.getId()%>">
			<button id="req">Send Request</button>
		</form>
	</div>
	<%
	}
	%>
	</div>
	<div id="contact">
	<div id="contactDetail">
	<div id="contactBox"></div>
	</div>
	<div id="messages"></div>
	<div id="sendMessage"><input type="text" placeholder="Message" id="msg"><button style="background-color:green" id="send"><i class="material-icons">&#xe163;</i></button></div>
	</div>
	<div id="displayFriendReq">
		<span class="close-btn" id="close" onclick="closepopup()">&times;</span>
		 /*<% if (Request != null) { %>
    <% for (User req : Request) { %>
        <% count++; %>
        <div class="userDetail" id="div<%= count %>">
            <div style="height: 20px; width: 160px; font-size: 20px; color: blue; background-color: white; float: left; padding: 20px">
                <%= req.getName() %>
            </div>
            <div  style="height: 20px; width: 150px; float: right; background-color: white; padding: 20px">
                <form id="form<%= count %>" action="acceptrequest" method="post">
                    <input type="hidden" name="receiverId" value="<%= req.getId() %>">
                    <input type="hidden" name="senderId" value="<%= user.getId() %>">
                    <div style="height:30px;width:100px;cursor:pointer;border:1px solid black" onclick="acceptRequest('<%= count %>')">Accept</div>
                </form>
                <button>Ignore</button>
            </div>
        </div>
    <% } %>
<% } %>*/
		

	</div>
</body>
</html>
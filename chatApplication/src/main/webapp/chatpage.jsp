<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="action.Friendrequest"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="model.User"%>
<!DOCTYPE html>
<html>
<head>
<style>
#contact
{
	height:500px;
	width:98%;
	margin-top:50px;
	background-color:#f5f5fb;
	 position: absolute;
	 
	
}
#contactDetail
{
	height:500px;
	width:35%;
	border:1px solid black;
	background-color:#252556;
	float:left;
	overflow-y: scroll;
}
#messages
{
	height:390px;
	width:100%;
	border:1px solid blue;
	float:left;
	overflow-y: scroll;
}
#sendMessage
{
	height:60px;
	width:100%;
	border:1px solid black;
	float:left;
	postion: absolute;
}
#contactBox
{
    height: 50px;
    width: 350px;
    padding: 20px;
    display: flex;
    align-items: center;
    margin-top: 20px;
    font-size: 20px;
    font-weight: bold;
    color: white; 
    cursor: pointer; 
}
#contactBox:hover
{
	background-color:#59597d;
}
#profile
{
	height:40px;
	width:40px;
	border-radius:20px;
	background-color:white;
}
#msg
{
		height:40px;
		width:300px;
		border-radius:15px;
		margin-top:10px;
		margin-left:390px;
}

#send
{
	margin-left:10px;
	height:40px;
	width:40px;
	border-radius:20px;
	
	
}
#messagecontainer
{
	height:500px;
	width:773px;
	float:left;
	
}
#profileHead
{
	height:50px;
	width:100%;
	 box-shadow: 10px 10px 20px 0 rgba(0, 0, 0, 0.5);
}
#messages1
{
background-color:green;
height:20px;
float:right;
padding:7px;
right:50px;
border-radius:9px;
}
#containers1
{
	height:30px;
	width:98%;
	margin-top:10px;
	
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function sendmessage()
{
	var containers1=document.createElement("div");
	containers1.id = "containers1";
	var div = document.createElement("div");
	var msg=document.getElementById("msg").value;
	div.innerHTML = msg;
	div.id = "messages1";
	containers1.appendChild(div);
	document.getElementById("messages").appendChild(containers1);
}
</script>
</head>
<body>
<%
ArrayList<User> friendList=Friendrequest.getAcceptFriends();
%>
<div id="contact">
    <div id="contactDetail">
        <%
            for (User user : friendList) {
        %>
        <span class="contactBox1" id="contactBox">
            <div id="profile"></div>
            <p style="margin: 20px"><%= user.getName() %></p>
        </span>
        <%
            }
        %>
    </div>
    <div id="messagecontainer">
    <div id="profileHead"></div>
        <div id="messages">
        
        </div>
        <div id="sendMessage"><input type="text" placeholder="Message" id="msg">
        <button onclick="sendmessage()"style="background-color:green" id="send"><i class="material-icons">&#xe163;</i></button>
        </div>
</div>
</div>
</body>
</html>
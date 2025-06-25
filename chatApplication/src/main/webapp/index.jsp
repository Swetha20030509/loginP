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
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>

#nav {
	height: 50px;
	width: 98%;
	box-shadow: 10px 10px 20px 5px rgba(0, 0, 0, 0.5);
	background-color:#130da6;
	padding:10px;
}
body
{
	
}
.welcome {
	margin-left: 80%;
	display: inline;
}
#contact
{
	height:500px;
	width:98%;
	margin-top:30px;
	background-color:#e1e3f0;
	 position: absolute;
	  box-shadow: 10px 10px 20px 0 rgba(0, 0, 0, 0.5);
	border-radius:30px;
	display:none;
	
}
#search {
	height: 40px;
	width: 75%;
	border-radius: 20px;
	border:1px solid white;
	background-color:white;
	box-shadow: 10px 10px 20px 5px rgba(0, 0, 0, 0.5);
	float:left;
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
	width: 80%;
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
	cursor: pointer;
}

#connect {
	height: 30px;
	width: 30px;
	margin-left: 20px;
}

#submit {
	height: 40px;
	width: 40px;
	margin-left: 5px;
	
	text-align:center;
	color: white;
	margin-top:10px;
	float:left;
	cursor:pointer;
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
}
#accept
{
height:30px;
width:60px;
cursor:pointer;
border:1px solid black;
justify-content: center;
}
#search1
{
position: relative;
height:400px;
width:30%;
float:left;
margin-left:500px;
box-shadow: 5px 10px 18px #888888;
overflow-y: scroll;
display:none;

}
.close-btn1
{
cursor:pointer;
position: absolute;
	margin-left:320px;
	cursor: pointer;
	font-size: 40px;
}
#profile1
{
	height:300px;
	width:300px;
	background-color:white;
	box-shadow: 5px 10px 18px #888888;
}
#profileOut
{
	height:100px;
	width:100px;
	border:1px solid black;
	border-radius:50px;
	margin:auto;
}
#logout
{
margin-left:100px;
height:40px;
width:100px;
}


</style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
function viewUser(recevierId,senderId)
{
	console.log("view"+recevierId+"---"+senderId);
	document.getElementById('sen').value=senderId;
	document.getElementById('rec').value=recevierId;
$.ajax({
		
	    type: "GET",
	    url: "retrieve",
	    data: {
	        senderId: senderId,
	        receiverId: recevierId,
	       
	    },
	    dataType: "json",
	    success: function(response) {
	    	
	    	$("#messages").empty();
	    	console.log(response);
	    	var messages = response.allmessage;
           

            messages.forEach(function(msg) {
            	
                var messageContainer = document.createElement("div");
                messageContainer.className = "message-container";

                var messageDiv = document.createElement("div");
                if (msg.senderId == senderId) {
                    messageDiv.id = "senderMsg";
                } else {
                    messageDiv.id = "receiverMsg";
                }

                messageDiv.innerHTML = msg.content + "<sub class='time'>" + msg.timestamp + "</sub>";
                messageContainer.appendChild(messageDiv);

                document.getElementById("messages").appendChild(messageContainer);
            });

            // Show the message container
            document.getElementById('messagecontainer').style.display = "block";
        },
        error: function(xhr, status, error) {
            console.error("Error:", error);
        }
    });

}
	function openContact()
	{
		$.ajax({
            type: "POST",
            url: "opencontact", 
            success: function(response) {
            	console.log(response);
            	document.getElementById("contact").innerHTML = response;
                document.getElementById("contact").style.display = "block";
            },
            error: function(xhr, status, error) {
                
                console.error("Error:", error);
            }
        });
		
	}
	function request() {
		
		
		$.ajax({
            type: "POST",
            url: "viewrequest", 
            success: function(response) {
            	console.log(response);
            	document.getElementById("displayFriendReq").innerHTML = response;
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
	
	function acceptRequest(count,receiver,sender)
	{
		console.log(count +"////"+receiver+"/////"+sender);
		$.ajax({
            type: "GET",
            url: "acceptrequest", 
            data: {
                receiverId: receiver,
                senderId: sender
            },
            success: function(response) {
                console.log("AJAX request successful!");
            },
            error: function(xhr, status, error) {
                
                console.error("Error:", error);
            }
        });
		document.getElementById("div"+count).style.display = "none";
	}
	
	function searchUser(event) {
	    if (event.key === "Enter") {
	        event.preventDefault();
	        var searchValue = document.getElementById("search").value;

	        $.ajax({
	            type: "POST", // ✅ POST, not GET
	            url: "Search", // Struts action
	            data: {
	                searchQuery: searchValue // ✅ name must match setter: setSearchQuery()
	            },
	            success: function(response) {
	            	 console.log("Response from server:", response); 
	                document.getElementById("search1").innerHTML = response;
	                document.getElementById("search1").style.display = "block";
	            },
	            error: function(xhr, status, error) {
	                console.error("Search error:", error);
	            }
	        });
	    }
	}

	function updateProfile()
	{
		 document.getElementById('fileInput').click();
	}
	function closePop()
	{
		console.log("..////.......");
		document.getElementById("search1").style.display = "none";
	}
	function viewProfile()
	{
		
		document.getElementById("profile1").style.display = "block";
		
		
	}
	
	
	
</script>
</head>
<body>
	<%
	
	
	int count = 0;
	
	
	User user = UserDAO.getInstance().getUser();	
	User user1;
	%>
	
		<%
		if (user == null) {
		%>
		
		
		<%
		}
		%>
		<%
		if (user != null) {
			user1=user;
		%>
		<div id="nav">
		<input type="hidden" value="<%=user.getId() %>" id="userId">
		<s:include value="/chatpage.jsp" />
		<div id="searchCon" style="width: 40%; height: 10px; float: left;margin-left:200px;">
			<form action="Search" method="post">
				<input type="text" id="search" name="Search" placeholder="search"  onkeydown="searchUser(event)">
			
		</div>
		</form>
		<div style="float: left; width: 20%; height: 10px; padding: 10px;">
			<img alt="" src="comment.png" id="message" style="float: left" onclick="openContact()">
			<form id="myForm" action="viewrequest" method="post">
				<input type="hidden" name="senderId" value="<%=user.getId()%>">
				<img alt="" src="add-friend.png" id="connect" style="float: left"
					onclick="request()">
			</form>
		</div>
		<div style="float: left">
			<div style="height :20px; text-align: right;width:150px;float: left;color: white; font-family: Arial, Helvetica, sans-serif; font-weight: bold; padding-top: 15px; padding-right: 10px;"><%=user.getName()%>
			</div>
			
			<img src="upload/<%= user.getImage() %>" alt="img" id="icon" onclick="viewProfile()">
			
		</div>
		</div>
		<%
		}
		%>
	</div>
	
	<div id="search1" >
	
	
	</div>
	<div id="displayFriendReq">
	</div>
	
<%if(user!=null){ 
	System.out.println(user.getImage()+"000000");
	%>
	
<div id="profile1" style="display: none">
    
    <!-- Display Profile Picture -->
    <div id="profileOut">
        <img alt="" src="upload/<%= user.getImage() %>" style="height:100px; width:100px; border-radius: 50%;">
    </div>
    
    <!-- Plus Icon to Trigger File Input -->
    <img id="upload" alt="Upload" src="plus.png"
         style="height:30px; width:30px; margin-left:170px; margin-top:-40px; cursor:pointer"
         onclick="document.getElementById('fileInput').click();" >

    <!-- Form to Upload Image -->
    <form action="updateProfile" method="post" enctype="multipart/form-data" theme="simple">
    <input type="hiddent" name="userId" value="<%= user.getId() %>">
    <input type="file" name="dp" id="fileInput" style="display: none;" onchange="this.form.submit();" />
 
    <div style="height:100px;width:100px;">
        <p>Name: <%= user.getName() %></p>
    </div>
    <button id="logout">LOGOUT</button>
</form>


</div>
<% 
} %>
<div id="contact"></div>
</body>
</html>
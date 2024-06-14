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
	background-color:#aeadc0;
}
.welcome {
	margin-left: 80%;
	display: inline;
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
   
	function openContact()
	{
		document.getElementById("contact").style.display="block";
	}
	function request() {
		
		
		$.ajax({
            type: "GET",
            url: "viewrequest", 
            success: function(response) {
            	document.getElementById("contact").style.display="none";
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
	function searchUser() 
	{
		const searchQuery=document.getElementById("search").value;
		console.log(searchQuery);
		console.log("8888888");
		$.ajax({
            type: "GET",
            url: "Search", 
            data: {
            	 searchQuery: searchQuery
            },
            success: function(response) {
                document.getElementById("search1").style.display = "block";
            },
            error: function(xhr, status, error) {
                
                console.error("Error:", error);
            }
        });
	}
	function handleFileInputChange(event) {
		console.log("swetha");
        var file = event.target.files[0];
        if (file) {
            var reader = new FileReader();
            reader.onload = function(e) {
                var profileImg = document.getElementById("profileOut");
                if (profileImg) {
                    profileImg.src = e.target.result;
                } else {
                    console.error("Element with ID 'profileImg' not found.");
                }
            };
            reader.readAsDataURL(file);

            // Log file name
            console.log("File selected:", file.name);

            
            var formData = new FormData();
            formData.append('profileData', file);
            formData.append('userId', document.getElementById('userId').value); // Append user ID

        //   console.log(formData+"????????????");
            $.ajax({
                type: "POST",
                url: "updateProfile", 
                data: formData,
                processData: false,
                contentType: false,
                success: function(response) {
                    alert("Profile picture updated successfully!");
                   // console.log(response);
                },
                error: function(xhr, status, error) {
                    console.error("Error:", error);
                }
            });
        } else {
            console.error("No file selected.");
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
	ArrayList<User> Request = Friendrequest.getUserList();
	
	int count = 0;
	DataBase dao = new DataBase();
	UserDAO userdao = new UserDAO();
	List<User> userLists = userdao.getUser();
	User user = dao.getUser();	
	User user1;
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
			user1=user;
		%>
		<input type="hidden" value="<%=user.getId() %>" id="userId">
		<s:include value="/chatpage.jsp" />
		<div id="searchCon" style="width: 40%; height: 10px; float: left;margin-left:200px;">
			<form action="Search" method="post">
				<input type="text" id="search" name="Search" placeholder="search">
				<div onclick="searchUser()" id="submit"><i class="fa fa-search" style="font-size:25px"></i></div>
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
			<img alt="img" src="profile-user.png" id="icon" onclick="viewProfile()">
			
		</div>
		<%
		}
		%>
	</div>
	<div id="search1" >
	<span class="close-btn1" id="close1" onclick="closePop()">&times;</span>
	<%
	for (User user1 :  userLists) {
	%>
	
	<div id="container">
		<div id="searchDiv">
			<p id="searchUser"><%=user1.getName()%></p>
		</div>
		<%if(user!=null&&user1!=null) {%>
		<%
			if(dao.isFriends(user.getId(),user1.getId()).equals("accepted"))
			{
		%>
		 <form action="chat">
            <input type="hidden" name="senderId" value="<%= user.getId() %>">
            <input type="hidden" name="receiverId" value="<%= user1.getId() %>">
            <button id="req">Chat</button>
        </form>
        <% }
			else if(dao.isFriends(user.getId(),user1.getId()).equals("pending"))
			{
		%>
		 <form action="request">
            <input type="hidden" name="senderId" value="<%= user.getId() %>">
            <input type="hidden" name="receiverId" value="<%= user1.getId() %>">
            <button id="req">request</button>
        </form>
        <%}
         else{ %>
		<form action="request">
			<input type="hidden" name="senderId" value="<%=user.getId()%>">
			<input type="hidden" name="receiverId" value="<%=user1.getId()%>">
			<button id="req">Send Request</button>
		</form>
		<%
			}
		%>
	</div>
	<%
	}
	%>
	<%
	}
	%>
	</div>
	
	
	<div id="displayFriendReq">
		<span class="close-btn" id="close" onclick="closepopup()">&times;</span>
		
		<% if (Request != null) { %>
		
    <% for (User req : Request) {
    	System.out.println(".....AAAAAAAAAAA.....");
    	%>
        <% count++; %>
        <div class="userDetail" id="div<%= count %>">
            <div style="height: 20px; width: 160px; font-size: 20px; color: blue; background-color: white; float: left; padding: 20px">
                <%= req.getName() %>
            </div>
            <div  style="height: 20px; width: 150px; float: right; background-color: white; padding: 20px">
                <form id="form<%= count %>" action="acceptrequest" method="post">
     
                    <input type="hidden" name="receiverId" value="<%= req.getId() %>">
                    <input type="hidden" name="senderId" value="<%= user.getId() %>">
                    <div id="accept" onclick="acceptRequest('<%= count %>',<%= req.getId() %>,<%= user.getId() %>)">Accept</div>
                </form>
                <button>Ignore</button>
            </div>
        </div>
    <% } %>
<% } else {%>
 <p>No friend requests found.</p>
<% } %>

</div>
<%if(user!=null){ 
	System.out.println(user.getImage()+"000000");
	%>
<div id="profile1" style="display: none">
	<div id="profileOut"><img alt="" src="<%= user.getImage() %>" style="height:100px; width:100px">
	</div>
	
	<img id="upload" alt="" src="plus.png" style="height:30px; width:30px;margin-left:170px;margin-top:-40px" onclick="updateProfile()" >
  <input type="file" name="profileData"" id="fileInput" style="display: none;" onchange="handleFileInputChange(event)">
	<div style="height:100px;width:100px;border:1px ">
		<p>Name</p>
	</div>
	
	<button id="logout">LOGOUT</button>
</div>
<% 
} %>
</body>
</html>
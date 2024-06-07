<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="action.Friendrequest"%>
    <%@ page import="datalayer.DataBase"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="model.User"%>
<%@ taglib uri="/struts-tags" prefix="s" %> 
<%@ page import="java.util.ArrayList"%>
<%@ page import="model.Message"%>
<%@ page import="action.SendMessage"%>
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
	display:none;
	
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
#messages2
{
background-color:green;
height:20px;
float:left;
padding:7px;
border-radius:9px;
}
#containers1
{
	height:30px;
	width:98%;
	margin-top:10px;
	
}
#containers2
{
	height:30px;
	width:98%;
	margin-left:10px;
	margin-top:10px;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function sendmessage()
{
	
	var containers1 = document.createElement("div");
	containers1.id = "containers1";
	var div = document.createElement("div");
	var msg = document.getElementById("msg").value;
	
	div.innerHTML = msg;
	div.id = "messages1";
	containers1.appendChild(div);
	document.getElementById("messages").appendChild(containers1);

	var s = document.getElementById('sen').value; 
	var r = document.getElementById('rec').value; 
	$.ajax({
		
	    type: "GET",
	    url: "send",
	    data: {
	        senderId: s,
	        receiverId: r,
	        content: msg
	    },
	    
	    success: function(response) {
	        console.log("Message sent successfully!");
	    },
	    error: function(xhr, status, error) {
	    	
	        console.error("Error:", error);
	    }
	});

	
	
}
function addMessage(msg)
{
	}
function viewUser(recevierId,senderId)
{
	document.getElementById('sen').value=senderId;
	document.getElementById('rec').value=recevierId;
$.ajax({
		
	    type: "GET",
	    url: "retrieve",
	    data: {
	        senderId: senderId,
	        receiverId: recevierId,
	       
	    },
	    
	    success: function(response) {
	        console.log("Message sent successfully!");
	    },
	    error: function(xhr, status, error) {
	    	
	        console.error("Error:", error);
	    }
	});
	document.getElementById('messagecontainer').style.display="block";
}
function messageShow(send,rec,currendId,msg)
{
	console.log(send);	
	console.log(currendId);
	if(send==currendId)
		{
		
		var containers1 = document.createElement("div");
		containers1.id = "containers1";
		var div = document.createElement("div");
		div.innerHTML = msg;
		div.id = "messages1";
		containers1.appendChild(div);
		document.getElementById("messages").appendChild(containers1);
		}
	else
		{
		console.log("....");
		var containers1 = document.createElement("div");
		containers1.id = "containers2";
		var div = document.createElement("div");
		div.innerHTML = msg;
		div.id = "messages2";
		containers1.appendChild(div);
		document.getElementById("messages").appendChild(containers1);
		}
}
</script>
</head>
<body>
<%
ArrayList<User> friendList=Friendrequest.getAcceptFriends();
User currentuser = DataBase.getUser();
%>
<div id="contact">
    <div id="contactDetail">
        <%
            for (User user : friendList) {
        %>
        
        <span class="contactBox1" id="contactBox" onclick="viewUser('<%= user.getId() %>','<%= currentuser.getId() %>')">
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
        <% 
            ArrayList<Message> allMessages = SendMessage.getAllmessage();
            if (allMessages != null) {
                for (Message msg : allMessages) {
        %>
                   <script>
                    
                    messageShow('<%=msg.getSenderId() %>','<%=msg.getReceiverId() %>','<%=currentuser.getId() %>','<%=msg.getContent() %>');
                </script>
        <%
                }
            }
        %>
    </div>
    

        
        <div id="sendMessage"><input type="hidden" value=0 id="sen"><input type="hidden" value=0 id="rec">
        
        <input type="text" placeholder="Message" id="msg">
        <button onclick="sendmessage()"style="background-color:green" id="send"><i class="material-icons">&#xe163;</i></button>
        </div>
        
</div>
</div>
</body>
</html>
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
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<style>
#contact
{
	height:500px;
	width:98%;
	margin-top:50px;
	background-color:#e1e3f0;
	 position: absolute;
	  box-shadow: 10px 10px 20px 0 rgba(0, 0, 0, 0.5);
	border-radius:30px;
	margin-top:70px;
	display:none;
}
#contactDetail
{
	height:500px;
	width:35%;
	
	background-color:#c4c8eb;
	 box-shadow: 5px 5px 10px #c4c8eb;
	float:left;
	overflow-y: scroll;
	border-radius:30px;
}
#messages
{
	height:350px;
	width:100%;
	
	float:left;
	overflow-y: scroll;
}
#sendMessage
{
	height:60px;
	width:100%;
	
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
    color: black; 
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
		width:700px;
		border-radius:15px;
		margin-top:10px;
		
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
#senderMsg {
        background-color: #daf8da;
        float:right;
         border-radius: 5px;
          padding: 5px;
         max-width:40%;     
          word-wrap: break-word;  
    }
    #receiverMsg {
        background-color: #daf8da;
        float:left;
         border-radius: 5px;
          max-width:40%;
           padding: 5px;
           word-wrap: break-word; 
        
    }
    .message-container {
            width: 100%;
            
            margin-bottom: 10px;
            overflow: auto; /* Clearfix alternative */
            padding: 5px;
            box-sizing: border-box;
        }
        .time{
	
	padding:2px;
	font-size:15px;
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
function messageShow(send,rec,currendId,msg)
{
	console.log(send);	
	console.log(currendId);
	if(send==currendId)
		{
		console.log("1");
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
		console.log("2");
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
    
       
                <div class="message-container">
                    <div id="senderMsg"><sub class="time"></sub></div>
                    </div>
                  
               
               <div class="message-container">
                    <div id="receiverMsg"><sub class="time"></sub></div>
                    </div>
 
</div>

    

        
        <div id="sendMessage"><input type="hidden" value=0 id="sen"><input type="hidden" value=0 id="rec">
        
        <input type="text" placeholder="Message" id="msg">
        <button onclick="sendmessage()"style="background-color:green" id="send"><i class="material-icons">&#xe163;</i></button>
        </div>
        
</div>
</div>
</body>
</html>
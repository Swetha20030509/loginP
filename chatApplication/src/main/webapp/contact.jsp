<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ taglib uri="/struts-tags" prefix="s" %> 
<%@ page import="java.util.ArrayList"%>
<%@ page import="model.User"%>
<%@ page import="DAO.UserDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

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
#profile-img
{
	height:40px;
	width:40px;
	border-radius:20px;
}
#msgProfile
{
	height:40px;
	width:40px;
	border-radius:20px;
	margin-left:50px;
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
background-color:#daf8da;
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
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
function viewUser(recevierId,senderId)
{
	console.log("hi");
	

}
</script>
</head>
<body>

       <s:if test="friendList.size() > 0">
 <s:iterator value="friendList" var="u">
   <%
    int currentUserId = UserDAO.getInstance().getUser().getId();
   User curruser=UserDAO.getInstance().getUser();
%>
<div style="float:left">
   <span class="contactBox1" id="contactBox" onclick="viewUser('<s:property value="#u.id" />','<%= currentUserId %>')">
    <div id="profile">
            <img src="upload/<s:property value="#u.imagePath" />" id="profile-img">
            </div>
            <p style="margin: 20px"><s:property value="#u.name" /></p>
   </span>
   </div>
   <div style="float:right">
    <div id="messagecontainer">
    <div id="profileHead">
    <span id="msgProfile" style="float:left"> <img src="upload/<s:property value="#u.imagePath" />" id="profile-img"></span>
    <p style="float:left"><s:property value="#u.name" /></p>
   
    </div>
    
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
</div>
</s:iterator>
 </s:if>
 <s:else>
 <p>no user</p>
 </s:else>
     
    
        
</body>
</html>
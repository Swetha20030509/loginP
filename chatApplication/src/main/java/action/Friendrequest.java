package action;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.opensymphony.xwork2.ActionSupport;

import model.User;

public class Friendrequest extends ActionSupport {
	private static final String URL = "jdbc:mysql://localhost:3306/ chatApplication";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "Admin";
	int senderId;
	int receiverId;
	static ArrayList<User> userList=new ArrayList<>();
	public ArrayList<User> getUserList() {
		return userList;
	}
	public void setUserList(ArrayList<User> userList) {
		this.userList = userList;
	}
	public int getSenderId() {
		return senderId;
	}
	public void setSenderId(int senderId) {
		this.senderId = senderId;
	}
	public int getReceiverId() {
		return receiverId;
	}
	public void setReceiverId(int receiverId) {
		this.receiverId = receiverId;
	}
	public String execute() throws SQLException
	{
		System.out.println("hello");
		String query="INSERT INTO friend_requests(senderId,receiverId, status) VALUES(?,?,?)";
		try (Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
				PreparedStatement stmt = conn.prepareStatement(query)) {
			stmt.setInt(1,getSenderId());
            stmt.setInt(2, getReceiverId()); 
            stmt.setString(3, "PENDING"); 
            int rowsAffected = stmt.executeUpdate();
	            }
		return SUCCESS;
	}
	public void displayFriendRequests()
	{
		userList=new ArrayList<>();
		String query = "SELECT fr.id AS friend_request_id, u1.name AS sender_name, " +
		               "u1.mobileNo AS sender_mobile, u1.username AS sender_username, " +
		               "u2.name AS receiver_name, u2.mobileNo AS receiver_mobile, " +
		               "u2.username AS receiver_username, fr.status " +
		               "FROM friend_requests fr " +
		               "JOIN user u1 ON fr.senderId = u1.id " +
		               "JOIN user u2 ON fr.receiverId = u2.id";

		try (Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
		     PreparedStatement statement = conn.prepareStatement(query);
		     ResultSet resultSet = statement.executeQuery()) {
		    while (resultSet.next()) {
		        User user = new User();
		        user.setName(resultSet.getString("receiver_name"));
		        userList.add(user);
		    }
		} catch (SQLException e) {
			
		    e.printStackTrace();}
	}
	public Connection connection() throws SQLException
	{
		return DriverManager.getConnection(URL, USERNAME, PASSWORD);
	}
	
}

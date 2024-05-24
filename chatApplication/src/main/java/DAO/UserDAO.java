package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.opensymphony.xwork2.ActionSupport;
import model.User;

public class UserDAO extends ActionSupport{
	private static final String URL = "jdbc:mysql://localhost:3306/ chatApplication";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "Admin";
	 List<User> user=new ArrayList<>();
	public  List<User> getUser() {
		return user;
	}

	public  void setUser(List<User> user) {
		this.user = user;
	}
	String username;
	public String execute() throws SQLException
	{
		user=searchUser(username);
		return SUCCESS;
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	public Connection connection() throws SQLException
	{
		return DriverManager.getConnection(URL, USERNAME, PASSWORD);
	}
	public List<User> searchUser(String username) throws SQLException
	{
		List<User> users=new ArrayList<>();
		 
			String query="SELECT * FROM  USER";
			try (Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
					PreparedStatement statement = conn.prepareStatement(query);
		             ResultSet resultSet = statement.executeQuery()) {
		            while (resultSet.next()) {
		            	User user = new User();
		            	user.setName(resultSet.getString("name"));
		            	user.setMobileNo(resultSet.getString("mobileNo"));
		            	//user.setMobileNo(resultSet.getString("mobileNo");
		            	users.add(user);
		            }
		        }
			return users;
	}
}


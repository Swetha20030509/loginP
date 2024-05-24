package DataLayer;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import loginPage.LoginAction;
import model.User;

public class DataBase {
	 private static final String URL = "jdbc:mysql://localhost:3306/ chatApplication";
	    private static final String USERNAME = "root";
	    private static final String PASSWORD = "Admin";
	    static User user;
	   
	    static
	    {
	    	try {
				Class.forName("com.mysql.cj.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
	    }
	   
	    public static User validateUser(String mobileNo, String password) {
	        String sql = "SELECT * FROM user WHERE mobileNo = ? AND password = ?";
	        try (Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
	             PreparedStatement stmt = conn.prepareStatement(sql)) {
	        	Class.forName("com.mysql.cj.jdbc.Driver");
	            stmt.setString(1, mobileNo);
	            stmt.setString(2, password);
	            try (ResultSet rs = stmt.executeQuery()) {
	            	boolean a= rs.next();
	            	
	            	if(a)
	            	{
	            		user =new User();
	            		user.setName(rs.getString(1));
	            		user.setMobileNo(rs.getString(2));
	            		user.setUsername(rs.getString(3));
	            		user.setPassword(rs.getNString(4));
	            		System.out.println(user.getName());
	            		
	            		return user;
	            	}
	            	return user;
	            }
	        } catch (SQLException | ClassNotFoundException e) {
	            e.printStackTrace();
	            System.out.println("&&&&&");
	            return user; 
	        }
	    }
	    public static boolean addUser(String name,String mobileNo, String username,String password) throws ClassNotFoundException {
	    	
	      if (userExists(mobileNo, password)) 
	    	{
	    		System.out.println("User exists with this email/username");
	            return false; 
	        }
	    	
	        String sql = "INSERT INTO user (name,mobileNo,username,Password) VALUES (?, ?, ?,?)";
	        
	        try (Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
	             PreparedStatement stmt = conn.prepareStatement(sql)) {
	            stmt.setString(1, name);
	            stmt.setString(2, mobileNo);
	            stmt.setString(3, username);
	            stmt.setString(4, password);
	            int rowsAffected = stmt.executeUpdate();
	            return rowsAffected > 0; 
	        } catch (SQLException e) {
	            e.printStackTrace();
	            return false; 
	        }
	    }
	    public static User getUser()
	    {
	    	return user;
	    }
		public static boolean userExists(String mobileNo, String password) {
			  String sql = "SELECT * FROM user WHERE mobileNo = ? OR password = ?";
	        try (Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
	                PreparedStatement stmt = conn.prepareStatement(sql)) {
	               stmt.setString(1, mobileNo);
	               stmt.setString(2, password);
	              
	               try (ResultSet rs = stmt.executeQuery()) {
	                    if(rs.next())
	                    {
	                    	int count=rs.getInt(1);
	                        return count>0;
	                    } 
	               }
	           } catch (SQLException e) {
	               e.printStackTrace();
	              
	           }
	        return false; 
		}
	}

package DataLayer;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.User;

public class DataBase {
	 private static final String URL = "jdbc:mysql://localhost:3306/ exerice";
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
	    public static boolean addUser(String name, String email,String password) throws ClassNotFoundException {
	    	
	      if (userExists(email, password)) 
	    	{
	    		System.out.println("User exists with this email/username");
	            return false; 
	        }
	    	
	        String sql = "INSERT INTO UserDetails (Name,Email,Password) VALUES (?, ?, ?)";
	        
	        try (Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
	             PreparedStatement stmt = conn.prepareStatement(sql)) {
	            stmt.setString(1, name);
	            stmt.setString(2, email);
	            stmt.setString(3, password);
	            int rowsAffected = stmt.executeUpdate();
	            return rowsAffected > 0; 
	        } catch (SQLException e) {
	            e.printStackTrace();
	            return false; 
	        }
	    }
	    public static User getUser()
	    {
	    	System.out.println(user.getEmail());
	    	return user;
	    }
		public static boolean userExists(String email, String password) {
			  String sql = "SELECT * FROM UserDetails WHERE email = ? AND Password = ?";
			  System.out.println("Console1");
	        try (Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
	                PreparedStatement stmt = conn.prepareStatement(sql)) {
	               stmt.setString(1, email);
	               stmt.setString(2, password);
	               System.out.println("Console2");
	               try (ResultSet rs = stmt.executeQuery()) {
	                   while(rs.next())
	                   {
	                	   user=new User();
	                	   user.setName(rs.getString("name"));
	                	   user.setEmail(rs.getString("email"));
	                	   user.setPassword(rs.getNString("password"));
	                	   System.out.println("Console");
	                       return true;
	                   }
	                   return false;
	               }
	           } catch (SQLException e) {
	               e.printStackTrace();
	               return false; 
	           }
		}

}

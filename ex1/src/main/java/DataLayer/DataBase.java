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
import model.Product;
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
	    public static boolean  addProduct(String name,String amount)
	    {
	    	String sql="INSERT INTO product (name,amount) VALUES(?,?)";
	    	 try (Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
		             PreparedStatement stmt = conn.prepareStatement(sql)) {
		            stmt.setString(1, name);
		            stmt.setString(2, amount);
		            int rowsAffected = stmt.executeUpdate();
		            return rowsAffected > 0; 
		        } catch (SQLException e) {
		            e.printStackTrace();
		            return false;
		        }
	    }
	    public static User validateUser(String email, String password) {
	        String sql = "SELECT * FROM UserDetails WHERE email = ? AND password = ?";
	        try (Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
	             PreparedStatement stmt = conn.prepareStatement(sql)) {
	        	Class.forName("com.mysql.cj.jdbc.Driver");
	            stmt.setString(1, email);
	            stmt.setString(2, password);
	            try (ResultSet rs = stmt.executeQuery()) {
	            	boolean a= rs.next();
	            	
	            	if(a)
	            	{
	            		user =new User();
	            		user.setName(rs.getString(1));
	            		user.setEmail(rs.getNString(2));
	            		user.setPassword(rs.getNString(3));
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
	    	return user;
	    }
		public static boolean userExists(String email, String password) {
			  String sql = "SELECT * FROM UserDetails WHERE email = ? OR Password = ?";
	        try (Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
	                PreparedStatement stmt = conn.prepareStatement(sql)) {
	               stmt.setString(1, email);
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
		public static boolean isAdmin(String email, String password) {
			if(email.equals("admin@123gmail.com")&&password.equals("9750"))
				return true;
			return false;
		}
		public ArrayList<Product> getProductList() throws SQLException {
			 ArrayList<Product> productList=new ArrayList<>();
			String query="SELECT * FROM  PRODUCT";
			try (Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
					PreparedStatement statement = conn.prepareStatement(query);
		             ResultSet resultSet = statement.executeQuery()) {
		            while (resultSet.next()) {
		            	Product product = new Product();
		                product.setName(resultSet.getString("name"));
		                product.setAmount(resultSet.getString("amount"));
		                productList.add(product);
		            }
		        }
			return productList;
		}
}

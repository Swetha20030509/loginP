package action;


import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.opensymphony.xwork2.ActionSupport;

import datalayer.DataBase;
import model.User;

public class UpdateProfileAction extends ActionSupport {

	private InputStream profileData;
    private int userId;

    public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}
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

    public InputStream getProfileData() {
        return profileData;
    }

    public void setProfileData(InputStream profileData) {
        this.profileData = profileData;
    }
    public String execute() throws Exception {
    	System.out.println("hhhhhhh");
        
        String query = "UPDATE user_profile SET profile_image = ? WHERE id = ?";
        try (Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
	             PreparedStatement stmt = conn.prepareStatement(query)) {
           // 
           //int userId=DataBase.getUser().getId();
   
        	stmt.setBlob(1, profileData);
            stmt.setInt(2, userId);
            stmt.executeUpdate();

            return SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        } 
    }
}

package action;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.opensymphony.xwork2.ActionSupport;

public class UpdateProfileAction extends ActionSupport {

    private static final String URL = "jdbc:mysql://localhost:3306/chatApplication";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "Admin";

    private File profileData;
    private String profileDataContentType;
    private String profileDataFileName;
    private int userId;

    // Getters and setters

    public File getProfileData() {
        return profileData;
    }

    public void setProfileData(File profileData) {
        this.profileData = profileData;
    }

    public String getProfileDataContentType() {
        return profileDataContentType;
    }

    public void setProfileDataContentType(String profileDataContentType) {
        this.profileDataContentType = profileDataContentType;
    }

    public String getProfileDataFileName() {
        return profileDataFileName;
    }

    public void setProfileDataFileName(String profileDataFileName) {
        this.profileDataFileName = profileDataFileName;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String execute() throws IOException {
        if (profileData == null) {
            System.out.println("Profile data file is null!");
            return "error"; // Handle the error accordingly
        }
System.out.println(profileData+"   kkfgzjsjoigsnior");
        String destinationPath = "F:\\" + profileDataFileName;

        try {
            // Copy the file
            String savedFilePath = saveFile(profileData, destinationPath);

            // Add the file path to the database
            if (savedFilePath != null) {
                insertIntoDatabase(savedFilePath, getUserId()); // Assuming you have a method to get the user ID
                System.out.println("File path added to the database successfully!");
                return "success"; // or whatever your success result is
            } else {
                System.out.println("Failed to add file path to the database.");
                return "error"; // or handle the error accordingly
            }
        } catch (IOException | SQLException e) {
            // Handle the exception
            e.printStackTrace();
            return "error"; // or handle the error accordingly
        }
    }

    private String saveFile(File sourceFile, String destinationPath) throws IOException {
        Path sourcePath = sourceFile.toPath();
        Path destinationFilePath = Paths.get(destinationPath);
        if (Files.exists(destinationFilePath)) {
            // Handle file already exists scenario
            System.out.println("Destination file already exists!");
            return null; // Or handle it according to your requirement
        }

        Files.copy(sourcePath, destinationFilePath);
        return destinationPath; // Return the saved file path
    }



    private void insertIntoDatabase(String filePath, int userId) throws SQLException {
        String sql = "UPDATE user SET profileimage = ? WHERE id = ?";
        
        try (Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, filePath); // Set the profile image file path
            pstmt.setInt(2, userId); // Set the user ID
            pstmt.executeUpdate();
        }
    }
}

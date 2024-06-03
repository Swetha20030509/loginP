package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.opensymphony.xwork2.ActionSupport;

import datalayer.DataBase;
import model.User;

public class UserDAO extends ActionSupport {
	private static final String URL = "jdbc:mysql://localhost:3306/ chatApplication";
	private static final String USERNAME = "root";
	private static final String PASSWORD = "Admin";
	static List<User> userList = new ArrayList<>();
	String Search;

	public List<User> getUser() {
		return userList;
	}

	public String execute() throws SQLException {
		userList = new ArrayList<>();
		String query = "SELECT * FROM  USER";
		try (Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
				PreparedStatement statement = conn.prepareStatement(query);
				ResultSet resultSet = statement.executeQuery()) {
			while (resultSet.next()) {
				if (!(DataBase.getUser().getUsername().equals(resultSet.getString("username")))&&(resultSet.getString("username").startsWith(getSearch()))) {
					User user = new User();
					user.setName(resultSet.getString("name"));
					user.setMobileNo(resultSet.getString("mobileNo"));
					user.setId(resultSet.getInt("id"));
					userList.add(user);
				}
			}
		}
		return SUCCESS;
	}

	public String getSearch() {
		return Search;
	}

	public void setSearch(String search) {
		Search = search;
	}

	public Connection connection() throws SQLException {
		return DriverManager.getConnection(URL, USERNAME, PASSWORD);
	}

}

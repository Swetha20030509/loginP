package loginPage;
import DataLayer.DataBase;
import model.User;

import com.opensymphony.xwork2.ActionSupport;
public class LoginAction extends ActionSupport {
	
	String Email;
	String password;
	User user;
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String execute() throws ClassNotFoundException 
	    {
			if(DataBase.isAdmin(getEmail(),getPassword()))
			{
				return "ADMIN";
			}
			else
			{
			 user=DataBase.validateUser(getEmail(),getPassword());
			 setUser(user);
				if(user!=null)
	            return SUCCESS;
				else
					return ERROR;
			}
	    }
}

package loginPage;
import datalayer.DataBase;
import model.User;

import com.opensymphony.xwork2.ActionSupport;

import action.Friendrequest;
public class LoginAction extends ActionSupport {
	
	String mobileNo;
	String password;
	User user;
	
	
	public String getMobileNo() {
		return mobileNo;
	}


	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}


	public String execute() throws ClassNotFoundException 
	    {
			
			 user=DataBase.validateUser(getMobileNo(),getPassword());
			 setUser(user);
				if(user!=null)
				{
	            
					
	            return SUCCESS;
				}
				else
				{
					return ERROR;
				}
	    }
}

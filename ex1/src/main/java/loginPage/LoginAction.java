package loginPage;
import DataLayer.DataBase;
import com.opensymphony.xwork2.ActionSupport;
public class LoginAction extends ActionSupport {
	String Email;
	String password;
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
	public String execute() 
	    {
		System.out.println("Heroine");
				Boolean success=DataBase.userExists(getEmail(),getPassword());
				System.out.println("hi");
				if(success)
	            return SUCCESS;
				else
					return ERROR;
	    }
}

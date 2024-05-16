package signupPage;
import DataLayer.DataBase;
import com.opensymphony.xwork2.ActionSupport;
public class SignUpAction extends ActionSupport {
	 private String name;
	    private String password;
	    private String email;
		public void setName(String name) {
			this.name = name;
		}
		public void setPassword(String password) {
			this.password = password;
		}
		public void setEmail(String email) {
			this.email = email;
		}

		public String execute() throws ClassNotFoundException 
	    {
	    	System.out.println(name);
	        boolean success = DataBase.addUser(name, email,password);
	        if (success) {
	        	System.out.println("Signup - Success"+name);
	            return SUCCESS; 
	        } else {
	        	System.out.println("Signup - Username/Email already exists");
	            return ERROR; 
	        }
	    }

}

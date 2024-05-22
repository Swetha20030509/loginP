package Action;

import com.opensymphony.xwork2.ActionSupport;

import DataLayer.DataBase;

public class ProductAction extends ActionSupport{
	private String name;
	private String amount;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String execute()
	{	
		System.out.println(getName());
		System.out.println(getAmount());
		if(DataBase.addProduct(getName(),getAmount()))
		return SUCCESS;
	return ERROR;
	}
}

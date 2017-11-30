package Model;

public class Admin {
	
	private String adminID;
	private String adminPassword;
	private boolean valid;
	public String getAdminID() {
		return adminID;
	}
	public void setAdminID(String adminID) {
		this.adminID = adminID;
	}
	public String getAdminPassword() {
		return adminPassword;
	}
	public void setAdminPassword(String adminPassword) {
		this.adminPassword = adminPassword;
	}
	public boolean isValid() {
		return valid;
	}
	public void setValid(boolean valid) {
		this.valid = valid;
	}
	public Admin(String adminID, String adminPassword, boolean valid) {
		super();
		this.adminID = adminID;
		this.adminPassword = adminPassword;
		this.valid = valid;
	}
	public Admin() {
		super();
	}
	
	
	
	

}

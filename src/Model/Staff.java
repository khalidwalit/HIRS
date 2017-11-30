package Model;

public class Staff {

	private String staffID;
	private String staffAddress;
	private String staffName;
	private String staffPhoneNo;
	private String staffEmail;
	private String staffPassword;




	private boolean valid;
	public String getStaffID() {
		return staffID;
	}
	public void setStaffID(String staffID) {
		this.staffID = staffID;
	}
	public String getStaffPassword() {
		return staffPassword;
	}
	public void setStaffPassword(String staffPassword) {
		this.staffPassword = staffPassword;
	}
	public String getStaffName() {
		return staffName;
	}
	public void setStaffName(String staffName) {
		this.staffName = staffName;
	}
	public String getStaffAddress() {
		return staffAddress;
	}
	public void setStaffAddress(String staffAddress) {
		this.staffAddress = staffAddress;
	}
	public String getStaffEmail() {
		return staffEmail;
	}
	public void setStaffEmail(String staffEmail) {
		this.staffEmail = staffEmail;
	}
	public String getStaffPhoneNo() {
		return staffPhoneNo;
	}
	public void setStaffPhoneNo(String staffPhoneNo) {
		this.staffPhoneNo = staffPhoneNo;
	}
	public boolean isValid() {
		return valid;
	}
	public void setValid(boolean valid) {
		this.valid = valid;
	}
	public Staff(String staffID, String staffAddress, String staffName, String staffPhoneNo, String staffEmail,
			String staffPassword) {
		super();
		this.staffID = staffID;
		this.staffAddress = staffAddress;
		this.staffName = staffName;
		this.staffPhoneNo = staffPhoneNo;
		this.staffEmail = staffEmail;
		this.staffPassword = staffPassword;
		
	}
	public Staff() {
		super();
	}





}

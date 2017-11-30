package Model;

public class Client {

	private String clientID;
	private String clientName;
	private String jobclass;
	private String clientGender;
	private String clientIllness;
	private String smokingStatus;
	private String quitDuration;
	private String monthlypayment;
	private String clientDOB;
	public String getClientID() {
		return clientID;
	}
	public void setClientID(String clientID) {
		this.clientID = clientID;
	}
	public String getClientName() {
		return clientName;
	}
	public void setClientName(String clientName) {
		this.clientName = clientName;
	}
	public String getJobclass() {
		return jobclass;
	}
	public void setJobclass(String jobclass) {
		this.jobclass = jobclass;
	}
	public String getClientGender() {
		return clientGender;
	}
	public void setClientGender(String clientGender) {
		this.clientGender = clientGender;
	}
	public String getClientIllness() {
		return clientIllness;
	}
	public void setClientIllness(String clientIllness) {
		this.clientIllness = clientIllness;
	}
	public String getSmokingStatus() {
		return smokingStatus;
	}
	public void setSmokingStatus(String smokingStatus) {
		this.smokingStatus = smokingStatus;
	}
	public String getQuitDuration() {
		return quitDuration;
	}
	public void setQuitDuration(String quitDuration) {
		this.quitDuration = quitDuration;
	}
	public String getMonthlypayment() {
		return monthlypayment;
	}
	public void setMonthlypayment(String monthlypayment) {
		this.monthlypayment = monthlypayment;
	}
	public String getClientDOB() {
		return clientDOB;
	}
	public void setClientDOB(String clientDOB) {
		this.clientDOB = clientDOB;
	}
	public Client(String clientID, String clientName, String jobclass, String clientGender, String clientIllness,
			String smokingStatus, String quitDuration, String monthlypayment, String clientDOB) {
		super();
		this.clientID = clientID;
		this.clientName = clientName;
		this.jobclass = jobclass;
		this.clientGender = clientGender;
		this.clientIllness = clientIllness;
		this.smokingStatus = smokingStatus;
		this.quitDuration = quitDuration;
		this.monthlypayment = monthlypayment;
		this.clientDOB = clientDOB;
	}
	public Client() {
		super();
	}





}

package Model;

public class ClientIllness {

	private String clientIlnessID;
	private String[] clientIllness;
	
	public String getClientIlnessID() {
		return clientIlnessID;
	}
	public void setClientIlnessID(String clientIlnessID) {
		this.clientIlnessID = clientIlnessID;
	}
	public String[] getClientIllness() {
		return clientIllness;
	}
	public String getClientIllness(int index) {
		return clientIllness[index];
	}
	public void setClientIllness(String[] clientIllness) {
		this.clientIllness = clientIllness;
	}
	
	public ClientIllness(String clientIlnessID, String[] clientIllness) {
		super();
		this.clientIlnessID = clientIlnessID;
		this.clientIllness = clientIllness;
	}
	
	public ClientIllness() {
		super();
	}
	
	
	
	
	
}

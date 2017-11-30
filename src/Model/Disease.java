package Model;

public class Disease {
	
	String diseaseID;
	String diseaseName;
	
	public String getDiseaseID() {
		return diseaseID;
	}
	public void setDiseaseID(String diseaseID) {
		this.diseaseID = diseaseID;
	}
	public String getDiseaseName() {
		return diseaseName;
	}
	public void setDiseaseName(String diseaseName) {
		this.diseaseName = diseaseName;
	}
	public Disease(String diseaseID, String diseaseName) {
		super();
		this.diseaseID = diseaseID;
		this.diseaseName = diseaseName;
	}
	public Disease() {
		super();
	}
	
	
	

}

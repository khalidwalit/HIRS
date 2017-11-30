package Model;

public class Package {
	
	private String packageID;
	private String packageName;
	private String packageType;
	
	public String getPackageID() {
		return packageID;
	}
	public void setPackageID(String packageID) {
		this.packageID = packageID;
	}
	public String getPackageName() {
		return packageName;
	}
	public void setPackageName(String packageName) {
		this.packageName = packageName;
	}
	public String getPackageType() {
		return packageType;
	}
	public void setPackageType(String packageType) {
		this.packageType = packageType;
	}
	public Package(String packageID, String packageName, String packageType) {
		super();
		this.packageID = packageID;
		this.packageName = packageName;
		this.packageType = packageType;
	}
	public Package() {
		super();
	}
	
	
	
}

package Model;

public class Rules {
	
	int ruleno;
	String age;
	String job;
	String smoke;
	String quit;
	String illness;
	String gender;
	String monthlypay;
	String recommend;
	
	
	public int getRuleno() {
		return ruleno;
	}
	public void setRuleno(int ruleno) {
		this.ruleno = ruleno;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getSmoke() {
		return smoke;
	}
	public void setSmoke(String smoke) {
		this.smoke = smoke;
	}
	public String getQuit() {
		return quit;
	}
	public void setQuit(String quit) {
		this.quit = quit;
	}
	public String getIllness() {
		return illness;
	}
	public void setIllness(String illness) {
		this.illness = illness;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getMonthlypay() {
		return monthlypay;
	}
	public void setMonthlypay(String monthlypay) {
		this.monthlypay = monthlypay;
	}
	public String getRecommend() {
		return recommend;
	}
	public void setRecommend(String recommend) {
		this.recommend = recommend;
	}
	public Rules(int ruleno, String age, String job, String smoke, String quit, String illness, String gender,
			String monthlypay, String recommend) {
		super();
		this.ruleno = ruleno;
		this.age = age;
		this.job = job;
		this.smoke = smoke;
		this.quit = quit;
		this.illness = illness;
		this.gender = gender;
		this.monthlypay = monthlypay;
		this.recommend = recommend;
	}
	public Rules() {
		super();
	}
	
	
	
	
	

}

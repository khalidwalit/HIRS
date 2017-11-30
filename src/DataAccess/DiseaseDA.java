package DataAccess;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import DB.DBUtils;
import Model.Disease;
import Model.Package;
import Model.Staff;

public class DiseaseDA {

	public void addDisease(Disease d, Package p){
		String sql="insert into DISEASE values(?, ?, ?, ?)";

		String[] parts = d.getDiseaseName().split(",");
		int size = parts.length;
		String diseaseID = "";
		double d1;
		for(int i=0; i <size;i++){

			for (int y = 1; y <= 5; y++) {
				d1 = Math.random() * 10;
				diseaseID = diseaseID + ((int)d1);
			}

			//System.out.println(diseaseID);

			try{


				PreparedStatement ps = DBUtils.getPreparedStatement(sql);



				ps.setString(1, diseaseID);
				ps.setString(2, parts[i]);
				ps.setString(3, null);
				ps.setString(4, p.getPackageID());

				ps.executeQuery();

				diseaseID = "";

			}catch (ClassNotFoundException | SQLException ex){

				System.out.println("error : "+ex);
				//Logger.getLogger(Customer.class.getName(), null).log(Level.SEVERE, null, ex);

			}
		}
	}


	public static List<Disease> getIllness(){
		List<Disease> ls = new LinkedList<>();

		try {
			ResultSet rs = DBUtils.getPreparedStatement("select * from DISEASE").executeQuery();
			while(rs.next()){
				//System.out.println("testDAS");
				Disease s = new Disease(rs.getString(1),rs.getString(2));

				//System.out.println("View "+  rs.getString(1));
				ls.add(s);
			}
		}catch (ClassNotFoundException | SQLException ex){
			System.out.println("error : "+ex);
			//Logger.getLogger(Customer.class.getName(), null).log(Level.SEVERE, null, ex);

		}


		return ls;
	}

	public static List<Disease> getIllnessByID(String packageID){
		List<Disease> ls = new LinkedList<>();

		try {
			ResultSet rs = DBUtils.getPreparedStatement("select * from DISEASE where packageid = '"+packageID+"'").executeQuery();
			while(rs.next()){
				//System.out.println("testDAS");
				Disease s = new Disease(rs.getString(1),rs.getString(2));

				//System.out.println("View "+  rs.getString(1));
				ls.add(s);
			}
		}catch (ClassNotFoundException | SQLException ex){
			System.out.println("error : "+ex);
			//Logger.getLogger(Customer.class.getName(), null).log(Level.SEVERE, null, ex);

		}


		return ls;
	}

	public void deleteDisease(String packageID){

		String sql="delete disease where packageid =?";
		System.out.println("masuk sini"+sql);
		try{
			PreparedStatement ps = DBUtils.getPreparedStatement(sql);

			ps.setString(1, packageID);

			ps.executeQuery();
		}
		catch (ClassNotFoundException | SQLException ex){

			System.out.println("error : "+ex);
			//Logger.getLogger(Customer.class.getName(), null).log(Level.SEVERE, null, ex);

		}

	}

	public static List<Disease> getDieaseRule(int ruleno){
		List<Disease> ls = new LinkedList<>();
		String sql="select c.packagename, d.diseasename from rules a inner join rulepackage b on b.ruleno = a.ruleno left join package c on c.packageid = b.packageid left join disease d on d.packageid = c.packageid where a.ruleno = '"+ruleno+"'";
		System.out.println(sql);
		try {
			ResultSet rs = DBUtils.getPreparedStatement(sql).executeQuery();
			while(rs.next()){
				//System.out.println("testDAS");
				Disease s = new Disease(rs.getString(1),rs.getString(2));
				
				//System.out.println("View "+  rs.getString(1));
				ls.add(s);
			}
		}catch (ClassNotFoundException | SQLException ex){
			System.out.println("error : "+ex);
			//Logger.getLogger(Customer.class.getName(), null).log(Level.SEVERE, null, ex);

		}


		return ls;
	}
	
	public static List<Disease> getClientDisease(String clientID){
		List<Disease> ls = new LinkedList<>();
		String sql="select c.diseasename from client a inner join clientillness b on b.clientid = a.clientid left join disease c on c.diseaseid = b.diseaseid where a.clientid = '"+clientID+"'";
		System.out.println(sql);
		try {
			ResultSet rs = DBUtils.getPreparedStatement(sql).executeQuery();
			while(rs.next()){
				//System.out.println("testDAS");
				Disease s = new Disease();
				s.setDiseaseName(rs.getString(1));
				
				//System.out.println("View "+  rs.getString(1));
				ls.add(s);
			}
		}catch (ClassNotFoundException | SQLException ex){
			System.out.println("error : "+ex);
			//Logger.getLogger(Customer.class.getName(), null).log(Level.SEVERE, null, ex);

		}


		return ls;
	}
}

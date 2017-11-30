package DataAccess;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import DB.DBUtils;
import Model.Package;
import Model.Staff;
import oracle.jdbc.proxy.annotation.Pre;

public class PackageDA {

	public static List<Package> getAllPackage(){
		List<Package> ls = new LinkedList<>();

		try {
			ResultSet rs = DBUtils.getPreparedStatement("select * from PACKAGE").executeQuery();
			while(rs.next()){
				Package p = new Package(rs.getString(1), rs.getString(2), rs.getString(3));
				System.out.println("View "+  rs.getString(3));
				ls.add(p);
			}
		}catch (ClassNotFoundException | SQLException ex){
			System.out.println("error : "+ex);
			//Logger.getLogger(Customer.class.getName(), null).log(Level.SEVERE, null, ex);

		}


		return ls;
	}

	public static List<Package> getPackageByID(String packageID){
		List<Package> ls = new LinkedList<>();
		String sql="select * from PACKAGE where packageid ='"+packageID+"'";
		System.out.println(sql);
		try {
			ResultSet rs = DBUtils.getPreparedStatement(sql).executeQuery();
			while(rs.next()){
				Package p = new Package(rs.getString(1), rs.getString(2), rs.getString(3));
				System.out.println("View "+  rs.getString(3));
				ls.add(p);
			}
		}catch (ClassNotFoundException | SQLException ex){
			System.out.println("error : "+ex);
			//Logger.getLogger(Customer.class.getName(), null).log(Level.SEVERE, null, ex);

		}


		return ls;
	}

	public static List<Package> getPackageByRule(int ruleNo){
		List<Package> ls = new LinkedList<>();
		String sql="select * from package, rulepackage where package.packageid = rulepackage.packageid(+) and rulepackage.ruleno='"+ruleNo+"'";
		System.out.println(sql);
		try {
			ResultSet rs = DBUtils.getPreparedStatement(sql).executeQuery();
			while(rs.next()){
				Package p = new Package(rs.getString(1), rs.getString(2), rs.getString(3));
				System.out.println("View "+  rs.getString(3));
				ls.add(p);
			}
		}catch (ClassNotFoundException | SQLException ex){
			System.out.println("error : "+ex);
			//Logger.getLogger(Customer.class.getName(), null).log(Level.SEVERE, null, ex);

		}


		return ls;
	}

	public void registerPackage(Package p){
		String sql="insert into PACKAGE values(?, ?, ?)";
		try{
			PreparedStatement ps = DBUtils.getPreparedStatement(sql);

			ps.setString(1, p.getPackageID());
			ps.setString(2, p.getPackageName());
			ps.setString(3, p.getPackageType());

			ps.executeQuery();

		}catch (ClassNotFoundException | SQLException ex){

			System.out.println("error : "+ex);
			//Logger.getLogger(Customer.class.getName(), null).log(Level.SEVERE, null, ex);

		}
	}

	public void regPackBridg(Package p,String username,String staff){
		String sql="insert into PACKAGEBRIDGE values(?, ?, ?)";
		try{
			PreparedStatement ps = DBUtils.getPreparedStatement(sql);

			if(staff!=null){
				ps.setString(1, username);
				ps.setString(2, p.getPackageID());
				ps.setString(3, null);
			}else{
				ps.setString(1, null);
				ps.setString(2, p.getPackageID());
				ps.setString(3, username);
			}
			ps.executeQuery();

		}catch (ClassNotFoundException | SQLException ex){

			System.out.println("error : "+ex);
			//Logger.getLogger(Customer.class.getName(), null).log(Level.SEVERE, null, ex);

		}
	}

	public void deletePackage(String packageID){

		String sql="delete package where packageid =?";
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

	public void deletePackBrid(String packageID){

		String sql="delete packagebridge where packageid =?";
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
	
	public void updatePackage(Package p) throws ClassNotFoundException{
		
		String sql="update package set packagename=?, packagetype=? where packageid=?";
		
		try{
			PreparedStatement ps = DBUtils.getPreparedStatement(sql);
			ps.setString(1, p.getPackageName());
			ps.setString(2, p.getPackageType());
			ps.setString(3, p.getPackageID());
			
			ps.executeQuery();
			DBUtils.closeDB();
		}catch(SQLException e){
			System.out.println("error PACKAGEDA "+e);
		}
		
	}



}

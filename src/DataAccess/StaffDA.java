package DataAccess;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import DB.DBUtils;
import Model.Admin;
import Model.Client;
import Model.Package;
import Model.Rules;
import Model.Staff;

public class StaffDA {

	public void registerStaff(Staff s, String adminId){
		String sql="insert into STAFF values(?, ?, ?, ?, ?, ?, ?)";
		try{
			PreparedStatement ps = DBUtils.getPreparedStatement(sql);

			ps.setString(1, s.getStaffID());
			ps.setString(2, s.getStaffAddress());
			ps.setString(3, s.getStaffName());
			ps.setString(4, s.getStaffPhoneNo());
			ps.setString(5, s.getStaffEmail());
			ps.setString(6, s.getStaffPassword());
			ps.setString(7, adminId);



			ps.executeQuery();

		}catch (ClassNotFoundException | SQLException ex){

			System.out.println("error : "+ex);
			//Logger.getLogger(Customer.class.getName(), null).log(Level.SEVERE, null, ex);

		}
	}


	public static List<Staff> getAllStaff(){
		List<Staff> ls = new LinkedList<>();

		try {
			ResultSet rs = DBUtils.getPreparedStatement("select * from STAFF").executeQuery();
			while(rs.next()){

				Staff s = new Staff(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6));


				ls.add(s);
			}
		}catch (ClassNotFoundException | SQLException ex){
			System.out.println("error : "+ex);
			//Logger.getLogger(Customer.class.getName(), null).log(Level.SEVERE, null, ex);

		}


		return ls;
	}


	public static List<Staff> getStaffByID(String staffID){
		List<Staff> ls = new LinkedList<>();

		try {
			ResultSet rs = DBUtils.getPreparedStatement("select * from STAFF where staffID ='"+staffID+"'").executeQuery();
			while(rs.next()){

				Staff s = new Staff(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6));


				ls.add(s);
			}
		}catch (ClassNotFoundException | SQLException ex){
			System.out.println("error : "+ex);
			//Logger.getLogger(Customer.class.getName(), null).log(Level.SEVERE, null, ex);

		}


		return ls;
	}

	public void deleteStaff(String staffID){

		String sql="delete staff where staffid =?";
		System.out.println("masuk sini"+sql);
		try{
			PreparedStatement ps = DBUtils.getPreparedStatement(sql);

			ps.setString(1, staffID);

			ps.executeQuery();
		}
		catch (ClassNotFoundException | SQLException ex){

			System.out.println("error : "+ex);
			//Logger.getLogger(Customer.class.getName(), null).log(Level.SEVERE, null, ex);

		}

	}

	public static Staff staffLogin(Staff s){


		boolean st = false;
		String sql="select * from staff where staffID = ? and staffPassword = ?";

		try{
			PreparedStatement ps = DBUtils.getPreparedStatement(sql);

			ps.setString(1, s.getStaffID());
			ps.setString(2, s.getStaffPassword());

			ResultSet rs = ps.executeQuery();

			st = rs.next();

			if(!st)
			{
				s.setValid(false);
			}else if(st){
				s.setValid(true);
				s.setStaffID(rs.getString(1));
				s.setStaffName(rs.getString("staffname"));
			}


			DBUtils.closeDB();
		}catch (ClassNotFoundException | SQLException ex){

			System.out.println("error : "+ex);
			//Logger.getLogger(Customer.class.getName(), null).log(Level.SEVERE, null, ex);

		}
		return s;
	}

	public void updateStaff(Staff s) throws ClassNotFoundException{

		String sql="update staff set staffname=?, staffaddress=? ,staffphoneno=?, staffemail=?,staffpassword=? where staffid=?";
		System.out.println(sql);
		try{
			PreparedStatement ps = DBUtils.getPreparedStatement(sql);
			ps.setString(1, s.getStaffName());
			ps.setString(2, s.getStaffAddress());
			ps.setString(3, s.getStaffPhoneNo());
			ps.setString(4, s.getStaffEmail());
			ps.setString(5, s.getStaffPassword());
			ps.setString(6, s.getStaffID());


			ps.executeQuery();
			DBUtils.closeDB();
		}catch(SQLException e){
			System.out.println("error PACKAGEDA "+e);
		}

	}
}

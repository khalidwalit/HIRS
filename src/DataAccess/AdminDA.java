package DataAccess;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import DB.DBUtils;
import Model.Admin;

public class AdminDA {

	public static Admin adminLogin(Admin a){

		
		boolean st = false;
		String sql="select * from admin where adminid = ? and adminpassword = ?";

		try{
			PreparedStatement ps = DBUtils.getPreparedStatement(sql);

			ps.setString(1, a.getAdminID());
			ps.setString(2, a.getAdminPassword());
			
			ResultSet rs = ps.executeQuery();
			
			st = rs.next();
			
			if(!st)
			{
				a.setValid(false);
			}else if(st){
				a.setValid(true);
				a.setAdminID(rs.getString(1));
			}

			
			DBUtils.closeDB();
		}catch (ClassNotFoundException | SQLException ex){

			System.out.println("error : "+ex);
			//Logger.getLogger(Customer.class.getName(), null).log(Level.SEVERE, null, ex);

		}
		return a;
	}

}

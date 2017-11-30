package DataAccess;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Vector;

import DB.DBUtils;
import Model.Client;
import Model.Package;
import Model.Rules;
import Model.Staff;

public class RulesDA {

	public static List<Rules> checkRules(){

		List<Rules> RulesList = new ArrayList<>();
		String sql="select * from RULES";

		System.out.println(sql);
		try{
			ResultSet rs = DBUtils.getPreparedStatement(sql).executeQuery();
			while (rs.next()) {

				Rules r = new Rules();

				r.setRuleno(rs.getInt(1));
				r.setAge(rs.getString(2));
				r.setJob(rs.getString(3));
				r.setSmoke(rs.getString(4));
				r.setQuit(rs.getString(5));
				r.setIllness(rs.getString(6));
				r.setGender(rs.getString(7));
				r.setMonthlypay(rs.getString(8));
				r.setRecommend(rs.getString(9));

				//System.out.println(r.getRuleno());

				RulesList.add(r);

			}
		}catch (ClassNotFoundException | SQLException ex) {
			System.out.println("error : "+ex);
			//Logger.getLogger(Customer.class.getName(), null).log(Level.SEVERE, null, ex);
		}


		return RulesList;
	}

	public static List<Rules> getRuleByNo(String ruleno){
		List<Rules> ls = new LinkedList<>();

		try {
			ResultSet rs = DBUtils.getPreparedStatement("select * from RULES where ruleno='"+ruleno+"'").executeQuery();
			while(rs.next()){

				Rules r = new Rules(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9));


				ls.add(r);
			}
		}catch (ClassNotFoundException | SQLException ex){
			System.out.println("error : "+ex);
			//Logger.getLogger(Customer.class.getName(), null).log(Level.SEVERE, null, ex);

		}


		return ls;
	}

	public static List<Rules> getAllRule(){
		List<Rules> ls = new LinkedList<>();

		try {
			ResultSet rs = DBUtils.getPreparedStatement("select * from RULES").executeQuery();
			while(rs.next()){

				Rules r = new Rules(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9));


				ls.add(r);
			}
		}catch (ClassNotFoundException | SQLException ex){
			System.out.println("error : "+ex);
			//Logger.getLogger(Customer.class.getName(), null).log(Level.SEVERE, null, ex);

		}


		return ls;
	}

	public void createRule(String currentLine){
		String sql="insert into RULES values (?, ?, ?, ?, ?, ?, ?, ?, ?)";

		String[] parts = currentLine.split(";");
		System.out.println("MASUK");

		try{
			PreparedStatement ps = DBUtils.getPreparedStatement(sql);
			System.out.println("BETUL");
			for(int i=0;i<9;i++){



				ps.setString(i+1, parts[i]);

				//System.out.println(i+1 +" DA "+parts[9]);

			}

			ps.executeQuery();

			DBUtils.closeDB();
			System.out.println("\t Closed");
			//errorPS.executeQuery();
		}catch (ClassNotFoundException | SQLException ex){

			System.out.println("error : "+ex);
			try {
				DBUtils.closeDB();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			//Logger.getLogger(Customer.class.getName(), null).log(Level.SEVERE, null, ex);

		}
	}

	public void deleteRule(int ruleNo){
		String sql="delete from rules where ruleno=?";

		try{
			PreparedStatement ps = DBUtils.getPreparedStatement(sql);
			ps.setInt(1, ruleNo);
			System.out.println("delete ruleDA"+ruleNo);

			ps.executeQuery();
			DBUtils.closeDB();

		}catch (ClassNotFoundException | SQLException ex){

			System.out.println("error : "+ex);
			try {
				DBUtils.closeDB();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			//Logger.getLogger(Customer.class.getName(), null).log(Level.SEVERE, null, ex);

		}
	}

	public void updateRule(Rules r) throws ClassNotFoundException{

		String sql="update rules set age=?, jobclass=? ,smokingstatus=?, quitduration=?,illness=?,gender=?,monthlypayment=?, recommend=? where ruleno=?";

		try{
			PreparedStatement ps = DBUtils.getPreparedStatement(sql);
			ps.setString(1, r.getAge());
			ps.setString(2, r.getJob());
			ps.setString(3, r.getSmoke());
			ps.setString(4, r.getQuit());
			ps.setString(5, r.getIllness());
			ps.setString(6, r.getGender());
			ps.setString(7, r.getMonthlypay());
			ps.setString(8, r.getRecommend());
			ps.setInt(9, r.getRuleno());

			ps.executeQuery();
			DBUtils.closeDB();
		}catch(SQLException e){
			System.out.println("error PACKAGEDA "+e);
		}

	}
}

package DataAccess;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;


import com.sun.istack.internal.logging.Logger;

import DB.DBUtils;
import Model.Client;
import Model.Rules;

public class ClientDA {

	public void submitClientPreference(Client c){
		String sql="insert into CLIENT values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try{
			PreparedStatement ps = DBUtils.getPreparedStatement(sql);

			ps.setString(1, c.getClientID());
			ps.setString(2, c.getClientName());
			ps.setString(3, c.getJobclass());
			ps.setString(4, c.getClientGender());
			ps.setDate(5, java.sql.Date.valueOf(c.getClientDOB()));
			ps.setString(6, c.getClientIllness());
			ps.setString(7, c.getSmokingStatus());
			ps.setString(8, c.getQuitDuration());
			ps.setString(9, c.getMonthlypayment());

			ps.executeQuery();

		}catch (ClassNotFoundException | SQLException ex){

			System.out.println("error : "+ex);
			//Logger.getLogger(Customer.class.getName(), null).log(Level.SEVERE, null, ex);

		}
	}

	public static List<Client> getClientByID(String ClientID){

		List<Client> ClientList = new LinkedList<>();
		String sql="select * from CLIENT where CLIENTID = '"+ClientID+"'";

		System.out.println(sql);
		try{
			ResultSet rs = DBUtils.getPreparedStatement(sql).executeQuery();
			while (rs.next()) {

				Client c = new Client();

				DateFormat df = new SimpleDateFormat("yyyy-MM-dd");

				if(rs.getDate("CLIENTDOB")!=null){
					c.setClientDOB(df.format(rs.getDate("CLIENTDOB")));
				}

				System.out.println("TESTING CLIENT DA " +c.getClientDOB());


				c.setClientID(rs.getString(1));
				c.setClientName(rs.getString(2));
				c.setJobclass(rs.getString(3));
				c.setClientGender(rs.getString(4));
				c.setClientIllness(rs.getString(6));
				c.setSmokingStatus(rs.getString(7));
				c.setQuitDuration(rs.getString(8));
				c.setMonthlypayment(rs.getString(9));

				System.out.println(c.getClientID());

				ClientList.add(c);

			}
		}catch (ClassNotFoundException | SQLException ex) {
			System.out.println("error : "+ex);
			//Logger.getLogger(Customer.class.getName(), null).log(Level.SEVERE, null, ex);
		}


		return ClientList;
	}

	public static List<Client> getAllClient(){
		List<Client> ls = new LinkedList<>();

		try {
			ResultSet rs = DBUtils.getPreparedStatement("select * from CLIENT").executeQuery();
			while(rs.next()){
				
				Client c = new Client();
				
				c.setClientID(rs.getString(1));
				c.setClientName(rs.getString(2));
				c.setJobclass(rs.getString(3));
				c.setClientGender(rs.getString(4));
				c.setClientIllness(rs.getString(6));
				c.setSmokingStatus(rs.getString(7));
				c.setQuitDuration(rs.getString(8));
				c.setMonthlypayment(rs.getString(9));
				c.setClientDOB(rs.getString(5));
				
				System.out.println(c.getMonthlypayment());
				ls.add(c);
			}
		}catch (ClassNotFoundException | SQLException ex){
			System.out.println("error : "+ex);
			//Logger.getLogger(Customer.class.getName(), null).log(Level.SEVERE, null, ex);

		}


		return ls;
	}


}

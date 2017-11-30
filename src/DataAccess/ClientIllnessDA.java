package DataAccess;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;

import DB.DBUtils;
import Model.Client;
import Model.ClientIllness;
import Model.Staff;

public class ClientIllnessDA {
	
	public void addClientIllness(ClientIllness cIllness, String clientID){
		
		String sql = "insert into ClientIllness values (IllnessID_SEQ.NEXTVAL, ?, ?)";
		
		String generatedColumns[] = {"IllnessID"};
		
		try{
			PreparedStatement ps = DBUtils.illnessPreparedStatement(sql, generatedColumns);
			
			
			for (int i = 0; i < cIllness.getClientIllness().length; i++) {
				
				System.out.println(cIllness.getClientIllness()[i]);

				//ps.setString(1, cIllness.getClientIlnessID());
				ps.setString(1, cIllness.getClientIllness()[i]);
				ps.setString(2, clientID);
				
				System.out.println(sql);
				
				ps.executeQuery();
				ResultSet rs = ps.getGeneratedKeys();
				rs.next();
				// The generated order id
				long IllnessID = rs.getLong(2);
			}
			
			
			
			
		}catch (ClassNotFoundException | SQLException ex){

			System.out.println("error : "+ex);
			//Logger.getLogger(Customer.class.getName(), null).log(Level.SEVERE, null, ex);

		}
	}
	
	public static List<ClientIllness> getClientIllnessByID(String ClientID){
		
		List<ClientIllness> ClientIllnessList = new LinkedList<>();
		String sql="select * from CLIENTILLNESS where CLIENTID = '"+ClientID+"'";
		
		System.out.println(sql);
		try{
			ResultSet rs = DBUtils.getPreparedStatement(sql).executeQuery();
			while (rs.next()) {
				
			//	ClientIllness c = new ClientIllness(rs.getString(1),rs.getString(2));
				//ClientIllnessList.add(c);
			}
		}catch (ClassNotFoundException | SQLException ex) {
			System.out.println("error : "+ex);
			//Logger.getLogger(Customer.class.getName(), null).log(Level.SEVERE, null, ex);
		}


		return ClientIllnessList;
	}
	
	public void addClientIllness(String clientID,ClientIllness cI){
		String sql="insert into CLIENTILLNESS values(?, ?)";
		try{
			
			
			for (int i=0; i < cI.getClientIllness().length; i++){
				PreparedStatement ps = DBUtils.getPreparedStatement(sql);
				
				ps.setString(1, cI.getClientIllness(i));
				ps.setString(2, clientID);

				System.out.println("DA Illness "+cI.getClientIllness(i));
				ps.executeQuery();
			}
			
			
		}catch (ClassNotFoundException | SQLException ex){

			System.out.println("error : "+ex);
			//Logger.getLogger(Customer.class.getName(), null).log(Level.SEVERE, null, ex);

		}
	}

}

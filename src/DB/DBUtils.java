package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DBUtils {
	
	static String driver = "oracle.jdbc.driver.OracleDriver";
	static String url = "jdbc:oracle:thin:@localhost:1521:xe";
	static String username = "HIRS";
	static String password = "HIRS";
	static Connection conn = null;
	
	public static PreparedStatement getPreparedStatement (String sql) throws ClassNotFoundException, SQLException{
		PreparedStatement ps = null;
		
		Class.forName(driver);
		conn = DriverManager.getConnection(url, username, password);
		
		ps = conn.prepareStatement(sql);
		
		return ps;
		
	}
	
	
	
	public static PreparedStatement illnessPreparedStatement (String sql, String[] generatedColumns) throws ClassNotFoundException, SQLException{
		PreparedStatement ps = null;
				Class.forName(driver);
		conn = DriverManager.getConnection(url, username, password);
		
		ps = conn.prepareStatement(sql);
		return ps;
		
	}
	
	public static void closeDB() throws SQLException
	{
		conn.close();
	}
	
	
}

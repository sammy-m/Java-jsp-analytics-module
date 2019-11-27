
import com.welfare.databaseCon.DbConnect;
import java.sql.*;


public class Try {
	 static Connection conn = null;
	
	static DbConnect connect = new DbConnect();
	
	//Connection conn = connect.getConnection();
	

	//Statement st = conn.createStatement();
	public static void main(String[] args) throws SQLException {
		conn = connect.getConnection();
		Statement st = conn.createStatement();
		String q =  "select * from complaints where id = 3";
		ResultSet rs = st.executeQuery(q);
		rs.next();
		System.out.println(rs.getString("details"));
		
	}
	
	
}

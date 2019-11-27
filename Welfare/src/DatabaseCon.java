
	import java.sql.*;

public class DatabaseCon {


	public static void main(String[] args)throws Exception {
		// TODO Auto-generated method stub
		String url = "jdbc:mysql://localhost:3306/welfarejsp";
		String pass = "Sammy1997*", user ="root";
		String query = "select * from complaints where id = 2";
		
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url,user,pass);
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(query);
		rs.next();
		
		String details = rs.getString("details");
		
		System.out.println(details);
		st.close();
		con.close();
	}

}

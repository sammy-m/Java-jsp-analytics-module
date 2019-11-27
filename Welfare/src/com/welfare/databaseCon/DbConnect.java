package com.welfare.databaseCon;


import java.sql.*;

public class DbConnect {

	public Connection getConnection() {
		// TODO Auto-generated method stub
		String url = "jdbc:mysql://localhost:3306/welfarejsp";
		String pass = "Sammy1997*", user ="root";
		//String query = "select * from complaints where id = 2";
		
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
		Connection con = DriverManager.getConnection(url,user,pass);
		return con;
		}catch(SQLException Ex) {
			System.out.println("Error ocurred: "+Ex);
		}
		/*Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(query);
		rs.next();
		
		String details = rs.getString("details");
		
		System.out.println(details);
		st.close();
		con.close();*/
		return null;
	}
}

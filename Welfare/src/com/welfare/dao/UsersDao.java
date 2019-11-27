package com.welfare.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.json.JSONArray;
import org.json.JSONObject;

import com.welfare.databaseCon.DbConnect;

public class UsersDao {
 
static Connection conn = null;
	
	static DbConnect connect = new DbConnect();
	
	//Connection conn = connect.getConnection();
	

	//Statement st = conn.createStatement();
	public int getTotalUsers() throws SQLException {
		conn = connect.getConnection();
		Statement st = conn.createStatement();
		String q =  "select  COUNT(*) from students";
		ResultSet rs = st.executeQuery(q);
		rs.next();
		int count = rs.getInt("COUNT(*)");
		//System.out.println(count);
		st.close();
		conn.close();
		return count;
		
	}

	public JSONArray getGrowth(String year) throws SQLException {
JSONArray userTrend = new JSONArray();
		
		int[] monthCount = new int[13];
		String[] months = new String[13];
		months[0] = "Null";
		months[1] = "Jan";
		months[2] = "Feb";
		months[3] = "Mar";
		months[4] = "Apr";
		months[5] = "May";
		months[6] = "Jun";
		months[7] = "Jul";
		months[8] = "Aug";
		months[9] = "Sept";
		months[10] = "Oct";
		months[11] = "Nov";
		months[12] = "Dec";
		
		int i = 0;
		for(i =1; i<=12;) {
			monthCount[i]= 0;
			i++;
			
		}
		//System.out.println(year);
		conn = connect.getConnection();
		Statement st =conn.createStatement();
		String q = "select count(*) as counts, MONTH(createdAt) as month FROM students"
				+ " WHERE YEAR(createdAt) = "+year+"  GROUP BY MONTH(createdAt)";
		ResultSet rs = st.executeQuery(q);
		
		while(rs.next()) {
			int j =rs.getInt("month");
			monthCount[j]=rs.getInt("counts");
			
		}
	
		
		for(i =1; i<=12;) {
		JSONObject month =new JSONObject();
			month.put("y", monthCount[i]);
			month.put("label", months[i]);
			userTrend.put(month);
			//System.out.println(months[i]);
			i++;
			
			
		}
			//System.out.println(deptTrend);
			st.close();
			conn.close();
		return userTrend;
	}
	
}

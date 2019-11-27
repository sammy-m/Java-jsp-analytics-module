package com.welfare.reports;
import com.welfare.databaseCon.DbConnect;
import java.sql.*;

import org.json.JSONArray;
import org.json.JSONObject;


public class ComplaintDao {
	 Connection conn = null;
	
	DbConnect connect = new DbConnect();
	
	//Connection conn = connect.getConnection();
	

	//Statement st = conn.createStatement();
	public int getOpenCases() throws SQLException {
		conn = connect.getConnection();
		Statement st = conn.createStatement();
		String q =  "select count(*) from complaints where status = 'inProgress'";
		ResultSet rs = st.executeQuery(q);
		rs.next();
		int totOpen = rs.getInt("count(*)");
		//System.out.println(rs.getString("totOpen"));
		conn.close();
		return totOpen;
		
	}
	
	public int getClosedCases() throws SQLException {
		conn = connect.getConnection();
		Statement st = conn.createStatement();
		String q =  "select count(*) from complaints where status = 'closed'";
		ResultSet rs = st.executeQuery(q);
		rs.next();
		int totClosed = rs.getInt("count(*)");
		//System.out.println(rs.getString("totClosed"));
		conn.close();
		return totClosed;
	}
	
	public JSONObject[] getDepartmentCases(String date, String year) throws SQLException {
		JSONObject[] totalCases= new JSONObject[5];
		conn = connect.getConnection();
		Statement st = conn.createStatement();
		String q =  "select department, count(department) as counts from complaints GROUP BY department ORDER BY counts DESC";
		ResultSet rs = st.executeQuery(q);
		//rs.next();
		int i =1;
		while(rs.next()) {
			totalCases[i] = new JSONObject();
			totalCases[i].put("department"+i, rs.getString("department"));
			totalCases[i].put("cases", rs.getString("counts"));
			i++;
		}
	//System.out.println(totalCases+"hahaha");
		conn.close();
		return totalCases;
}

	public JSONArray getDirectorCases(String month, String year) throws SQLException {
		// TODO Auto-generated method stub
		
		//System.out.println(mm+"value "+mont);
		JSONArray dirCases = new JSONArray();
		conn = connect.getConnection();
		Statement st = conn.createStatement();
		String q = "SELECT count(name) as counts, name from (select complaints.handledBy, directors.name from complaints   inner join directors on complaints.handledBy=directors.Id WHERE YEAR(complaints.createdAt) = "+year+")t group by name ORDER BY counts DESC";
		ResultSet rs = st.executeQuery(q);
		//int i = 0;
		
		while(rs.next()) {
			JSONObject dir = new JSONObject();
			dir.put("label", rs.getString("name"));
			dir.put("y", rs.getInt("counts"));
			dirCases.put(dir);
			//System.out.println(rs.getInt("counts")+" "+ rs.getString("name"));
		}
		//System.out.println(dirCases);
		conn.close();
		return dirCases;
	}
	
	public JSONArray getAllOpenCases() throws SQLException {
		JSONArray casesOpen = new JSONArray();
		conn = connect.getConnection();
		Statement st = conn.createStatement();
		String q = "SELECT department, count(department) as counts from complaints where not(status = 'closed') group by department order by counts DESC";
		ResultSet rs = st.executeQuery(q);
		//int i = 0;
		
		while(rs.next()) {
			JSONObject openCase = new JSONObject();
			openCase.put("label", rs.getString("department"));
			openCase.put("y", rs.getInt("counts"));
			casesOpen.put(openCase);
			//System.out.println(rs.getInt("counts")+" "+ rs.getString("name"));
		}
		//System.out.println(casesOpen);
		conn.close();
		return casesOpen;
	}
	
	public JSONArray getDeptTrend(String year, String dept) throws SQLException {
		JSONArray deptTrend = new JSONArray();
		
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
		String q = "select count(*) as counts, MONTH(createdAt) as month FROM complaints"
				+ " WHERE YEAR(createdAt) = "+year+" and department = '"+dept+"' GROUP BY MONTH(createdAt)";
		ResultSet rs = st.executeQuery(q);
		
		while(rs.next()) {
			int j =rs.getInt("month");
			monthCount[j]=rs.getInt("counts");
			
		}
	
		
		for(i =1; i<=12;) {
		JSONObject month =new JSONObject();
			month.put("y", monthCount[i]);
			month.put("label", months[i]);
			deptTrend.put(month);
			//System.out.println(months[i]);
			i++;
			
			
		}
			//System.out.println(deptTrend);
			st.close();
			conn.close();
		return deptTrend;
	}

	public JSONArray getDailyReport(int day, int month, int year) throws SQLException {
		System.out.println("day is: "+day+"");
		JSONArray dayCases = new JSONArray();
		conn = connect.getConnection();
		Statement st = conn.createStatement();
		String q = "select count(department) as counts, department from complaints where Year(createdAt) = "+year+" and MONTH(createdAt) = "+month+" and Day(createdAt) = "+day+" GROUP BY department";
		ResultSet rs = st.executeQuery(q);
		//System.out.println(q);
		//int i = 0;
		
		while(rs.next()) {
			JSONObject dir = new JSONObject();
			dir.put("label", rs.getString("department"));
			dir.put("y", rs.getInt("counts"));
			dayCases.put(dir);
			//System.out.println(rs.getInt("counts")+" "+ rs.getString("name"));
		}
		//System.out.println(dayCases+" test 1");
		conn.close();
		return dayCases;
	}
}

package com.welfare.reports;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

/**
 * Servlet implementation class GetMonthCases
 */

public class GetMonthCases extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
    public GetMonthCases() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String month = request.getParameter("date");
		String year = request.getParameter("year");
		ComplaintDao monthcase = new ComplaintDao();
		JSONObject[] monthCases = new JSONObject[4];
		JSONArray JsonCases =new JSONArray();
		try {
			 monthCases = monthcase.getDepartmentCases(month, year);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		for(int i = 1;i<5;++i) {
		//System.out.println(monthCases[i].get("cases"));
			JSONObject dept = new JSONObject();
			dept.put("name", monthCases[i].get("department"+i));
			dept.put("cases", monthCases[i].get("cases"));
			JsonCases.put(dept);
		}
		System.out.println(JsonCases);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().print(JsonCases);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

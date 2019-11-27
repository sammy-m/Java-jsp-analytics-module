package com.welfare.reports;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;


import com.welfare.dao.UsersDao;

/**
 * Servlet implementation class GetOpenCases
 */
@WebServlet("/getdata")
public class GetData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetData() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//JSONObject data = new JSONObject();
		String totalUsers="", casesOpen="", solvedCase="";
		ComplaintDao openCases = new ComplaintDao();
		UsersDao totUsers = new UsersDao();
		ComplaintDao solvedCases = new ComplaintDao();
		try {
			 totalUsers = Integer.toString(totUsers.getTotalUsers());
			
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		try {
			 casesOpen = Integer.toString(openCases.getOpenCases());
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			 solvedCase =Integer.toString(solvedCases.getClosedCases());
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//System.out.println("the total users are " + totalUsers+". The total open cases are "+casesOpen+". The total cases closed are"
			//	+solvedCase+".");
		
		JSONObject data = new JSONObject();
		data.put("totalUsers", totalUsers);
		data.put("casesOpen", casesOpen);
		data.put("closedCases", solvedCase);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().print(data);
		//System.out.println(data);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

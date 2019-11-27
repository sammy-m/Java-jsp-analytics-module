<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
response.setHeader("Cache-control", "no-cache,no-store,must-revalidate");
if(session.getAttribute("firstname") != null){
response.sendRedirect("signin.jsp");
}else{

	String reg = (String)session.getAttribute("registrationNumber");

	String det = request.getParameter("text");
	String dep = request.getParameter("select");
	
	

	session.setAttribute("regi", reg);
	session.setAttribute("dep", dep);
	session.setAttribute("text", det);
	response.sendRedirect("compaint");
	
	
}





%>
</body>
</html>
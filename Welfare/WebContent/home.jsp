<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<title>home page</title>
<head>
<meta charset="ISO-8859-1">
  <link rel="stylesheet" type="text/css"href="css/style.css"> 

</head>
<body>
<%
if(session.getAttribute("firstname") == null){
	response.setHeader("Cache-control", "no-cache,no-store,must-revalidate");
}

%>

<h2>${message1 }</h2>
<h2>${message }</h2>


   <nav>
        <p>Welfare</p>
        <ul>
             <li><a href="signin.jsp">Login</a></li>
             <li><a href="signup.jsp">Register</a> </li>
             <li><a href="#">About Welfare</a></li>
             <li><a href="#">Contact</a></li>
            
        </ul>
      
    </nav>
  
   <div class="animation-area">
   <h2> EGERTON STUDENTS WELFARE SERVICES</h2>
  
   </div>
</body>
</html>
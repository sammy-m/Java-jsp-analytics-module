<!DOCTYPE html>
<html>
<title>Card-Hover effect</title>
<head>
   <link rel="stylesheet" type="text/css"href="css/style1.css">
   <link rel="stylesheet" type="text/css"href="css/style.css">
   
   
   
</head>
<body>
<%
response.setHeader("Cache-control", "no-cache,no-store,must-revalidate");
if(session.getAttribute("firstname") == null){
response.sendRedirect("signin.jsp");
}else{

		
}


%>



<h2>${message5 }</h2>
<h2>${message6 }</h2>

<div>


   <nav>
        <p>Welfare</p>
        <ul>
             <li><a href="logout.jsp">Logout</a></li>
             <li><a href="#">Profile</a> </li>
             <li><a href="#">About Welfare</a></li>
             <li><a href="#">Contact</a></li>
             <li>${reg}</li>
            
        </ul>
      
    </nav>
  
    <div class="container">
        <div class="card">
            <div class="face face1">
                <div class="content">
                   <img src="img/edit.png" alt="">
                   <h3>Complaint</h3>
                </div>
            </div>
            <div class="face face2">
                    <div class="content">
                            <form class="form1" action="complaint.jsp"  >
                            <input class="submit" type="submit" name="submit" value="complain">
                            </form>
                      
                            
                             <form class="form1" action="history.jsp" >
                            <input class="submit1" type="submit" name="submit" value="history">
                            </form>
                            
                           
                         </div>
                </div>
        </div>
        <div class="card">
                <div class="face face1">
                    <div class="content">
                       <img src="img/calendar.png" alt="">
                       <h3>Appointment</h3>
                    </div>
                </div>
                <div class="face face2">
                        <div class="content">
                            <form class="form1" >
                            <input class="submit2" type="submit" name="submit" value="Book">
                             </form>
                             
                             <form class="form1" >
                            <input class="submit3" type="submit" name="submit" value="history">
                            </form>
                             </div>
                    </div>
            </div>
            <div class="card">
                    <div class="face face1">
                        <div class="content">
                           <img src="img/man-user.png" alt="">
                           <h3>Profile</h3>
                        </div>
                    </div>
                    <div class="face face2">
                            <div class="content">
                             <form class="form1"  method="post">
                            <input class="submit4" type="submit" name="submit" value="Check">
                             </form>
                             <form class="form1"  method="post">
                            <input class="submit5" type="submit" name="submit" value="Edit">
                            </form>
                            
                                 </div>
                        </div>
                </div>
    </div>
</div>
</body>

</html>
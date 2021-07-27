<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home Page</title>
<link rel="stylesheet" href="style.css"></link>
</head>
<body>
	<%! int id; %>
	<%! int i; %>
	<%! String url,user,pass; %>
	<% 
	url = "jdbc:mysql://localhost/e-learning";
	user = "root";
	pass = "";
	Cookie ck[] = request.getCookies();
    for(i=0;i<ck.length;i++){
        if(ck[i].getName().equals("id")) id = Integer.parseInt(ck[i].getValue());
    }
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url,user,pass);
		PreparedStatement pes = con.prepareStatement("select * from admin where admin_id = ?");
		pes.setInt(1, id);
		ResultSet res = pes.executeQuery();
		res.next();
	%>
	<h2>Homepage</h2>
    <div class="header">
        <li>
            <a href="addCourses.html">Add Courses</a>
        </li>
        <li>
            <a href="viewUsers.jsp">View Users</a>
        </li>
        <li>
        	<a href="viewFeedback.jsp">View Feedback</a>
        </li>
    </div>
    <div class="details">
        <div class="details_header">User Details</div>
        <div class="details_para">
            <div class="para">
                <div class="innerPara left">User Id: </div>
                <div class="innerPara right"><%=res.getString("admin_id")%></div>
            </div>
            <div class="para">
                <div class="innerPara left">Name: </div>
                <div class="innerPara right"><%=res.getString("name")%></div>
            </div>
            <div class="para">
                <div class="innerPara left">Email: </div>
                <div class="innerPara right"><%=res.getString("email")%></div>
            </div>
        </div>
    </div>
    <%
	}catch(Exception E){
		System.out.println("Exception: "+E);
	}
    %>
</body>
</html>
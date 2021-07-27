<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Enrolled Courses</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<h2>Enrolled Courses</h2>
    <div class="header">
        <li><a href="userHomePage.jsp">Your Profile</a></li>
    </div>
    <div class="details">
        <div class="details_header">
            Enrolled Courses
        </div>
        <table>
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Description</th>
                <th>Fees</th>
                <th>Resources</th>
            </tr>
            <%! String id,name,desc,fees,resources; %>
            <%! String url,user,pass; %>
            <%! int user_id; %>
            <%
            url = "jdbc:mysql://localhost/e-learning";
        	user = "root";
        	pass = "";
        	Cookie ck[] = request.getCookies();
        	for(int i=0;i<ck.length;i++){
        		if(ck[i].getName().equals("id")) user_id = Integer.parseInt(ck[i].getValue());
        	}
        	try{
        		Class.forName("com.mysql.jdbc.Driver");
        		Connection con = DriverManager.getConnection(url, user, pass);
        		PreparedStatement pes = con.prepareStatement("SELECT course.course_id,course.c_name,course.c_desp,course.c_fees,course.c_resource FROM user,user_courses,course where user.user_id = ? and user.user_id = user_courses.user_id and course.course_id = user_courses.course_id");
        		pes.setInt(1, user_id);
        		ResultSet res = pes.executeQuery();
        		if(res.next()){
        			res.beforeFirst();
        			while(res.next()){
        				id = res.getString("course_id");
        				name = res.getString("c_name");
        				desc = res.getString("c_desp");
        				fees = res.getString("c_fees");
        				resources = res.getString("c_resource");
    				%>
    				<tr>
    					<td><%=id %></td>
    					<td><%=name %></td>
    					<td><%=desc %></td>
    					<td><%=fees %></td>
    					<td><%=resources %></td>
    				</tr>
    				<%
        			}
        		}
        	}catch(Exception E){
        		System.out.println(E);
        	}
            %>
            <tr></tr>
        </table>
    </div>
</body>
</html>
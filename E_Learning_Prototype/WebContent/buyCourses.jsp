<%@page import="sun.font.CreatedFontTracker"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Course</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<h2>Courses</h2>
    <div class="header">
        <li><a href="userHomePage.jsp">Your Profile</a></li>
        <li><a href="coursesEnrolled.jsp">Courses Enrolled</a></li>
    </div>
    <div class="details">
        <div class="details_header">
            Courses
        </div>
        <table>
            <tr>
                <td>Id</td>
                <td>Name</td>
                <td>Description</td>
                <td>Fees</td>
                <td>Resources</td>
                <td></td>
            </tr>
            <%! String url,user,pass; %>
            <%! String id,name,desp,fees,resource; %>
            <%
            url = "jdbc:mysql://localhost/e-learning";
            user = "root";
            pass = "";
            try{
	            Class.forName("com.mysql.jdbc.Driver");
	            Connection con = DriverManager.getConnection(url,user,pass);
	            Statement stmt = con.createStatement();
	            ResultSet res = stmt.executeQuery("select * from test_course where test_course.course_id not in (select user_courses.course_id from user_courses where user_courses.user_id = 101)");
	            if(res.next()){
	            	res.beforeFirst();
	            	while(res.next()){
	            		id = res.getString("course_id");
	            		name = res.getString("c_name");
	            		desp = res.getString("c_desp");
	            		fees = res.getString("c_fees");
	            		resource = res.getString("c_resource");
	        %>
            		<tr>
	                    <form action="Book" method="get">
	                        <td><%=id%></td>
	                        <input type="hidden" name="course_id" value="<%=id %>">
	                        <td><%=name%></td>
	                        <td><%=desp%></td>
	                        <td><%=fees%></td>
	                        <td><%=resource%></td>
	                        <td><button type="submit">Enroll</button></td>
	                    </form>
	                </tr>
	        <%   		
	            	}
	            }
            }catch(Exception E){
            	System.out.println(E);
            }
            
            %>
        </table>
    </div>
</body>
</html>
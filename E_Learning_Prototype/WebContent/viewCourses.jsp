<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>View Courses</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<h2>View Courses</h2>
    <div class="header">
        <li>
            <a href="adminHomePage.jsp">Your Homepage</a>
        </li>
        <li>
            <a href="adminLogout.jsp">Logout</a>
        </li>
    </div>
    <div class="details">
        <div class="details_header">
            Courses
        </div>
        <table>
            <tr>
                <th>Course Id</th>
                <th>Name</th>
                <th>Description</th>
                <th>Fees</th>
                <th>Resource</th>
            </tr>
            <%! String id,name,desc,fees,resources; %>
            <%! String url,user,pass; %>
            <%! int user_id; %>
            <%
        	Cookie ck[] = request.getCookies();
        	if(ck != null){
        		System.out.println("Entered Enrolled Courses: "+ck);
	        	for(int i=0;i<ck.length;i++){
	        		if(ck[i].getName().equals("id")){
	        			user_id = Integer.parseInt(ck[i].getValue());
	        		}
	        	}
	        	try{
		            url = "jdbc:mysql://localhost/e-learning";
		        	user = "root";
		        	pass = "";
	        		Class.forName("com.mysql.jdbc.Driver");
	        		Connection con = DriverManager.getConnection(url, user, pass);
	        		PreparedStatement pes = con.prepareStatement("select * from test_course");
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
	        		request.setAttribute("message", E.getLocalizedMessage());
	        		request.getRequestDispatcher("exception.jsp").forward(request,response);
	        	}
        	}else{
        		response.sendRedirect("userIndex.html");
        	}
            %>
        </table>
    </div>
</body>
</html>
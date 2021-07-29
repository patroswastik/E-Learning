<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>View Users</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<h2>Students</h2>
    <div class="header">
        <li>
            <a href="adminHomePage.jsp">Homepage</a>
        </li>
        <li>
            <a href="adminLogout.jsp">Logout</a>
        </li>
    </div>
    <div class="details">
        <div class="details_header">
            Students
        </div>
        <table>
            <tr>
                <th>User Id</th>
                <th>Name</th>
                <th>Phone Number</th>
                <th>Email</th>
                <th>Address</th>
                <th>Registration Date</th>
                <th>Password</th>
            </tr>
            <%! String url,user,pass; %>
            <%! String user_id,name,ph_no,email,address,reg_date,password; %>
            <%
            	Cookie ck[] = request.getCookies();
            	if(ck != null){
	            	try{
			            url = "jdbc:mysql://localhost/e-learning";
			        	user = "root";
			        	pass = "";
	            		Class.forName("com.mysql.jdbc.Driver");
	            		Connection con = DriverManager.getConnection(url,user,pass);
	            		Statement stmt = con.createStatement();
	            		ResultSet res = stmt.executeQuery("select * from test_user");
	            		while(res.next()){
	   			%>
				            <tr>
				                <td><%=res.getString("user_id") %></td>
				                <td><%=res.getString("name") %></td>
				                <td><%=res.getString("phone_no") %></td>
				                <td><%=res.getString("email") %></td>
				                <td><%=res.getString("address") %></td>
				                <td><%=res.getString("reg_date") %></td>
				                <td><%=res.getString("password") %></td>
				            </tr>
	            <%
	            		}
	            	}catch(Exception E){
	            		request.setAttribute("message", E.getLocalizedMessage());
		        		request.getRequestDispatcher("exception.jsp").forward(request,response);
	            	}
            	}else{
					response.sendRedirect("adminIndex.html");            		
            	}
            %>
        </table>
    </div>
</body>
</html>
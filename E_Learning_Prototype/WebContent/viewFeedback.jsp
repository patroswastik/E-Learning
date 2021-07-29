<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>View Feedbacks</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<h2>View Feedback</h2>
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
            Feedbacks
        </div>
        <table>
            <tr>
                <th>Feedback Id</th>
                <th>Name</th>
                <th>User Id</th>
                <th>Email</th>
                <th>Feedback</th>
            </tr>
            <%! int time = 0; %>
            <%! String name,email,user_id,fid,feedback; %>
            <%! String url,user,pass; %>
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
	        		ResultSet res = stmt.executeQuery("select * from test_feedback");
	        		while(res.next()){
	        			name = res.getString("name");
	        			email = res.getString("email");
	        			user_id = res.getString("user_id");
	        			fid = res.getString("f_id");
	        			feedback = res.getString("feedback");
	        	%>
	        		<tr>
	        			<td><%=fid %></td>
	        			<td><%=name %></td>
	        			<td><%=email %></td>
	        			<td><%=user_id %></td>
	        			<td><%=feedback %></td>
	        		</tr>
	        	<%
	        		}
	        		stmt.close();
	        		con.close();
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
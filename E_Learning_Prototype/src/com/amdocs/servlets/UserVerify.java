package com.amdocs.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UserVerify")
public class UserVerify extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserVerify() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		String user,username,password,pass,url;
		PrintWriter out = response.getWriter();
		try{
			url = "jdbc:mysql://localhost/e-learning";
	    	username = "root";
	    	password = "";
	        user = request.getParameter("username");
	        pass = request.getParameter("password");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(url,username,password);
            PreparedStatement pes = con.prepareStatement("select * from test_user where email=? and password=?");
            pes.setString(1, user);
            pes.setString(2, pass);
            ResultSet res = pes.executeQuery();
            if(res.next()){
                Cookie ck = new Cookie("id",res.getString("user_id"));
                ck.setMaxAge(60*60);
                response.addCookie(ck);
                response.sendRedirect("userHomePage.jsp");
            }else{
            	out.println("<center>Incorrect Username/Password</center>");
                request.getRequestDispatcher("userIndex.html").include(request, response);
            }
        }catch(Exception e){
        	request.setAttribute("message", e.getLocalizedMessage());
        	request.getRequestDispatcher("exception.jsp").forward(request, response);
        }
	}

}

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

/**
 * Servlet implementation class AddCourse
 */
@WebServlet("/AddCourse")
public class AddCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public AddCourse() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		int id,fees,time=0;
		String name,desc,resources;
		String url,user,password;
		url = "jdbc:mysql://localhost/e-learning";
    	user = "root";
    	password = "";
    	Cookie ck[] = request.getCookies();
    	if(ck != null){    		
    		try {
    			id = Integer.parseInt(request.getParameter("course_id"));
    			name = request.getParameter("c_name");
    			desc = request.getParameter("c_desc");
    			fees = Integer.parseInt(request.getParameter("c_fees"));
    			resources = request.getParameter("c_resources");
    			Class.forName("com.mysql.jdbc.Driver");
    			Connection con = DriverManager.getConnection(url, user, password);
    			PreparedStatement pes = con.prepareStatement("INSERT INTO `test_course` (`course_id`, `c_name`, `c_desp`, `c_fees`, `c_resource`) VALUES (?, ?, ?, ?, ?)");
    			pes.setInt(1, id);
    			pes.setString(2, name);
    			pes.setString(3, desc);
    			pes.setInt(4, fees);
    			pes.setString(5, resources);
    			pes.executeUpdate();
    			request.setAttribute("Message", 1);
    			request.getRequestDispatcher("alert.jsp").forward(request, response);
    		} catch (Exception e) {
    			request.setAttribute("message", e.getLocalizedMessage());
    			request.getRequestDispatcher("exception.jsp").forward(request, response);
    		}
    	}else{
    		response.sendRedirect("adminIndex.html");
    	}
	}

}

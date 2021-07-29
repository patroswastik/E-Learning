package com.amdocs.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;

/**
 * Servlet implementation class Book
 */
@WebServlet("/Book")
public class Book extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public Book() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String user_id=null,course_id;
		Cookie ck[] = request.getCookies();
		if(ck != null){			
			try{
				for(int i=0;i<ck.length;i++){
					if(ck[i].getName().equals("id")) user_id = ck[i].getValue();
				}
				course_id = request.getParameter("course_id");
				String url,user,pass;
				url = "jdbc:mysql://localhost/e-learning";
				user = "root";
				pass = "";
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection(url,user,pass);
				PreparedStatement pes = con.prepareStatement("INSERT INTO `user_courses` (`user_id`, `course_id`) VALUES (?, ?);");
				pes.setInt(1, Integer.parseInt(user_id));
				pes.setInt(2, Integer.parseInt(course_id));
				pes.executeUpdate();
				pes.close();
				con.close();
				response.sendRedirect("userHomePage.jsp");
			}catch(Exception E){
				request.setAttribute("message", E.getLocalizedMessage());
				request.getRequestDispatcher("exception.jsp").forward(request, response);
			}
		}else{
			response.sendRedirect("userIndex.html");
		}
	}

}

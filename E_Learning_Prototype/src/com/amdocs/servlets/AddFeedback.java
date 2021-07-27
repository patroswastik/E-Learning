package com.amdocs.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.io.PrintWriter;

@WebServlet("/AddFeedback")
public class AddFeedback extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public AddFeedback() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String url,user,pass;
		url = "jdbc:mysql://localhost/e-learning";
    	user = "root";
    	pass = "";
    	int id = 0;
    	String name = "",email = "",feedback;
    	Cookie ck[] = request.getCookies();
    	for(int i=0;i<ck.length;i++){
    		if(ck[i].getName().equals("id")) id = Integer.parseInt(ck[i].getValue());
    	}
		try {
			feedback = request.getParameter("feedback");
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url,user,pass);
			PreparedStatement pes = con.prepareStatement("select name,email from user where user_id = ?");
			pes.setInt(1, id);
			ResultSet res = pes.executeQuery();
			if(res.next()){
				name = res.getString("name");
				email = res.getString("email");
			}
			pes = con.prepareStatement("INSERT INTO `test_feedback` (`user_id`, `name`, `email`, `f_id`, `feedback`) VALUES (?, ?, ?, NULL, ?);");
			pes.setInt(1, id);
			pes.setString(2, name);
			pes.setString(3, email);
			pes.setString(4, feedback);
			pes.executeUpdate();
			pes.close();
			con.close();
			response.sendRedirect("userHomePage.jsp");
		} catch (Exception e) {
			System.out.println(e);
		}
	}

}

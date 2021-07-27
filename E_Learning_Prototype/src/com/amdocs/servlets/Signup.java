package com.amdocs.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;

/**
 * Servlet implementation class Signup
 */
@WebServlet("/Signup")
public class Signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public Signup() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String name,email,password,address;
		Date reg_date;
		long phone_number,millis;
		name = request.getParameter("name");
		email = request.getParameter("email");
		password = request.getParameter("password");
		address = request.getParameter("address");
		phone_number = Long.parseLong(request.getParameter("phnumber"));
		DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");
		millis = System.currentTimeMillis();
		reg_date = new Date(millis);
		String user,pass,url;
		user = "root";
		pass = "";
		url = "jdbc:mysql://localhost/e-learning";
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url,user,pass);
            PreparedStatement pes = con.prepareStatement("INSERT INTO `test_user` (`user_id`, `name`, `phone_no`, `email`, `address`, `reg_date`, `password`) VALUES (NULL, ?, ?, ?, ?, ?, ?);");
            pes.setString(1,name);
            pes.setLong(2,phone_number);
            pes.setString(3,email);
            pes.setString(4,address);
            pes.setDate(5, reg_date);
            pes.setString(6, password);
            pes.executeUpdate();
            response.sendRedirect("index.html");
		}catch(Exception E){
			System.out.println("Exception: "+E);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

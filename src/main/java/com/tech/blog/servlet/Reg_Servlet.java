package com.tech.blog.servlet;
 import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class Reg_Servlet
 */
@WebServlet("/Reg_Servlet")
@MultipartConfig
public class Reg_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Reg_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		PrintWriter out = response.getWriter();
		
		
		String check = request.getParameter("check");
		if(check==null)
		{
			out.println("Please agree terms and condition..");
		}
		else
		{
			/// sara data yahin nikalna h
			
			String name = request.getParameter("user_name");
			
			String email = request.getParameter("user_email");
			
			String   password  = request.getParameter("user_password");
				
			String gender = request.getParameter("gender");
			
			String about = request.getParameter("user_about");
			
			
			///cerate user object and set all data to that object
			
			User user = new User(name,email,password,gender, about);
			
			
			///Create the object of user object
			
			UserDao  dao = new UserDao(ConnectionProvider.getConnection());
			
			if(dao.saveUser(user))
			{
				out.println("done");
			}
			
			else
			{
				out.println("error");
			}
			
		}
		
		
	}

}

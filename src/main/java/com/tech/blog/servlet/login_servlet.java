package com.tech.blog.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class login_servlet
 */
@WebServlet("/login_servlet")
public class login_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login_servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//fetch username and password from request
		
		PrintWriter out = response.getWriter();
		
		String user_email = request.getParameter("email");
		String user_password = request.getParameter("password");
		
		UserDao dao =  new UserDao(ConnectionProvider.getConnection());
		
		User u = dao.getUserByEmailAndPassword(user_email,user_password);
		
		if(u==null)
		{
			//login error
			
			//out.println("Invalid details try again..");
			
			Message msg = new Message("Invalid Details ! try with another", "error", "alert-danger");
			
			HttpSession s = request.getSession();
			
			s.setAttribute("msg", msg);
			
			response.sendRedirect("login_page.jsp");
		}
		else {
			//login success
			
			HttpSession s = request.getSession();
			s.setAttribute("currentUser",u);
			response.sendRedirect("profile.jsp");
		}
	}

}

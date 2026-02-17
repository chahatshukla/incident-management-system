package com.company.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * Servlet implementation class logoutServlet
 */
@WebServlet("/logoutServlet")
public class logoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public logoutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		HttpSession currentSession = request.getSession(false);

        if (currentSession != null) {
        	
            currentSession.invalidate();
        }
			response.sendRedirect("login.jsp");
		}
	 @Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        doPost(request, response);
	}
}


package com.company.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import com.company.dao.UserDao;
import com.company.dao.UserDaoImp1;



@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static UserDao userDao = new UserDaoImp1();
	

    public loginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String loginType = request.getParameter("loginType"); // ADMIN / EMPLOYEE

        String dbRole = userDao.getUserRole(username, password);

        if (dbRole == null) {
            response.sendRedirect("login.jsp?error=1");
            return;
        }
         
        if (!dbRole.equals(loginType)) {
            response.sendRedirect("login.jsp?error=roleMismatch");
            return;
        }

        HttpSession session = request.getSession();
        session.setAttribute("username", username);
        session.setAttribute("role", dbRole);

        
        if ("EMPLOYEE".equals(dbRole)) {
            response.sendRedirect("welcome.jsp");   // 
        } else if ("ADMIN".equals(dbRole)) {
            response.sendRedirect("admindashboard.jsp"); // 
        }
    }
}
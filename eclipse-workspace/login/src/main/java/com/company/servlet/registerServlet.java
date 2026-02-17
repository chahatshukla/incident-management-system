package com.company.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.company.dao.User;
import com.company.dao.UserDao;
import com.company.dao.UserDaoImp1;

@WebServlet("/registerServlet")
public class registerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static UserDao userDao = new UserDaoImp1();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");

        User user = new User();
        user.setUsername(username);
        user.setEmail(email);
        user.setPassword(password);

        // 🔥 MOST IMPORTANT LINE
        user.setRole("EMPLOYEE");   // ROLE FIXED HERE

        boolean success = userDao.addUser(user);

        if (success) {
            response.sendRedirect("login.jsp?registration=success");
        } else {
            response.sendRedirect("register.jsp?error=1");
        }
    }
}

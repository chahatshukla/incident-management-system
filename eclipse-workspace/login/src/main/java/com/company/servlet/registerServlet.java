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

        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();
        String email = request.getParameter("email").trim();
        

     // 🔥 STEP 1: Username Validation
     if (username.isEmpty()) {
         request.setAttribute("error", "Username cannot be empty or spaces only");
         request.getRequestDispatcher("register.jsp")
                .forward(request, response);
         return;
     }

     // 🔥 STEP 2: Password Validation
     if (password.length() < 8 ||
         !password.matches(".*[A-Z].*") ||
         !password.matches(".*[a-z].*") ||
         !password.matches(".*\\d.*")) {

        

         request.getRequestDispatcher("register.jsp")
                .forward(request, response);
         return;
     }

     // 🔥 STEP 3: Duplicate Username Check
     if (userDao.isUsernameExists(username)) {

         request.setAttribute("error", "Username already exists");
         request.getRequestDispatcher("register.jsp")
                .forward(request, response);
         return;
     }

        // 🔥 STEP 1: Duplicate Username Check
        if (userDao.isUsernameExists(username)) {

            request.setAttribute("error", "Username already exists");
            request.getRequestDispatcher("register.jsp")
                   .forward(request, response);
            return;
        }

        // STEP 2: Create User Object
        User user = new User();
        user.setUsername(username);
        user.setEmail(email);
        user.setPassword(password);
        user.setRole("EMPLOYEE");

        boolean success = userDao.addUser(user);

        if (success) {
            response.sendRedirect("login.jsp?registration=success");
        } else {
            request.setAttribute("error", "Registration Failed");
            request.getRequestDispatcher("register.jsp")
                   .forward(request, response);
        }
    }
}
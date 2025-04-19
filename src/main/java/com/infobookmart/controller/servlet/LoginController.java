package com.infobookmart.controller.servlet;


import com.infobookmart.controller.dao.UserDAO;
import com.infobookmart.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/LogInController")
public class LoginController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("login_garda_deko_email");
        String password = request.getParameter("login_garda_deko_password");

        UserDAO userDAO = new UserDAO();
        User user = userDAO.loginUser(email, password);

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("currentUser", user);
            if ("admin".equalsIgnoreCase(user.getRole())) {
                response.sendRedirect("pages/admin/dashboard.jsp");
            } else {
                response.sendRedirect("pages/home.jsp");
            }
        } else {
            request.setAttribute("errorMessage", "Invalid email or password.");
            request.getRequestDispatcher("pages/login.jsp").forward(request, response);
        }
    }
}

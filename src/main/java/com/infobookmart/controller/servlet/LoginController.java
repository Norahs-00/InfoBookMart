package com.infobookmart.controller.servlet;

import com.infobookmart.controller.dao.UserDAO;
import com.infobookmart.model.User;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

public class LoginController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email    = request.getParameter("login_garda_deko_email");
        String password = request.getParameter("login_garda_deko_password");

        UserDAO userDAO = new UserDAO();
        User user       = userDAO.loginUser(email, password);
        HttpSession session = request.getSession();

        if (user != null) {
            session.setAttribute("currentUser", user);
            session.removeAttribute("loginFailCount");

            // role‐based redirection
            if ("admin".equalsIgnoreCase(user.getRole())) {
                response.sendRedirect(request.getContextPath() + "/pages/dashboard.jsp");
            } else {
                response.sendRedirect(request.getContextPath() + "/pages/home.jsp");
            }
        } else {
            // increment fail count
            Integer fails = (Integer) session.getAttribute("loginFailCount");
            fails = (fails == null ? 1 : fails + 1);
            session.setAttribute("loginFailCount", fails);

            String msg = "Invalid email or password.";
            if (fails >= 3) {
                msg += " Don’t have an account? Please sign up.";
            }
            request.setAttribute("errorMessage", msg);

            // forward back to login form
            request.getRequestDispatcher("/pages/login.jsp")
                   .forward(request, response);
        }
    }

    // if someone GETs "/login", just show the login page
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/pages/login.jsp")
               .forward(request, response);
    }
}

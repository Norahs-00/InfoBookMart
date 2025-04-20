package com.infobookmart.controller.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/LogoutController")
public class LogoutController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false); // Don’t create if doesn't exist
        if (session != null) {
            session.invalidate(); // End the session
        }
        response.sendRedirect("pages/login.jsp");
    }
}

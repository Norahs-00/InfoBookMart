package com.infobookmart.controller.servlet;

import com.infobookmart.controller.dao.AdminUserDAO;
import com.infobookmart.model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet("/admin/user")
public class AdminUserController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            if ("delete".equals(action)) {
                int userId = Integer.parseInt(request.getParameter("userId"));
                AdminUserDAO.deleteUser(userId);
                response.sendRedirect("user?action=list");

            } else if ("edit".equals(action)) {
                int userId = Integer.parseInt(request.getParameter("userId"));
                User user = AdminUserDAO.getUserById(userId);
                request.setAttribute("u", user);
                RequestDispatcher rd = request.getRequestDispatcher("/pages/updateUser.jsp");
                rd.forward(request, response);

            } else {
                List<User> userList = AdminUserDAO.getAllUsers();
                request.setAttribute("userList", userList);
                RequestDispatcher rd = request.getRequestDispatcher("/pages/manageUsers.jsp");
                rd.forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("user?action=list");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            User user = extractUserFromRequest(request);
            if ("update".equals(action)) {
                user.setUserId(Integer.parseInt(request.getParameter("userId")));
                AdminUserDAO.updateUser(user);
            } else {
                user.setRegisterDate(new Date());
                AdminUserDAO.addUser(user);
            }
            response.sendRedirect("user?action=list");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("user?action=list");
        }
    }

    private User extractUserFromRequest(HttpServletRequest request) throws Exception {
        User user = new User();
        user.setEmail(request.getParameter("email"));
        user.setFirstName(request.getParameter("firstName"));
        user.setLastName(request.getParameter("lastName"));
        user.setUserName(request.getParameter("userName"));
        user.setPassword(request.getParameter("password"));
        user.setRole(request.getParameter("role"));
        user.setAccountStatus(request.getParameter("accountStatus"));
        user.setProfileImg(request.getParameter("profileImg"));
        user.setContactNo(request.getParameter("contactNo"));
        user.setGender(request.getParameter("gender"));
        user.setAddress(request.getParameter("address"));
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        user.setDateOfBirth(sdf.parse(request.getParameter("dateOfBirth")));
        return user;
    }
}
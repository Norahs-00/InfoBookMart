package com.infobookmart.controller.servlet;


import com.infobookmart.controller.dao.UserDAO;
import com.infobookmart.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/RegisterController")
@MultipartConfig
public class RegisterController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = new User();

        user.setFirstName(request.getParameter("firstName"));
        user.setLastName(request.getParameter("lastName"));
        user.setEmail(request.getParameter("email"));
        user.setUserName(request.getParameter("userName"));
        user.setContactNo(request.getParameter("contactNo"));
        user.setAddress(request.getParameter("address"));
        user.setGender(request.getParameter("gender"));
        user.setRole("customer");
        user.setAccountStatus("active");

        try {
            Date dob = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("dateOfBirth"));
            user.setDateOfBirth(dob);
        } catch (Exception e) {
            e.printStackTrace();
        }

        user.setRegisterDate(new Date());
        user.setPassword(request.getParameter("password"));

        // Handle file upload
        Part filePart = request.getPart("profileImg");
        String fileName = new File(filePart.getSubmittedFileName()).getName();
        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";

        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();

        String filePath = uploadPath + File.separator + fileName;
        filePart.write(filePath);
        user.setProfileImg("uploads/" + fileName);

        UserDAO userDAO = new UserDAO();
        boolean registered = userDAO.registerUser(user);

        if (registered) {
            response.sendRedirect("pages/login.jsp");
        } else {
            request.setAttribute("errorMessage", "Registration failed. Try again.");
            request.getRequestDispatcher("pages/register.jsp").forward(request, response);
        }
    }
}

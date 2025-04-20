package com.infobookmart.controller.servlet;

import com.infobookmart.controller.dao.UserDAO;
import com.infobookmart.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@MultipartConfig
public class RegisterController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String email        = request.getParameter("email");
        String password     = request.getParameter("password");
        String confirmPass  = request.getParameter("confirmPassword");

        // 1) Confirm‐password match
        if (!password.equals(confirmPass)) {
            request.setAttribute("errorMessage", "Passwords do not match.");
            request.getRequestDispatcher("/pages/register.jsp")
                   .forward(request, response);
            return;
        }

        UserDAO dao = new UserDAO();

        // 2) Email already in use?
        if (dao.emailExists(email)) {
            request.setAttribute("errorMessage", 
                "An account with that email already exists. Please log in.");
            request.setAttribute("showLoginLink", true);
            request.getRequestDispatcher("/pages/register.jsp")
                   .forward(request, response);
            return;
        }

        // 3) Build new user
        User user = new User();
        user.setFirstName( request.getParameter("firstName") );
        user.setLastName(  request.getParameter("lastName") );
        user.setEmail(     email );
        user.setUserName(  request.getParameter("userName") );
        user.setContactNo( request.getParameter("contactNo") );
        user.setAddress(   request.getParameter("address") );
        user.setGender(    request.getParameter("gender") );
        user.setRole("customer");
        user.setAccountStatus("active");

        try {
            Date dob = new SimpleDateFormat("yyyy-MM-dd")
                           .parse(request.getParameter("dateOfBirth"));
            user.setDateOfBirth(dob);
        } catch (Exception ignore) { }

        user.setRegisterDate(new Date());
        user.setPassword(password);

        // file‐upload
        Part filePart = request.getPart("profileImg");
        String fileName = new File(filePart.getSubmittedFileName()).getName();
        String uploadPath = getServletContext().getRealPath("") 
                          + File.separator + "uploads";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdirs();
        String filePath = uploadPath + File.separator + fileName;
        filePart.write(filePath);
        user.setProfileImg("uploads/" + fileName);

        // 4) Save
        boolean ok = dao.registerUser(user);
        if (ok) {
            // on success → homepage
            response.sendRedirect(request.getContextPath() + "/pages/home.jsp");
        } else {
            request.setAttribute("errorMessage", "Registration failed. Try again.");
            request.getRequestDispatcher("/pages/register.jsp")
                   .forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/pages/register.jsp").forward(request, response);
    }
}

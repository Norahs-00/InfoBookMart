package com.infobookmart.controller.servlet;

import com.infobookmart.controller.dao.UserDAO;
import com.infobookmart.model.User;
import java.sql.Date; // Add at the top


import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

@WebServlet("/UpdateProfileServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, // 1MB
                 maxFileSize = 5 * 1024 * 1024,    // 5MB
                 maxRequestSize = 10 * 1024 * 1024) // 10MB
public class UpdateProfileServlet extends HttpServlet {

    private static final String UPLOAD_DIR = "asset/images";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("currentUser");

        if (currentUser == null) {
            response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
            return;
        }

        // Get form fields
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String userName = request.getParameter("userName");
        String email = request.getParameter("email");
        String dob = request.getParameter("dob");
        String contactNo = request.getParameter("contactNo");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");

        // Handle profile image upload
        Part filePart = request.getPart("profileImg");
        String fileName = null;

        if (filePart != null && filePart.getSize() > 0) {
            fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String appPath = request.getServletContext().getRealPath("");
            String uploadPath = appPath + File.separator + UPLOAD_DIR;

            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdirs();

            // Save the file on server
            filePart.write(uploadPath + File.separator + fileName);
        }

        // Update user object
        currentUser.setFirstName(firstName);
        currentUser.setLastName(lastName);
        currentUser.setUserName(userName);
        currentUser.setEmail(email);
        currentUser.setDateOfBirth(Date.valueOf(dob));
        currentUser.setContactNo(contactNo);
        currentUser.setGender(gender);
        currentUser.setAddress(address);

        if (fileName != null) {
            currentUser.setProfileImg(fileName); // Save only file name
        }

        // Update in database
        UserDAO userDAO = new UserDAO();
        boolean updated = userDAO.updateUser(currentUser);

        if (updated) {
            session.setAttribute("currentUser", currentUser); // Refresh session
            response.sendRedirect(request.getContextPath() + "/pages/userprofile.jsp");
        } else {
            request.setAttribute("errorMessage", "Failed to update profile.");
            request.getRequestDispatcher("/pages/editProfile.jsp").forward(request, response);
        }
    }
}
package com.infobookmart.controller.servlet;
import com.infobookmart.controller.dao.CartDAO;
import com.infobookmart.model.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
@WebServlet("/addToCart")
public class AddToCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Getting sessions and users
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("currentUser");
        if (currentUser == null) {
            response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
            return;
        }
        int userId = currentUser.getUserId();
        System.out.println(userId);
        int bookId = Integer.parseInt(request.getParameter("bookId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        try {
            CartDAO cartDAO = new CartDAO();
            // Creating cart if the user who logged in doesn't have an active cart
            int cartId = cartDAO.getOrCreateCartId(userId);
            // Checking if product already exists
            if (cartDAO.isBookInCart(cartId, bookId)) {
                cartDAO.updateCartItem(cartId, bookId, quantity);
                session.setAttribute("message", "Book quantity updated in cart!");
            } else {
                cartDAO.insertCartItem(cartId, bookId, quantity);
                session.setAttribute("message", "Book successfully added to cart!");
            }
            
            // Update the count in the nav bar - using cartCount instead of cart_count for consistency
            int totalItems = cartDAO.getCartItemCount(userId);
            session.setAttribute("cartCount", totalItems);
            
            // Redirect back to the referring page or the login page if no referrer is found
            String referer = request.getHeader("referer");
            response.sendRedirect(referer != null ? referer : request.getContextPath()+"/pages/login.jsp");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            session.setAttribute("error", "Failed to add book to cart: " + e.getMessage());
            // response.sendRedirect(request.getContextPath()+"/pages/ErrorPage.jsp");
        }
    }
}
package com.infobookmart.controller.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.infobookmart.controller.dao.OrderDAO;
import com.infobookmart.model.Order;
import com.infobookmart.controller.dao.CartDAO;
import com.infobookmart.model.CartItem;
import com.infobookmart.model.User;

/**
 * Servlet implementation class ViewCartServlet
 */

@WebServlet("/ViewCartServlet")
public class ViewCartServlet extends HttpServlet {
  
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


		HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("currentUser");

        if (currentUser == null) {
            response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
            return;
        }

        int userId = currentUser.getUserId();

        try {
            CartDAO cartDAO = new CartDAO();
            OrderDAO orderDAO = new OrderDAO();
            
            List<CartItem> cartItems = cartDAO.getCartItem(userId);
            request.setAttribute("cartItems", cartItems);
            
            int totalItems = cartDAO.getCartItemCount(userId);
            session.setAttribute("cartCount", totalItems);
            
            List<Order> orders = orderDAO.getOrdersForUser(userId);
            request.setAttribute("orders", orders);

//            OrderDAO orderDAO = new OrderDAO();
//            List<Order> orders = orderDAO.getOrdersForUser(userId);
//            request.setAttribute("orders", orders);
//
            request.getRequestDispatcher("/pages/cart.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
//            response.sendRedirect(request.getContextPath()+"/pages/ErrorPage.jsp");
        }
    }
}

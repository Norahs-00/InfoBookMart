package com.infobookmart.controller.servlet;

import com.infobookmart.controller.dao.BookDAO;

import com.infobookmart.model.Book;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/searchBook")
public class SearchBookServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String keyword = request.getParameter("keyword");
        System.out.println("Keyword received: " + keyword); 
        
        BookDAO bookDAO = new BookDAO();
        List<Book> books = bookDAO.searchBooks(keyword);

        request.setAttribute("books", books);
        request.setAttribute("keyword", keyword);
        request.getRequestDispatcher("/pages/searchResults.jsp").forward(request, response);
    }
}
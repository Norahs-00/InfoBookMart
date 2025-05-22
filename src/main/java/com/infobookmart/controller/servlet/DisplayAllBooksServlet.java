package com.infobookmart.controller.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.infobookmart.controller.dao.BookDAO;
import com.infobookmart.model.Book;

/**
 * Servlet implementation class DisplayAllBooksServlet
 */
@WebServlet("/DisplayAllBooksServlet")
public class DisplayAllBooksServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DisplayAllBooksServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Book> allBooks = BookDAO.displayAllBooks(); // DAO method
        request.setAttribute("allBooks", allBooks);
        request.getRequestDispatcher("/pages/books.jsp").forward(request, response);
    }

}
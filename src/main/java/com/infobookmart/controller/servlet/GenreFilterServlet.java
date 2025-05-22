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
 * Servlet implementation class GenreFilterServlet
 */
@WebServlet("/GenreFilterServlet")
public class GenreFilterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GenreFilterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String genreIdStr = request.getParameter("genreId");

        if (genreIdStr != null) {
            try {
                int genreId = Integer.parseInt(genreIdStr);
                List<Book> books = BookDAO.getBooksByGenre(genreId);

                request.setAttribute("filteredBooks", books);  // send to JSP
                request.setAttribute("selectedGenreId", genreId);
                request.getRequestDispatcher("pages/books.jsp").forward(request, response);
            } catch (NumberFormatException e) {
                e.printStackTrace();
                response.sendRedirect("books.jsp"); // fallback
            }
        } else {
            response.sendRedirect("books.jsp"); // fallback
        }
    }
}
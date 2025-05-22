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
 * Servlet implementation class SelectGenreServlet
 */
@WebServlet("/SelectGenreServlet")
public class SelectGenreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectGenreServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String genreIdStr = request.getParameter("id");
        int genreId = Integer.parseInt(genreIdStr);

        String genreName = BookDAO.getGenreNameById(genreId);
        
        List<Book> booksByGenre = BookDAO.getBooksByGenre(genreId);
        request.setAttribute("books", booksByGenre);
        request.setAttribute("genreName", genreName);

        request.getRequestDispatcher("/pages/genre.jsp").forward(request, response);
    }
}
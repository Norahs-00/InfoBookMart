package com.infobookmart.controller.servlet;

import com.infobookmart.controller.dao.AdminBookDAO;

import com.infobookmart.model.AdminBook;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/book")
public class AdminBookController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            if ("delete".equals(action)) {
                int bookId = Integer.parseInt(request.getParameter("bookId"));
                AdminBookDAO.deleteBook(bookId);
                response.sendRedirect("book?action=list");

            } else if ("edit".equals(action)) {
                int bookId = Integer.parseInt(request.getParameter("bookId"));
                AdminBook book = AdminBookDAO.getBookById(bookId);
                request.setAttribute("b", book);
                RequestDispatcher rd = request.getRequestDispatcher("/pages/updateBook.jsp");
                rd.forward(request, response);

            } else if ("viewAll".equals(action)) {
                List<AdminBook> bookList = AdminBookDAO.getAllBooks();
                request.setAttribute("bookList", bookList);
                RequestDispatcher rd = request.getRequestDispatcher("/pages/viewBooks.jsp");
                rd.forward(request, response);

            } else {
                // Default action: List books in manageBooks.jsp
                List<AdminBook> bookList = AdminBookDAO.getAllBooks();
                request.setAttribute("bookList", bookList);
                RequestDispatcher rd = request.getRequestDispatcher("/pages/manageBooks.jsp");
                rd.forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("book?action=list");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            if ("insert".equals(action)) {
                AdminBook book = extractBookFromRequest(request);
                AdminBookDAO.addBook(book);
                response.sendRedirect("book?action=list");

            } else if ("update".equals(action)) {
                AdminBook book = extractBookFromRequest(request);
                book.setBookId(Integer.parseInt(request.getParameter("bookId")));
                AdminBookDAO.updateBook(book);
                response.sendRedirect("book?action=list");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("book?action=list");
        }
    }

    private AdminBook extractBookFromRequest(HttpServletRequest request) {
        AdminBook book = new AdminBook();
        book.setTitle(request.getParameter("title"));
        book.setAuthor(request.getParameter("author"));
        book.setLanguage(request.getParameter("language"));
        book.setPublishedYear(Integer.parseInt(request.getParameter("publishedYear")));
        book.setIsbn(request.getParameter("isbn"));
        book.setBookQuantity(Integer.parseInt(request.getParameter("bookQuantity")));
        book.setBookImage(request.getParameter("bookImage"));
        book.setEdition(request.getParameter("edition"));
        book.setGenreId(Integer.parseInt(request.getParameter("genreId")));
        book.setDescription(request.getParameter("description"));
        book.setPrice(Integer.parseInt(request.getParameter("price")));
        return book;
    }
}
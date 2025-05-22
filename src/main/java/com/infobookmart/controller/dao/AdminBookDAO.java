package com.infobookmart.controller.dao;

import com.infobookmart.model.AdminBook;
import com.infobookmart.controller.database.DatabaseConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AdminBookDAO {
    
    // Add Book
    public static int addBook(AdminBook book) {
        int status = 0;
        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "INSERT INTO books (title, author, language, publishedYear, isbn, bookQuantity, bookImage, edition, genreId, description, price) VALUES (?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, book.getTitle());
            ps.setString(2, book.getAuthor());
            ps.setString(3, book.getLanguage());
            ps.setInt(4, book.getPublishedYear());
            ps.setString(5, book.getIsbn());
            ps.setInt(6, book.getBookQuantity());
            ps.setString(7, book.getBookImage());
            ps.setString(8, book.getEdition());
            ps.setInt(9, book.getGenreId());
            ps.setString(10, book.getDescription());
            ps.setDouble(11, book.getPrice());
            status = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    // Get All Books
    public static List<AdminBook> getAllBooks() {
        List<AdminBook> books = new ArrayList<>();
        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "SELECT * FROM books";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                AdminBook book = new AdminBook();
                book.setBookId(rs.getInt("bookId"));
                book.setTitle(rs.getString("title"));
                book.setAuthor(rs.getString("author"));
                book.setLanguage(rs.getString("language"));
                book.setPublishedYear(rs.getInt("publishedYear"));
                book.setIsbn(rs.getString("isbn"));
                book.setBookQuantity(rs.getInt("bookQuantity"));
                book.setBookImage(rs.getString("bookImage"));
                book.setEdition(rs.getString("edition"));
                book.setGenreId(rs.getInt("genreId"));
                book.setDescription(rs.getString("description"));
                book.setPrice(rs.getInt("price"));
                books.add(book);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return books;
    }

    // Get Book by Id
    public static AdminBook getBookById(int id) {
        AdminBook book = null;
        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "SELECT * FROM books WHERE bookId=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                book = new AdminBook();
                book.setBookId(rs.getInt("bookId"));
                book.setTitle(rs.getString("title"));
                book.setAuthor(rs.getString("author"));
                book.setLanguage(rs.getString("language"));
                book.setPublishedYear(rs.getInt("publishedYear"));
                book.setIsbn(rs.getString("isbn"));
                book.setBookQuantity(rs.getInt("bookQuantity"));
                book.setBookImage(rs.getString("bookImage"));
                book.setEdition(rs.getString("edition"));
                book.setGenreId(rs.getInt("genreId"));
                book.setDescription(rs.getString("description"));
                book.setPrice(rs.getInt("price"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return book;
    }

    // Update Book
    public static int updateBook(AdminBook book) {
        int status = 0;
        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "UPDATE books SET title=?, author=?, language=?, publishedYear=?, isbn=?, bookQuantity=?, bookImage=?, edition=?, genreId=?, description=?, price=? WHERE bookId=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, book.getTitle());
            ps.setString(2, book.getAuthor());
            ps.setString(3, book.getLanguage());
            ps.setInt(4, book.getPublishedYear());
            ps.setString(5, book.getIsbn());
            ps.setInt(6, book.getBookQuantity());
            ps.setString(7, book.getBookImage());
            ps.setString(8, book.getEdition());
            ps.setInt(9, book.getGenreId());
            ps.setString(10, book.getDescription());
            ps.setDouble(11, book.getPrice());
            ps.setInt(12, book.getBookId());
            status = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    // Delete Book
    public static int deleteBook(int id) {
        int status = 0;
        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "DELETE FROM books WHERE bookId=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            status = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
}
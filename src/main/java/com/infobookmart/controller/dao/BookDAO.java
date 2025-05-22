package com.infobookmart.controller.dao;

import com.infobookmart.controller.database.DatabaseConnection;

import com.infobookmart.model.Book;
import com.infobookmart.model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookDAO {
	
	public static List<Book> displayAllBooks(){
		List<Book> books = new ArrayList<>();
        String sql = "SELECT * FROM Books";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
        	
	            ResultSet rs = stmt.executeQuery();
	
	            while (rs.next()) {
	            	Book book = new Book();
	                book.setBookId(rs.getInt("bookId"));
	                book.setTitle(rs.getString("title"));
	                book.setAuthor(rs.getString("author"));
	                book.setGenreId(rs.getInt("genreId"));
	                book.setDescription(rs.getString("description"));
	                book.setPrice(rs.getInt("price"));
	                book.setBookImage(rs.getString("bookImage"));
	                books.add(book);

	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		return books;
	}

    public List<Book> searchBooks(String keyword) { //keyword takes values like title,author or genre and returns list of book
        List<Book> books = new ArrayList<>();
        String sql = "SELECT b.bookId, b.title, b.author, b.description, b.price, b.bookImage, b.genreId, g.genreName AS genre " +
                "FROM Books b JOIN Genre g ON b.genreId = g.genreId " +
                "WHERE LOWER(b.title) LIKE LOWER(?) OR LOWER(b.author) LIKE LOWER(?) OR LOWER(g.genreName) LIKE LOWER(?)";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            String searchTerm = "%" + keyword.toLowerCase() + "%";
            //sets searchTerm as title, author or genre
            stmt.setString(1, searchTerm);
            stmt.setString(2, searchTerm);
            stmt.setString(3, searchTerm);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Book book = new Book();
                book.setBookId(rs.getInt("bookId"));
                book.setTitle(rs.getString("title"));
                book.setAuthor(rs.getString("author"));
                book.setGenreId(rs.getInt("genreId"));
                book.setDescription(rs.getString("description"));
                book.setPrice(rs.getInt("price"));
                book.setBookImage(rs.getString("bookImage"));
                books.add(book);
                //System.out.println("Found row: " + rs.getString("title"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return books;
    }
    
    public static List<Book> getBooksByGenre(int genreId) {
        List<Book> books = new ArrayList<>();
        String sql = "SELECT bookId, title, author, genreId, description, price, bookImage FROM books WHERE genreId = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)){
           
        	stmt.setInt(1, genreId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
            	Book book = new Book();
                book.setBookId(rs.getInt("bookId"));
                book.setTitle(rs.getString("title"));
                book.setAuthor(rs.getString("author"));
                book.setGenreId(rs.getInt("genreId"));
                book.setDescription(rs.getString("description"));
                book.setPrice(rs.getInt("price"));
                book.setBookImage(rs.getString("bookImage"));
                books.add(book);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return books;
    }
    
    public static String getGenreNameById(int genreId) {
        String genreName = "";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement("SELECT genreName FROM Genre WHERE genreId = ?")) {
            stmt.setInt(1, genreId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                genreName = rs.getString("genreName");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return genreName;
    }



	public boolean updateUser(User user) {
	
	    String sql = "UPDATE users SET firstName = ?, lastName = ?, userName = ?, email = ?, " +
	                 "dateOfBirth = ?, contactNo = ?, gender = ?, address = ?, profileImg = ? WHERE userId = ?";
	
	    try (Connection conn = DatabaseConnection.getConnection();
	
	         PreparedStatement stmt = conn.prepareStatement(sql)) {
	
	        stmt.setString(1, user.getFirstName());
	        stmt.setString(2, user.getLastName());
	        stmt.setString(3, user.getUserName());
	        stmt.setString(4, user.getEmail());
	        stmt.setDate(5, new java.sql.Date(user.getDateOfBirth().getTime())); // Convert to java.sql.Date
	        stmt.setString(6, user.getContactNo());
	        stmt.setString(7, user.getGender());
	        stmt.setString(8, user.getAddress());
	        stmt.setString(9, user.getProfileImg());
	        stmt.setInt(10, user.getUserId());
	
	        return stmt.executeUpdate() > 0;
	
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return false;
	    }
	}
}
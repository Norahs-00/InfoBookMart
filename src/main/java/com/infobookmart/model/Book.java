package com.infobookmart.model;

public class Book {
    private int bookId;
    private String title;
    private String author;
    private int genreId;
    private String description;
    private int price;
    private String bookImage;

    // Getters and Setters
    public int getBookId() {
        return bookId;
    }
    public void setBookId(int bookId) {
        this.bookId = bookId;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public String getAuthor() {
        return author;
    }
    public void setAuthor(String author) {
        this.author = author;
    }
    public int getGenreId() {
        return genreId;
    }
    public void setGenreId(int i) {
        this.genreId = i;
    }
    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }
    public double getPrice() {
        return price;
    }
    public void setPrice(int price) {
        this.price = price;
    }
    public String getBookImage() {
        return bookImage;
    }
    public void setBookImage(String bookImage) {
        this.bookImage = bookImage;
    }
}
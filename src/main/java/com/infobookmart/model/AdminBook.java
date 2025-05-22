package com.infobookmart.model;

public class AdminBook {
    private int bookId;
    private String title;
    private String author;
    private String language;
    private int publishedYear;
    private String isbn;
    private int bookQuantity;
    private String bookImage;
    private String edition;
    private int genreId;
    private String description;
    private double price;

    // Constructors
    public AdminBook() {}

    public AdminBook(int bookId, String title, String author, String language, int publishedYear,
                String isbn, int bookQuantity, String bookImage, String edition,
                int genreId, String description, double price) {
        this.bookId = bookId;
        this.title = title;
        this.author = author;
        this.language = language;
        this.publishedYear = publishedYear;
        this.isbn = isbn;
        this.bookQuantity = bookQuantity;
        this.bookImage = bookImage;
        this.edition = edition;
        this.description = description;
        this.price = price;
        this.genreId = genreId;
    }

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

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public int getPublishedYear() {
		return publishedYear;
	}

	public void setPublishedYear(int publishedYear) {
		this.publishedYear = publishedYear;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public int getBookQuantity() {
		return bookQuantity;
	}

	public void setBookQuantity(int bookQuantity) {
		this.bookQuantity = bookQuantity;
	}

	public String getBookImage() {
		return bookImage;
	}

	public void setBookImage(String bookImage) {
		this.bookImage = bookImage;
	}

	public String getEdition() {
		return edition;
	}

	public void setEdition(String edition) {
		this.edition = edition;
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

	public void setPrice(double price) {
		this.price = price;
	}

	public int getGenreId() {
		return genreId;
	}

	public void setGenreId(int genreId) {
		this.genreId = genreId;
	}


   
}
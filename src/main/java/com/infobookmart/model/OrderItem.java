package com.infobookmart.model;

public class OrderItem {
    private int id;
    private String bookTitle;
    private int quantity;
    private double priceEach;

    public OrderItem(int id, String bookTitle, int quantity, double priceEach) {
        this.id = id;
        this.bookTitle = bookTitle;
        this.quantity = quantity;
        this.priceEach = priceEach;
    }

    public int getId() { 
    	return id; 
    }
    public String getBookTitle() { 
    	return bookTitle; 
    }
    public int getQuantity() { 
    	return quantity;
    }
    public double getPriceEach() { 
    	return priceEach; 
    }
    public double getTotal() { 
    	return priceEach * quantity; 
    }
}
package com.infobookmart.controller.dao;
import java.sql.*;
import com.infobookmart.controller.database.DatabaseConnection;
import java.util.ArrayList;
import java.util.List;
import com.infobookmart.model.CartItem;


public class CartDAO {
	private Connection conn;
	private PreparedStatement ps;

	public CartDAO() throws ClassNotFoundException, SQLException {
		this.conn = DatabaseConnection.getConnection();
	}

	// Gets an existing cart_id for user or creates a new one
	public int getOrCreateCartId(int userId) {
		int cartId = -1;
		String checkQuery = "SELECT cartId FROM cart WHERE userId = ?";
		String insertQuery = "INSERT INTO cart (userId) VALUES (?)";

		try {
			ps = conn.prepareStatement(checkQuery);
			ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				cartId = rs.getInt("cartId");
			} else {
				ps = conn.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
				ps.setInt(1, userId);
				ps.executeUpdate();
				rs = ps.getGeneratedKeys();
				if (rs.next()) {
					cartId = rs.getInt(1);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace(); // TODO: Replace with proper logging
		}
		return cartId;
	}

	// Checks if a product is already in the user's cart
	public boolean isBookInCart(int cartId, int bookId) {
		boolean found = false;
		String query = "SELECT * FROM cartItems WHERE cartId = ? AND bookId = ?";
		try {
			ps = conn.prepareStatement(query);
			ps.setInt(1, cartId);
			ps.setInt(2, bookId);
			ResultSet rs = ps.executeQuery();
			found = rs.next();
		} catch (SQLException e) {
			e.printStackTrace(); // TODO: Replace with proper logging
		}
		return found;
	}

	// updating the quantity of an existing cart item
	public boolean updateCartItem(int cartId, int bookId, int qty) {
		boolean updated = false;
		String query = "UPDATE cartItems SET cartQuantity = cartQuantity + ? WHERE cartId = ? AND bookId = ?";
		try {
			ps = conn.prepareStatement(query);
			ps.setInt(1, qty);
			ps.setInt(2, cartId);
			ps.setInt(3, bookId);
			if (ps.executeUpdate() > 0) {
				updated = true;
			}
		} catch (SQLException e) {
			e.printStackTrace(); // TODO: Replace with proper logging
		}
		return updated;
	}

	// inserting a new product into the cart
	public boolean insertCartItem(int cartId, int bookId, int qty) {
		boolean inserted = false;
		String query = "INSERT INTO cartItems (cartId, bookId, cartQuantity) VALUES (?, ?, ?)";
		try {
			ps = conn.prepareStatement(query);
			ps.setInt(1, cartId);
			ps.setInt(2, bookId);
			ps.setInt(3, qty);
			if (ps.executeUpdate() > 0) {
				inserted = true;
			}
		} catch (SQLException e) {
			e.printStackTrace(); // TODO: Replace with proper logging
		}
		return inserted;
	}
	
	public List<CartItem> getCartItem(int userId) {
	    List<CartItem> items = new ArrayList<>();
	    String query = "SELECT b.bookId, b.title, b.price, ci.cartQuantity"
	        +" FROM cartItems ci"
	        +" JOIN cart c ON ci.cartId = c.cartId"
	        +" JOIN books b ON b.bookId = ci.bookId"
	        +" WHERE c.userId = ?";

	    try {
	        ps = conn.prepareStatement(query);
	        ps.setInt(1, userId);
	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	            CartItem item = new CartItem();
	            item.setId(rs.getInt("bookId"));
	            item.setBookTitle(rs.getString("title"));
	            item.setPriceEach(rs.getDouble("price"));
	            item.setQuantity(rs.getInt("cartQuantity"));
	            items.add(item);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace(); // TODO: Replace with proper logging
	    }
	    return items;
	}
	
	//counting items in cart
	public int getCartItemCount(int userId) {
	    int count = 0;
	    String query = "SELECT SUM(ci.cartQuantity) AS total"
	        +" FROM cartItems ci"
	        +" JOIN cart c ON ci.cartId = c.cartId"
	        +" WHERE c.userId = ?";

	    try {
	        ps = conn.prepareStatement(query);
	        ps.setInt(1, userId);
	        ResultSet rs = ps.executeQuery();
	        if (rs.next()) {
	            count = rs.getInt("total");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return count;
	}
	
	//inserting a new order and returns the generated order_id
	public int insertOrder(int userId) {
	    int orderId = -1;
	    String query = "INSERT INTO orders (userId, orderDate, orderStatus) VALUES (?, NOW(), 'pending')";
	    try {
	        ps = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
	        ps.setInt(1, userId);
	        ps.executeUpdate();
	        ResultSet rs = ps.getGeneratedKeys();
	        if (rs.next()) {
	            orderId = rs.getInt(1);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return orderId;
	}

	// inserting a single cart item into order_item table
	public void insertOrderItem(int orderId, CartItem item) {
	    String query = "INSERT INTO order_items (orderId, bookId, orderQuantity, eachPrice) VALUES (?, ?, ?, ?)";
	    try {
	        ps = conn.prepareStatement(query);
	        ps.setInt(1, orderId);
	        ps.setInt(2, item.getId());
	        ps.setInt(3, item.getQuantity());
	        ps.setDouble(4, item.getPriceEach());
	        ps.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}

	// clear cart when user clicks on delete
	public void clearCart(int cartId) {
	    String query = "DELETE FROM cartItems WHERE cartId = ?";
	    try {
	        ps = conn.prepareStatement(query);
	        ps.setInt(1, cartId);
	        ps.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}

	public void removeCartItem(int cartId, int bookId) {
		String query="DELETE FROM cartItems WHERE cartId = ? AND bookId = ?";
	    try {
	        ps=conn.prepareStatement(query);
	        ps.setInt(1, cartId);
	        ps.setInt(2, bookId);
	        ps.executeUpdate();
	        ps.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}



}

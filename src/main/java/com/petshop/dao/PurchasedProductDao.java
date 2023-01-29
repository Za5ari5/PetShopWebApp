package com.petshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.petshop.model.Cart;
import com.petshop.model.Product;
import com.petshop.model.User;

public class PurchasedProductDao {
	
	private Connection con;

	private String query;
    private PreparedStatement pst;
    private ResultSet rs;
	private Statement st;
	
	public PurchasedProductDao(Connection con) {
		super();
		this.con = con;
	}
	
	public int buyProducts(User user, ArrayList<Cart> cart_list) {
		int result = 0;
		try {
			if (cart_list.size() > 0) {
				for (Cart item : cart_list) {
					query = "INSERT INTO purchased_products(`user_id`,`product_id`,`quantity` )"
					+ "VALUES(?,?,?); ";
		            pst = this.con.prepareStatement(query);
		            pst.setInt(1, user.getId());
		            pst.setInt(2, item.getId());
		            pst.setInt(3, item.getQuantity());
		            System.out.println(pst);
		            result = pst.executeUpdate();	
			}
			}

		} catch (SQLException e) {
            System.out.print(e.getMessage());
        }
		return result;
	}
}
	
	

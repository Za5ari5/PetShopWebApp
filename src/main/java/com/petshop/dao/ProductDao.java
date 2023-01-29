package com.petshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.petshop.model.*;

public class ProductDao {

	private Connection con;

	private String query;
    private PreparedStatement pst;
    private ResultSet rs;
    

	public ProductDao(Connection con) {
		super();
		this.con = con;
	}
	
	
	public List<Product> getAllProducts() {
        List<Product> products = new ArrayList<>();
        try {

            query = "select * from products";
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();

            while (rs.next()) {
            	Product row = new Product();
                row.setId(rs.getInt("pid"));
                row.setName(rs.getString("name"));
                row.setDetails(rs.getString("details"));
                row.setPrice(rs.getDouble("price"));
                row.setImage(rs.getString("image"));

                products.add(row);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return products;
    }
	
	 public List<Cart> getCartProducts(ArrayList<Cart> cartList) {
	        List<Cart> products = new ArrayList<Cart>();
	        try {
	            if (cartList.size() > 0) {
	                for (Cart item : cartList) {
	                    query = "select * from products where pid=?";
	                    pst = this.con.prepareStatement(query);
	                    pst.setInt(1, item.getId());
	                    rs = pst.executeQuery();
	                    while (rs.next()) {
	                        Cart row = new Cart();
	                        row.setId(rs.getInt("pid"));
	                        row.setName(rs.getString("name"));
	                        row.setDetails(rs.getString("details"));
	                        row.setPrice(rs.getDouble("price"));
	                        row.setImage(rs.getString("image"));
	                        row.setQuantity(item.getQuantity());
	                        products.add(row);
	                    }

	                }
	            }

	        } catch (SQLException e) {
	            e.printStackTrace();
	            System.out.println(e.getMessage());
	        }
	        return products;
	    }
	 
	 public List<Product> getLastProducts() {
	        List<Product> products = new ArrayList<>();
	        try {

	            query = "SELECT * FROM products where pid = (SELECT MAX(pid) FROM products)-1 or pid = (SELECT MAX(pid) FROM products) or pid = (SELECT MAX(pid) FROM products)-2 ;";
	            pst = this.con.prepareStatement(query);
	            rs = pst.executeQuery();

	            while (rs.next()) {
	            	Product row = new Product();
	                row.setId(rs.getInt("pid"));
	                row.setName(rs.getString("name"));
	                row.setDetails(rs.getString("details"));
	                row.setPrice(rs.getDouble("price"));
	                row.setImage(rs.getString("image"));

	                products.add(row);
	            }

	        } catch (SQLException e) {
	            e.printStackTrace();
	            System.out.println(e.getMessage());
	        }
	        return products;
	    }
	 
	 public List<Product> getSpecialProduct() {
	        List<Product> products = new ArrayList<>();
	        try {

	            query = "SELECT * FROM products where price = (SELECT MAX(price) FROM products) or price =(Select max(price) from  products where price < (SELECT MAX(price) FROM products));";
	            pst = this.con.prepareStatement(query);
	            rs = pst.executeQuery();

	            while (rs.next()) {
	            	Product row = new Product();
	                row.setId(rs.getInt("pid"));
	                row.setName(rs.getString("name"));
	                row.setDetails(rs.getString("details"));
	                row.setPrice(rs.getDouble("price"));
	                row.setImage(rs.getString("image"));

	                products.add(row);
	            }

	        } catch (SQLException e) {
	            e.printStackTrace();
	            System.out.println(e.getMessage());
	        }
	        return products;
	    }
}

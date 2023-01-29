package com.petshop.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petshop.dao.PurchasedProductDao;
import com.petshop.dao.UserDao;
import com.petshop.db.DbCnx;
import com.petshop.model.Cart;
import com.petshop.model.User;


public class CheckoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CheckoutServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;chartset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
			User auth = (User) request.getSession().getAttribute("auth");
			
			
			
			try {
				PurchasedProductDao ppd = new PurchasedProductDao(DbCnx.getConnection());
				ppd.buyProducts(auth, cart_list);
	        } catch (Exception e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
			cart_list.clear();
	        response.sendRedirect("/PetShopWebApp/Cart");
            
		
		
		
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


	}
}

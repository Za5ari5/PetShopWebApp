package com.petshop.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petshop.model.Cart;


public class QuantityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public QuantityServlet() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			int pid = Integer.parseInt(request.getParameter("pid"));
			
			ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
			
			if(pid>=1) {
				for(Cart c:cart_list) {
					if(c.getId()==pid) {
						int quantity = Integer.parseInt(request.getParameter("quantity_number"));
						c.setQuantity(quantity);
						response.sendRedirect("/PetShopWebApp/Cart");
					}
				}
			}
			
			
	}

}
}
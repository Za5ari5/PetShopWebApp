package com.petshop.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petshop.dao.UserDao;
import com.petshop.db.DbCnx;
import com.petshop.model.User;

public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
    public Register() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.getServletContext().getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			String username = request.getParameter("register-username");
			String password = request.getParameter("register-password");
			String email = request.getParameter("register-email");
			String phone = request.getParameter("register-phone");
			String adress = request.getParameter("register-adress");
			
			User user = new User();

			user.setUsername(username);
			user.setPassword(password);
			user.setEmail(email);
			user.setPhone(phone);
			user.setAdress(adress);

			try {
				UserDao udao = new UserDao(DbCnx.getConnection());
				udao.userRegister(user);
	        } catch (Exception e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }

	        response.sendRedirect("/PetShopWebApp/HomePage");
	    }
			

		
	}

}

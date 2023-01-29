package com.petshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.petshop.model.User;

public class UserDao {
	
	private Connection con;

	private String query;
    private PreparedStatement pst;
    private ResultSet rs;

	public UserDao(Connection con) {
		this.con = con;
	}
	
	public User userLogin(String username, String password) {
		User user = null;
        try {
            query = "select * from users where username=? and password=?";
            pst = this.con.prepareStatement(query);
            pst.setString(1, username);
            pst.setString(2, password);
            rs = pst.executeQuery();
            if(rs.next()){
            	user = new User();
            	user.setId(rs.getInt("uid"));
            	user.setUsername(rs.getString("username"));
            	user.setEmail(rs.getString("email"));
            	user.setPhone(rs.getString("phone"));
            	user.setAdress(rs.getString("adress"));
            }
        } catch (SQLException e) {
            System.out.print(e.getMessage());
        }
        return user;
    }
	
	public int userRegister(User user) {
		int result = 0;
		try {
			query = "INSERT INTO users(`username`,`password`,`email`,`phone`,`adress`)"
					+ "VALUES(?,?,?,?,?); ";
		            pst = this.con.prepareStatement(query);
		            pst.setString(1, user.getUsername());
		            pst.setString(2, user.getPassword());
		            pst.setString(3, user.getEmail());
		            pst.setString(4, user.getPhone());
		            pst.setString(5, user.getAdress());
		            System.out.println(pst);
		            result = pst.executeUpdate();		            

		} catch (SQLException e) {
            System.out.print(e.getMessage());
        }
		return result;
	}
		
}


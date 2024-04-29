package com.org.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.org.dto.User;

public class UserDao {

	public void saveUser(User user) throws SQLException {
		Connection con = null;
		PreparedStatement pst = null;
		try {
//			Load and register
			Class.forName("com.mysql.cj.jdbc.Driver");
			
//			Establish connection
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user_mgmt","root","root");
			
//			Create platform
			pst = con.prepareStatement("insert into user(name,age,email,password,mobile)values(?,?,?,?,?)");
			
			pst.setString(1, user.getName());
			pst.setInt(2, user.getAge());
			pst.setString(3, user.getEmail());
			pst.setString(4, user.getPassword());
			pst.setLong(5, user.getMobile());
			
			pst.executeUpdate();
			
			
		} catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
		} finally {
			if(pst != null) {
				pst.close();
			}
			if (con != null) {
				con.close();
			}
		}

	}
	
	public User fetchUser(String email, String password) throws SQLException {
		
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rst = null;
		
		try {
//			Load and register
			Class.forName("com.mysql.cj.jdbc.Driver");
			
//			Establish connection
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user_mgmt","root","root");
			
//			Create platform
			pst = con.prepareStatement("select id,name,age,email,password,mobile from user where email=? and password=?");
			
			pst.setString(1, email);
			pst.setString(2, password);
			
			rst = pst.executeQuery();
			
			if (rst.next()) {
				User user = new User();
				
				user.setId(rst.getInt("id"));
				user.setName(rst.getString("name"));
				user.setAge(rst.getInt("age"));
				user.setEmail(email);
				user.setPassword(password);
				user.setMobile(rst.getLong("mobile"));
				
				return user;
			} 
			
			
		} catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
		} finally {
			if (rst != null) {
				rst.close();
			}
			if(pst != null) {
				pst.close();
			}
			if (con != null) {
				con.close();
			}
		}
		
		return null;
		
	}
	
	public List<User> fetchAllUsers() throws SQLException {
		
		Connection con = null;
		Statement st = null;
		ResultSet rst = null;

		List<User> lu = new ArrayList<User>();
		
		try {
//			Load and register
			Class.forName("com.mysql.cj.jdbc.Driver");
			
//			Establish connection
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user_mgmt","root","root");
			
//			Create platform
			st = con.createStatement();
			
			rst = st.executeQuery("select * from user");
			
			
			while (rst.next()) {
				User user = new User();
				
				user.setId(rst.getInt("id"));
				user.setName(rst.getString("name"));
				user.setAge(rst.getInt("age"));
				user.setEmail(rst.getString("email"));
				user.setPassword(rst.getString("password"));
				user.setMobile(rst.getLong("mobile"));
				
				lu.add(user);
			} 
			
			
		} catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
		} finally {
			if (rst != null) {
				rst.close();
			}
			if(st != null) {
				st.close();
			}
			if (con != null) {
				con.close();
			}
		}
		
		
		return lu;
		
	}
	
	public void deleteUser(String uid) throws SQLException {
		Connection con = null;
		Statement st = null;
		
		try {
//			Load and register
			Class.forName("com.mysql.cj.jdbc.Driver");
			
//			Establish connection
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user_mgmt","root","root");
			
//			Create platform
			st = con.createStatement();
			st.executeUpdate("delete from user where id='"+uid+"'");
			
			
		} catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
		} finally {
			if(st != null) {
				st.close();
			}
			if (con != null) {
				con.close();
			}
		}
	}

}

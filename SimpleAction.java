package com.example.action;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.example.bean.SimpleBean;

public class SimpleAction {
	public String[] details(SimpleBean bb) {
	    String[] aa = new String[5];
	    String name = bb.getCustomer_name();
	    String age = bb.getAge();
	    String amount = bb.getPrinciple_amount();
	    String year = bb.getYears();
	    String rate = bb.getRate();

	    Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;

	    try {
	        Class.forName("oracle.jdbc.driver.OracleDriver");
	        con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "joe", "joe");

	        pstmt = con.prepareStatement(
	                "INSERT INTO TESTING_NEW (CUSTOMER_NAME, AGE, PRINCIPLE_AMOUNT, YEARS, RATE) VALUES (?, ?, ?, ?, ?)");
	        pstmt.setString(1, name);
	        pstmt.setString(2, age);
	        pstmt.setString(3, amount);
	        pstmt.setString(4, year);
	        pstmt.setString(5, rate);

	        int i = pstmt.executeUpdate();
	        if (i > 0) {
	            pstmt = con.prepareStatement("SELECT * FROM TESTING_NEW WHERE CUSTOMER_NAME = ? AND AGE = ?");
	            pstmt.setString(1, name);
	            pstmt.setString(2, age);
	            rs = pstmt.executeQuery();

	            if (rs.next()) {
	                aa[0] = rs.getString("CUSTOMER_NAME");
	                aa[1] = rs.getString("AGE");
	                aa[2] = rs.getString("PRINCIPLE_AMOUNT");
	                aa[3] = rs.getString("YEARS");
	                aa[4] = rs.getString("RATE");
	            }
	        } else {
	            System.out.println("Data not inserted");
	        }
	    } catch (ClassNotFoundException | SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null) {
	                rs.close();
	            }
	            if (pstmt != null) {
	                pstmt.close();
	            }
	            if (con != null) {
	                con.close();
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }

	    return aa;
	}
}	
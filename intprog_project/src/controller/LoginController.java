package controller;

import javax.servlet.*;
import javax.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.naming.*;
import javax.sql.DataSource;

import controller.connectDB;

import java.sql.PreparedStatement;
import java.io.IOException;
import java.util.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import bean.Group;
import bean.User;

public class LoginController extends HttpServlet {

	private static Connection conn = null;
	private String query;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

		conn = connectDB.connect();

		String username = request.getParameter("username");
		HttpSession session = request.getSession(true);
		session.setAttribute("Username", username);

		if (findUser(username)) {
			System.out.println("True");
			
			try {
				RequestDispatcher rd = request
						.getRequestDispatcher("map.jsp");
				rd.forward(request, response);
			} catch (ServletException e) {
				System.out.print(e.getMessage());
			}
			

			
			
			
		} else {
			System.out.println("false");
			try {
				RequestDispatcher rd = request
						.getRequestDispatcher("register.jsp");
				rd.forward(request, response);
			} catch (ServletException e) {
				System.out.print(e.getMessage());
			}

		}

	}

	// find user in database
	public static Boolean findUser(String username) {
		String query = "";

		try {

			query = "SELECT * FROM users WHERE username= ?";
			PreparedStatement stmt = conn.prepareStatement(query);
			stmt.setString(1, username);
			ResultSet rs = null;
			rs = stmt.executeQuery();
			if (rs.next()) {
				return true;
			} else {
				return false;
			}
		} catch (SQLException e) {
			System.out.println(query);
		}
		return null;
	}
}
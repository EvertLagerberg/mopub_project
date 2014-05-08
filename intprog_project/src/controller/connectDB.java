package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import bean.Location;

public class connectDB {
	private static DataSource dataSource;
	private static Connection conn = null;
	private static String query = "";

	public static Connection connect() {

		try {
			Database("jdbc/db");
			conn = dataSource.getConnection();

			System.out.println("Database connection established");

		} catch (Exception e) {

			System.err.println("Cannot connect to database server");
			e.printStackTrace();

		}
		return conn;

	}
	//dfgfgd
	public static void Database(String jndiname) {
		try {
			dataSource = (DataSource) new InitialContext()
					.lookup("java:comp/env/" + jndiname);
		} catch (NamingException e) {
			// Handle error that it's not configured in JNDI.
			throw new RuntimeException(jndiname + " is missing in JNDI!", e);
		}
	}

	public Connection getConnection() throws SQLException {
		return dataSource.getConnection();
	}
	
	
	public static void insertLocation(String room, Float longitude, Float latitude) {
		
		conn = connectDB.connect();
		try {
			query = "INSERT INTO locations (room,longitude,latitude) VALUES (?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, room);
			pstmt.setFloat(2, longitude);
			pstmt.setFloat(3, latitude);
			pstmt.executeUpdate();
			

		} catch (SQLException e) {
			System.out.println(e);
			
		}
		
		try {
			conn.close();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
	}
	
	


}

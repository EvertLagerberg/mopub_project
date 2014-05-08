package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import bean.Location;

public class connectDB {
	private static DataSource dataSource;
	private static Connection conn = null;
	static PreparedStatement pstmt;
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
	

	public static int insertEvent(String username, String name, String description, String starttime, String endtime){
		query = "INSERT INTO events (username,name,description,starttime,endtime) VALUES (?,?,?,?,?)";
		conn = connect(); 
		
		try {
		pstmt = conn.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
		pstmt.setString(1, username);
		pstmt.setString(2, name);
		pstmt.setString(3, description);
		pstmt.setString(4, starttime);
		pstmt.setString(5, endtime);
		pstmt.executeUpdate();
		ResultSet generatedID = pstmt.getGeneratedKeys();
		
		try {
			conn.close();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		if(generatedID.next()){
			int event_id = generatedID.getInt(1);
			return event_id;
		}
		int event_id = generatedID.getInt(1);
		
	} catch (SQLException e) {
		e.printStackTrace();
	}
		return 0;
}
	
	public static void insertEventsLocation(int event_id, String room){
		conn = connect(); 
		try {
			System.out.println("------------------------------------------>"+room + "-------" + event_id+"<-------------------");
		query = "INSERT INTO events_locations (event_id,room) VALUES (?,?)";
		PreparedStatement pstmt = conn.prepareStatement(query);
		pstmt.setInt(1, event_id);
		pstmt.setString(2, room);
		pstmt.executeUpdate();
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	
	}
		try {
			conn.close();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
}
	public static void insertLocation(String room, Float longitude, Float latitude) {
		conn = connect(); 
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
	
	public static Boolean findUser(String username) {
		conn = connect(); 
		try {
			query = "SELECT * FROM events WHERE username= ?";
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
		try {
			conn.close();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return null;
	}
}

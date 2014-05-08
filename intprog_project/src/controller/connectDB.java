package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import bean.Event;
import bean.Location;

public class connectDB {
	private static DataSource dataSource;
	private static Connection conn = null;
	static PreparedStatement pstmt;
	private static String query = "";

	//connect to the database
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

	// insert an event in DB
	public static int insertEvent(String username, String name,
			String description, String starttime, String endtime) {
		query = "INSERT INTO events (username,name,description,starttime,endtime) VALUES (?,?,?,?,?)";
		conn = connect();
		int event_id = 0;
		
		try {
			pstmt = conn.prepareStatement(query,
					Statement.RETURN_GENERATED_KEYS);
			pstmt.setString(1, username);
			pstmt.setString(2, name);
			pstmt.setString(3, description);
			pstmt.setString(4, starttime);
			pstmt.setString(5, endtime);
			pstmt.executeUpdate();
			ResultSet generatedID = pstmt.getGeneratedKeys();
			generatedID.next();
			event_id = generatedID.getInt(1);
			conn.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		// return the event_id of the event that was just inserted
		return event_id;
	}
	
	//insert event and corresponding location(s) in DB
	public static void insertEventsLocation(int event_id, String room) {
		conn = connect();
		try {
			query = "INSERT INTO events_locations (event_id,room) VALUES (?,?)";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, event_id);
			pstmt.setString(2, room);
			pstmt.executeUpdate();
			
			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}

	}
	//insert locations with long, lat in DB
	public static void insertLocation(String room, Float longitude,
			Float latitude) {
		conn = connect();
		try {
			query = "INSERT INTO locations (room,longitude,latitude) VALUES (?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, room);
			pstmt.setFloat(2, longitude);
			pstmt.setFloat(3, latitude);
			pstmt.executeUpdate();
			
			conn.close();
		} catch (SQLException e) {
			System.out.println(e);
		}
		
	}
	// Check if user is in database
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
	
	public static ArrayList getEvents(String username) {
		conn = connect();

		ArrayList<Event> list = new ArrayList<Event>();
		try {
			ResultSet rs = null;
			String query = "select events.*, locations.* from "
			+ "events inner join events_locations on events.id=events_locations.event_id "
			+"inner join locations on locations.room= events_locations.room where events.username =?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, username);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Event e = new Event();
				e.setId(rs.getInt("id"));
				e.setName(rs.getString("name"));
				e.setDescription(rs.getString("description"));
				e.setStarttime(rs.getString("starttime"));
				e.setEndtime(rs.getString("endtime"));
				e.setUsername(rs.getString("username"));
				e.setRoom(rs.getString("room"));
				e.setLongitude(rs.getFloat("longitude"));
				e.setLatitude(rs.getFloat("latitude"));
				
				list.add(e);
			}
			
		} catch (SQLException e) {
			System.out.println(e);
		}

		return list;
	}
	
	
	
	
//end of class	
}

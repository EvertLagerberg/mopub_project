package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import bean.Event;
import bean.Location;

import java.util.Date;
import java.text.DateFormat;

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
		if (room.equals("")){
			room = "Saknas";
		}
		try {
			query = "INSERT INTO events_locations (event_id,room) VALUES (?,?)";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, event_id);
			pstmt.setString(2, room);
			pstmt.executeUpdate();
			
			conn.close();

		} catch (SQLException e) {
			insertAltroom(event_id,room);
			System.out.println("--------------------------->" + room);
			query = "INSERT INTO events_locations (event_id,room) VALUES (?,?)";
			PreparedStatement pstmt;
			try {
				room = "Saknas";
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, event_id);
				pstmt.setString(2, room);
				pstmt.executeUpdate();
				conn.close();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		}
	}
	//insert locations with long, lat in DB
	public static void insertSaknasLocation(){
		conn = connect();
		try {
			query = "INSERT INTO locations (room,longitude,latitude) VALUES (?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "Saknas");
			pstmt.setDouble(2, 18.07062953710556 );
			pstmt.setDouble(3, 59.347330625522105);
			pstmt.executeUpdate();
			
			conn.close();
		} catch (SQLException e) {
			System.out.println(e);
		}
	}
		
	public static void insertLocation(String room, double longitude,
			double latitude) {
		conn = connect();
	
		try {
			query = "INSERT INTO locations (room,longitude,latitude) VALUES (?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, room);
			pstmt.setDouble(2, longitude);
			pstmt.setDouble(3, latitude);
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
				conn.close();
				return true;
			} else {
				conn.close();
				return false;
			}
		} catch (SQLException e) {
			
			System.out.println(query);
			System.out.println(e);
		}
		return null;
	}
	
	public static ArrayList<Event> getEvents(String username) {
		conn = connect();
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		String Date = dateFormat.format(date);
		System.out.println(dateFormat.format(date));

		ArrayList<Event> list = new ArrayList<Event>();
		try {
			ResultSet rs = null;
			String query = "select events.*, locations.* from "
			+ "events inner join events_locations on events.id=events_locations.event_id "
			+"inner join locations on locations.room= events_locations.room where events.username =? and "
			+"endtime > ? ORDER BY starttime;";
			System.out.println(query);

			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, username);
			pstmt.setString(2, Date);
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
				e.setLongitude(rs.getDouble("longitude"));
				e.setLatitude(rs.getDouble("latitude"));
				list.add(e);
			}
			
		} catch (SQLException e) {
			System.out.println(e);
			
		}

		return list;
	}
	
	public static void insertAltroom (int event_id,String altroom){
		query = "INSERT INTO altroom (event_id,room) VALUES (?,?)";
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, event_id);
			pstmt.setString(2, altroom);
			pstmt.executeUpdate();
		
		conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	} 
	
	public static ArrayList<String> getAltroom (int event_id){
		query = "SELECT * FROM altroom where event_id = ?";
		PreparedStatement pstmt;
		ArrayList<String> altrooms = new ArrayList<String>();
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, event_id);
			rs = pstmt.executeQuery();
			while (rs.next()){
				altrooms.add(Integer.toString(rs.getInt("event_id"))+":"+rs.getString("room"));
			}
		conn.close();
	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return altrooms;
		
	}
	
	
	
	
//end of class	
}

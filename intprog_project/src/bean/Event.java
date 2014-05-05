package bean;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

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

import java.sql.Timestamp;

import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

public class Event {

	private int id;
	private String name;
	private String description;
	private String starttime;
	private String endtime;
	private String location;
	private String username;
	private String weekday;
	private String room;
	private Float longitude;
	private Float latitude;
	

	private Connection conn = null;

	public Event() {
	}

	public void setID(int e) {
		this.id = e;
	}

	public void setName(String e) {
		this.name = e;
	}

	public void setDescription(String e) {
		this.description = e;
	}

	public void setStarttime(String e) {
		this.starttime = e;
	}

	public void setEndtime(String e) {
		this.endtime = e;
	}

	public void setLocation(String e) {
		this.location = e;
	}
	
	public void setUsername(String e) {
		this.username = e;
	}
	
	public void setWeekday(String e) {
		this.weekday = e;
	}
	
	public void setRoom(String e) {
		this.room = e;
	}
	
	public void setLongitude(Float e) {
		this.longitude = e;
	}
	
	public void setLatiude(Float e) {
		this.latitude = e;
	}

	public int getID() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getDescription() {
		return description;
	}

	public String getStarttime() {
		return starttime;
	}

	public String getEndtime() {
		return endtime;
	}

	public String getLocation() {
		return location;
	}
	
	public String getUsername() {
		return username;
	}
	
	public String getWeekday() {
		return weekday;
	}
	
	
	public String getRoom() {
		return room;
	}
	
	public Float Longitude() {
		return longitude;
	}
	
	public Float getLatitude() {
		return latitude;
	}
	

	// end of class
}
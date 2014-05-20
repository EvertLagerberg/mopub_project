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
	private String username;
	private String room;
	private Double longitude;
	private Double latitude;
	private ArrayList<String> altroom = new ArrayList<String>();

	private Connection conn = null;

	public Event() {
	}

	public void setId(int e) {
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

	
	public void setUsername(String e) {
		this.username = e;
	}
	
	
	public void setRoom(String e) {
		this.room = e;
	}
	
	public void setLongitude(Double e) {
		this.longitude = e;
	}
	
	public void setLatitude(Double e) {
		this.latitude = e;
	}
	
	public void setAltroom(String e) {
		this.altroom.add(e);
	}


	public int getId() {
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

	
	public String getUsername() {
		return username;
	}
	
	
	public String getRoom() {
		return room;
	}
	
	public Double getLongitude() {
		return longitude;
	}
	
	public Double getLatitude() {
		return latitude;
	}
	
	public String getAltroom(String e) {
		String rooms ="";
		if(altroom != null){
			for(String alt:altroom){
				rooms += alt +",";	
			}
			return rooms;
			
		}
		return null;
	}

	// end of class
}
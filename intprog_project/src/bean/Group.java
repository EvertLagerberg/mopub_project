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

import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

public class Group {

	private int id;
	private String name;
	private String starttime;
	private String endtime;
	private String startdate;
	private String enddate;

	private Connection conn = null;

	public Group() {
	}

	public void setID(int g) {
		this.id = g;
	}

	public void setName(String g) {
		this.name = g;
	}

	public void setStarttime(String g) {
		this.starttime = g;
	}

	public void setEndtime(String g) {
		this.endtime = g;
	}

	public void setStartdate(String g) {
		this.startdate = g;
	}

	public void setEnddate(String g) {
		this.enddate = g;
	}

	public int getID() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getStarttime() {
		return starttime;
	}

	public String getEndtime() {
		return endtime;
	}

	public String getStartdate() {
		return startdate;
	}

	public String getEnddate() {
		return enddate;
	}

	// end of class
}
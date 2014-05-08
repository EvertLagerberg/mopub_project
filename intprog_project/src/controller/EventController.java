package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.fortuna.ical4j.data.CalendarBuilder;
import net.fortuna.ical4j.data.ParserException;
import net.fortuna.ical4j.model.Calendar;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import bean.Group;
import bean.User;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import net.fortuna.ical4j.data.CalendarBuilder;
import net.fortuna.ical4j.data.ParserException;
import net.fortuna.ical4j.model.*;
import net.fortuna.ical4j.util.*;

public class EventController extends HttpServlet {

	private static Connection conn;
	public static User loggedinUser = null;
	private final String upload_directory = "/Users/evertlagerberg/Git/mopub_project/intprog_project/uploads";
	private ComponentList list;
	String formated_starttime;
	String formated_endtime;
	String[] split_rooms;
	boolean correctUser = false;
	ArrayList<Group> grouplist = new ArrayList<Group>();
	static String username_FORM = "";

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		HttpSession session = request.getSession(true);}
		// end of main function
	
	// Convert .ics-file to java calendar object
	private Calendar createCalendar(String filepath) throws IOException {

		FileInputStream fin = new FileInputStream(filepath);

		CalendarBuilder builder = new CalendarBuilder();

		Calendar tempcalendar = null;
		try {
			return builder.build(fin);

		} catch (ParserException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return tempcalendar;

	}

	// parse calendarobjekt to events and insert them into database.
	private void parseCalendartoDB(Calendar calendar) throws ParseException {
		int event_id = 0;
		list = calendar.getComponents();
		String event_name = "";
		String event_description = "";
		java.util.Date event_starttime = null;
		java.util.Date event_endtime = null;
		String event_location = "";
		String query = "";
		DateFormat df = new SimpleDateFormat("yyyyMMdd'T'HHmmss'Z'");
		DateFormat new_df = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		df.setTimeZone(TimeZone.getTimeZone("UTC"));
		for (Object c : list) {
			String str = c.toString();
			// parse-out Event-name
			String[] tokens = str.split("\n");
			for (String s : tokens) {
				if (s.contains("SUMMARY:")) {
					String[] strip = s.split("SUMMARY:");
					event_name = strip[1];

				} else if (s.contains("DESCRIPTION:")) {
					String[] strip = s.split("DESCRIPTION:");
					event_description = strip[1];

				} else if (s.contains("DTSTART;")) {
					String[] strip = s.split(":");
					String starttime = strip[1];

					event_starttime = df.parse(starttime);
					formated_starttime = new_df.format(event_starttime);

				} else if (s.contains("DTEND;")) {
					String[] strip = s.split(":");
					String endtime = strip[1];
					event_endtime = df.parse(endtime);
					formated_endtime = new_df.format(event_endtime);

				} else if (s.contains("LOCATION:")) {
					String[] strip = s.split("LOCATION:");
					split_rooms = strip[1].split("\\\\,");
					
					
					System.out.println("8th Location syntax" + split_rooms[0]);
					
					

				}

			}
			    // Username ska skickas till EventController
				String username = "Tommy";
				ResultSet generatedID = connectDB.insertEvent(username, event_name,event_description,formated_starttime,formated_endtime);
				try {
					event_id = generatedID.getInt(1);
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
				
			for(int i=0;i< split_rooms.length;i++){
			  connectDB.insertEventsLocation(event_id, split_rooms[i].trim());
				}
		}
	}

	// end of class
}

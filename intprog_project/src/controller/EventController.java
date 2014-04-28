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
	private final String upload_directory = "/Users/evertlagerberg/Documents/workspaceEE/intprog_project/uploads";
	private ComponentList list;
	String formated_starttime;
	String formated_endtime;
	boolean correctUser = false;
	ArrayList<Group> grouplist = new ArrayList<Group>();
	static String username_FORM = "";

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		conn = connectDB.connect();
		HttpSession session = request.getSession(true);
		String name = "";
		String message = "";

		String usermail_FORM = "";
		String userUrl_FORM = "";

		// Read in new user + user calendar from form
		if (ServletFileUpload.isMultipartContent(request)) {
			
			// username_FORM = request.getParameter("username");

			try {
				List<FileItem> formfields = new ServletFileUpload(
						new DiskFileItemFactory()).parseRequest(request);

				for (FileItem item : formfields) {
					if (item.isFormField()) {

						if (item.getFieldName().equals("username")) {
							username_FORM = item.getString();

						}
						if (item.getFieldName().equals("usermail")) {
							usermail_FORM = item.getString();

						}
						if (item.getFieldName().equals("userurl")) {
							userUrl_FORM = item.getString();

						}
					}

					// read in .ics-files
					if (!item.isFormField()) {

						name = username_FORM + ".ics";
						item.write(new File(upload_directory + File.separator
								+ name));
					}
				}
				if (findUser(username_FORM) && usermail_FORM.equals("")
						&& userUrl_FORM.equals("")) {
					request.setAttribute("message", "Blivande huvudsida");
					session.setAttribute("Username", username_FORM);
					grouplist = getGroupsDB();

					request.setAttribute("grouplist", grouplist);

					try {
						RequestDispatcher rd = request
								.getRequestDispatcher("main.jsp");
						rd.forward(request, response);
					} catch (ServletException e) {
						System.out.print(e.getMessage());
					} catch (IOException e) {
						System.out.print(e.getMessage());
					}
					return;
				} else if (!findUser(username_FORM) && usermail_FORM.equals("")
						&& userUrl_FORM.equals("")) {
					request.setAttribute("message",
							"Finns ingen med det användarnamnet!");

					try {
						RequestDispatcher rd = request
								.getRequestDispatcher("login.jsp");
						rd.forward(request, response);
					} catch (ServletException e) {
						System.out.print(e.getMessage());
					} catch (IOException e) {
						System.out.print(e.getMessage());
					}
					return;
				} else if (findUser(username_FORM)) {

					request.setAttribute("message",
							"Användarnamnet är upptaget");
				} else {
					loggedinUser = insertUser(username_FORM, usermail_FORM,
							userUrl_FORM);

					// session.setAttribute("UserID", loggedinUser.getID());
					session.setAttribute("Username", loggedinUser.getUsername());

					// File uploaded successfully
					request.setAttribute("message", "Användaren är inlagd");
					correctUser = true;
				}

			} catch (Exception ex) {

				request.setAttribute("message", "Something went wrong" + ex);
			}
			if (correctUser) {
				Calendar calendar = createCalendar(upload_directory
						+ File.separator + name);

				try {
					parseCalendartoDB(calendar);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				try {
					conn.close();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}

				try {

					RequestDispatcher rd = request
							.getRequestDispatcher("login.jsp");
					rd.forward(request, response);
				} catch (ServletException e) {
					System.out.print(e.getMessage());
				} catch (IOException e) {
					System.out.print(e.getMessage());
				}
			}

			else {
				try {
					RequestDispatcher rd = request
							.getRequestDispatcher("userForm.jsp");
					rd.forward(request, response);
				} catch (ServletException e) {
					System.out.print(e.getMessage());
				} catch (IOException e) {
					System.out.print(e.getMessage());
				}
			}
			try {
				conn.close();

			} catch (SQLException e) {
				System.out.print(e.getMessage());

			}
		}
		// end of main function
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

	// inser new user in database
	public User insertUser(String username, String usermail, String userUrl) {
		User u = null;
		String query = "";
		try {

			query = "INSERT INTO users (username,url,email) VALUES (?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(query,
					Statement.RETURN_GENERATED_KEYS);
			pstmt.setString(1, username);
			pstmt.setString(2, userUrl);
			pstmt.setString(3, usermail);
			pstmt.executeUpdate();
			u = new User();
			u.setUsername(username);
			u.setUsermail(usermail);
			u.setUserUrl(userUrl);

		} catch (SQLException e) {
			System.out.println("Fel med att sätt in användare");
		}
		return u;
	}

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
					event_location = strip[1];

				}

			}
			try {

				query = "INSERT INTO events (name,description,starttime,endtime,location) VALUES (?,?,?,?,?)";
				PreparedStatement pstmt = conn.prepareStatement(query,
						Statement.RETURN_GENERATED_KEYS);

				pstmt.setString(1, event_name);
				pstmt.setString(2, event_description);
				pstmt.setString(3, formated_starttime);
				pstmt.setString(4, formated_endtime);
				pstmt.setString(5, event_location);

				pstmt.executeUpdate();

				ResultSet generatedID = pstmt.getGeneratedKeys();
				if (generatedID.next()) {
					query = "INSERT INTO users_events (username,event_id) VALUES (?,?)";
					pstmt = conn.prepareStatement(query);
					pstmt.setString(1, loggedinUser.getUsername());
					pstmt.setInt(2, generatedID.getInt(1));
					pstmt.executeUpdate();
				}
			} catch (SQLException e) {
				System.out.println(e);
			}

		}
	}

	// get all groups in DB agdfnd put sdfsfdfsd in ArrayList
	public static ArrayList getGroupsDB() {

		ArrayList list = new ArrayList();
		try {

			ResultSet rs = null;
			// String query = "select * from groups";
			String query = "select * from groups inner join"
					+ " groups_users on groups.id = groups_users.group_id where"
					+ " groups_users.username = ?";

			PreparedStatement pstmt = conn.prepareStatement(query);

			pstmt.setString(1, username_FORM);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				Group g = new Group();
				g.setID(rs.getInt("id"));

				g.setName(rs.getString("name"));
				g.setStarttime(rs.getString("starttime"));
				g.setEndtime(rs.getString("endtime"));
				g.setStartdate(rs.getString("startdate"));
				g.setEnddate(rs.getString("enddate"));

				list.add(g);
			}
		} catch (SQLException e) {
			System.out.println("fel" + e);
		}
		return list;
	}

	// end of class
}

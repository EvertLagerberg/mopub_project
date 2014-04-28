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

import bean.Event;
import bean.Group;
import bean.User;
import java.sql.Timestamp;

;

public class MainController extends HttpServlet {

	private Connection conn = null;
	String test = "";
	private String query;
	int groupID;

	ArrayList<Event> eventlist = new ArrayList();

	public void doGet(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<Group> grouplist = new ArrayList<Group>();
		conn = connectDB.connect();
		HttpSession session = request.getSession(true);
		groupID = (int) session.getAttribute("session_groupID");

		eventlist = getGroupEventsDB();
		request.setAttribute("eventlist", eventlist);

		grouplist = EventController.getGroupsDB();

		request.setAttribute("grouplist", grouplist);

		try {
			conn.close();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		try {
			RequestDispatcher rd = request.getRequestDispatcher("main.jsp");

			rd.forward(request, response);
		} catch (ServletException e) {
			System.out.print(e.getMessage());
		} catch (IOException e) {
			System.out.print(e.getMessage());
		}

		// end of doGet
	}

	// get userID or insert new user
	public ArrayList getGroupEventsDB() {

		ArrayList list = new ArrayList();
		try {
			ResultSet rs = null;
			String query = "SELECT events.*,users_events.username, groups_weekdays.wkday FROM "
					+ "groups_users INNER JOIN "
					+ "users_events ON groups_users.username=users_events.username INNER JOIN "
					+ "groups ON groups_users.group_id=groups.id INNER JOIN "
					+ "events ON users_events.event_id=events.id INNER JOIN "
					+ "groups_weekdays ON groups.id=groups_weekdays.group_id WHERE "
					+ "groups_users.group_id=? AND (DATE(events.starttime) BETWEEN "
					+ "groups.startdate AND groups.enddate) AND "
					+ "(TIME(events.starttime) BETWEEN groups.starttime AND groups.endtime) AND "
					+ "binary groups_weekdays.wkday=binary dayname(events.starttime) ORDER BY "
					+ "events.starttime ASC";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, groupID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Event e = new Event();
				e.setID(rs.getInt("id"));
				e.setName(rs.getString("name"));
				e.setDescription(rs.getString("description"));
				e.setStarttime(rs.getString("starttime"));
				e.setEndtime(rs.getString("endtime"));
				e.setWeekday(rs.getString("wkday"));
				e.setUsername(rs.getString("username"));
				e.setLocation(rs.getString("location"));
				list.add(e);
			}
		} catch (SQLException e) {
		}

		return list;
	}

	// end of class
}

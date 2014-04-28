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

import bean.Group;
import bean.User;

public class GroupController extends HttpServlet {

	private Connection conn = null;
	private String query;
	ArrayList<Group> grouplist = new ArrayList<Group>();

	public void doGet(HttpServletRequest request, HttpServletResponse response) {

		conn = connectDB.connect();
		HttpSession session = request.getSession(true);
		String thisUser = session.getAttribute("Username").toString();

		// sent from addGroup.jsp
		if (request.getParameter("action").equals("addGroup")) {

			DateFormat dfDates = new SimpleDateFormat("dd-MMM-yyyy");
			DateFormat new_dfDates = new SimpleDateFormat("yyyy/MM/dd");
			DateFormat dfHours = new SimpleDateFormat("HH:mm");
			DateFormat new_dfHours = new SimpleDateFormat("HH:mm:ss");
			java.util.Date group_startdate = null;
			java.util.Date group_enddate = null;
			java.util.Date group_starttime = null;
			java.util.Date group_endtime = null;

			// get variables from forrm
			String group_name = request.getParameter("name");
			String enddate = request.getParameter("rangeEnd");
			String startdate = request.getParameter("rangeStart");
			String starttime = request.getParameter("starttime");
			String endtime = request.getParameter("endtime");
			try {
				group_startdate = dfDates.parse(startdate);
				group_enddate = dfDates.parse(enddate);
				group_starttime = dfHours.parse(starttime);
				group_endtime = dfHours.parse(endtime);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String formated_startdate = new_dfDates.format(group_startdate);
			String formated_enddate = new_dfDates.format(group_enddate);

			String formated_starttime = new_dfHours.format(group_starttime);
			String formated_endtime = new_dfHours.format(group_endtime);

			// get choosen weekdays from form as list
			String[] days = request.getParameterValues("weekday");

			// insert new group into database
			try {
				query = "INSERT INTO groups (name,starttime,endtime,startdate,enddate) VALUES (?,?,?,?,?)";
				PreparedStatement pstmt = conn.prepareStatement(query,
						Statement.RETURN_GENERATED_KEYS);

				pstmt.setString(1, group_name);
				pstmt.setString(2, formated_starttime);
				pstmt.setString(3, formated_endtime);
				pstmt.setString(4, formated_startdate);
				pstmt.setString(5, formated_enddate);

				pstmt.executeUpdate();

				ResultSet generatedID = pstmt.getGeneratedKeys();
				if (generatedID.next()) {
					query = "INSERT INTO groups_users (username, group_id) VALUES (?,?)";
					pstmt = conn.prepareStatement(query);
					pstmt.setString(1, thisUser);
					pstmt.setInt(2, generatedID.getInt(1));
					pstmt.executeUpdate();
				}
				query = "INSERT INTO groups_weekdays (group_id, wkday) VALUES (?,?)";
				for (int i = 0; i < days.length; i++) {
					pstmt = conn.prepareStatement(query);
					pstmt.setInt(1, generatedID.getInt(1));
					pstmt.setString(2, days[i]);
					pstmt.executeUpdate();

				}

			} catch (SQLException e) {
				System.out.println(e);
			}

		}
		// sent from main.jsp drop down menu.
		if (request.getParameter("action").equals("setGroup")) {
			int group_id = Integer.parseInt(request.getParameter("group"));
			// String group_name = request.getParameter("group_name");

			session.setAttribute("session_groupID", group_id);
			// session.setAttribute("session_groupName", group_name);

		}

		// populate Group-dropdown menu
		grouplist = EventController.getGroupsDB();
		request.setAttribute("grouplist", grouplist);

		try {
			conn.close();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		// Go back to main.jsp
		try {
			RequestDispatcher rd = request.getRequestDispatcher("main.jsp");
			rd.forward(request, response);
		} catch (ServletException e) {
			System.out.print(e.getMessage());
		} catch (IOException e) {
			System.out.print(e.getMessage());
		}

	}

}

package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Group;

public class GroupUserController extends HttpServlet {
	private Connection conn;

	public void doGet(HttpServletRequest request, HttpServletResponse response) {

		conn = connectDB.connect();
		HttpSession session = request.getSession(true);
		String username = request.getParameter("username");
		int groupID = (int) session.getAttribute("session_groupID");
		String query = "";
		ArrayList<Group> grouplist = new ArrayList<Group>();

		/*
		 * checks that user exists in database checks that user hasnt already
		 * been added to group if these requirements OK, insert new user into
		 * existing group
		 */
		if (request.getParameter("action").equals("addUser")) {
			if (EventController.findUser(username)) {
				if (findUserInGroup(username, groupID)) {
					request.setAttribute("message",
							"Användaren finns redan i Gruppen!");
				} else {
					query = "INSERT INTO groups_users (username, group_id) VALUES (?,?)";
					PreparedStatement pstmt;
					try {
						pstmt = conn.prepareStatement(query);
						pstmt.setString(1, username);
						pstmt.setInt(2, groupID);
						pstmt.executeUpdate();
						request.setAttribute("message",
								"Användaren är inlagd i gruppen");
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			} else {
				request.setAttribute("message", "Användaren finns inte");
			}
			try {
				conn.close();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}

			try {
				RequestDispatcher rd = request
						.getRequestDispatcher("addUser.jsp");
				rd.forward(request, response);
			} catch (ServletException e) {
				System.out.print(e.getMessage());
			} catch (IOException e) {
				System.out.print(e.getMessage());
			}
		}
		if (request.getParameter("action").equals("goBack")) {
			// populate Group-dropdown menu
			grouplist = EventController.getGroupsDB();
			
			request.setAttribute("grouplist", grouplist);

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

	// see if a user is in group
	public Boolean findUserInGroup(String username, int groupID) {
		String query = "";

		try {
			query = "select groups.name from groups inner join groups_users on "
					+ "groups.id = groups_users.group_id where "
					+ "groups_users.username = ? and groups.ID = ?;";

			PreparedStatement stmt = conn.prepareStatement(query);
			stmt.setString(1, username);
			stmt.setInt(2, groupID);
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
}

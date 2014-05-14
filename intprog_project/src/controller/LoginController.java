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

public class LoginController extends HttpServlet {

	private static Connection conn = null;
	private String query;

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		conn = connectDB.connect();

		String username = request.getParameter("username");
		HttpSession session = request.getSession(true);
		session.setAttribute("Username", username);

		if (connectDB.findUser(username)) {
			System.out.println("True");
			
			ArrayList<Event> eventlist = connectDB.getEvents(username);
			ArrayList<Event> daylist = new ArrayList<Event>();
			ArrayList<String> altRoom = new ArrayList<String>();
			String startDay = eventlist.get(0).getStarttime().substring(0, 10);
			for (int i=0; i<eventlist.size()-1; i++){
				if (eventlist.get(i).getStarttime().substring(0, 10).equals(startDay)){
					daylist.add(eventlist.get(i));
				}
			}
			if (daylist.size()>1){
				for (int m=0; m<daylist.size(); m++){
					for (int n=m+1; n<daylist.size(); n++){	
						if (daylist.get(m).getId() == daylist.get(n).getId() ){
							altRoom.add(daylist.get(n).getId() + ":" + daylist.get(n).getRoom());
							daylist.remove(n);
						}
					}
					if(daylist.get(m).getRoom().equals("Saknas")){
						ArrayList<String> altrooms = connectDB.getAltroom(daylist.get(m).getId());
						for (String string:altrooms){
							altRoom.add(string);
						}
					}
				}
			}
			request.setAttribute("daylist", daylist);
			request.setAttribute("altRoom", altRoom);

			try {
				RequestDispatcher rd = request.getRequestDispatcher("map.jsp");
				rd.forward(request, response);
			} catch (ServletException e) {
				System.out.print(e.getMessage());
			}

		} else {
			System.out.println("false");
			try {
				RequestDispatcher rd = request
						.getRequestDispatcher("register.jsp");
				rd.forward(request, response);
			} catch (ServletException e) {
				System.out.print(e.getMessage());
			}

		}

	}

}
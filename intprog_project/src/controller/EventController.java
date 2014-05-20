package controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.ArrayList;
import bean.Event;


import java.net.URL;

import net.fortuna.ical4j.model.*;


public class EventController extends HttpServlet {



	static String formated_starttime;
	static String formated_endtime;
	static String[] split_rooms = null;
	boolean correctUser = false;
	
	static String username_FORM = "";
	static String username;

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		HttpSession session = request.getSession(true);
		username = session.getAttribute("Username").toString();
		if (request.getParameter("action").equals("addUrl")) {
			String input = request.getParameter("url");
			if (connectDB.findUser(username)){
				connectDB.deleteEvents(username);
			}
			setSchemma(input);
			ArrayList<Event> daylist = LoginController.getEvents(username);

			try {
				request.setAttribute("daylist", daylist);
				request.setAttribute("isUser",true);
				RequestDispatcher rd = request.getRequestDispatcher("map.jsp");
				rd.forward(request, response);
			} catch (ServletException e) {
				System.out.print(e.getMessage());
			
		}
			

		}
		}
	
	
	public static void setSchemma(String input){
		try {
			URL schemafile = new URL(input);
			BufferedReader in = new BufferedReader(new InputStreamReader(
					schemafile.openStream(), "UTF-8"));

			String line;
			// Nu har jag lagt in varje rad i en array bara för att få se
			// resultatet på sidan.
			ArrayList<String> schemaList = new ArrayList<String>();
			while ((line = in.readLine()) != null) {
				schemaList.add(line);
			}
			in.close();
			parseCalendartoDB(schemaList);}
		 catch (IOException e) {
			System.out.print(e.getMessage());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		}
	
	
	// end of main function

	// parse calendarobjekt to events and insert them into database.
	private static void parseCalendartoDB(ArrayList<String> schema)
			throws ParseException {
		int event_id = 0;

		String event_name = "";
		String event_description = "";
		java.util.Date event_starttime = null;
		java.util.Date event_endtime = null;
		DateFormat df = new SimpleDateFormat("yyyyMMdd'T'HHmmss'Z'");
		DateFormat new_df = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		df.setTimeZone(TimeZone.getTimeZone("UTC"));

		for (String s : schema) {
			if (s.contains("BEGIN:VEVENT")) {
				split_rooms = null;
				split_rooms = new String[] { "Saknas" };
			}

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
				
				

			} else if (s.contains("END:VEVENT")) {

				System.out.println("\n");

				event_id = connectDB
						.insertEvent(username, event_name, event_description,
								formated_starttime, formated_endtime);

				if(!split_rooms[0].equals("Saknas")){
				for (int i = 0; i < split_rooms.length; i++) {
					connectDB.insertEventsLocation(event_id,
							split_rooms[i].trim());
				}

				}

			}
		}

	}
}

// end of class

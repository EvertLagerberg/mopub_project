package controller;

import javax.servlet.*;
import javax.servlet.http.*;

import java.io.IOException;

import java.util.ArrayList;

import controller.connectDB;


import bean.Event;



public class LoginController extends HttpServlet {

	String username;
	 // If the controller are beeing call with a Get-request - like from URL
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession(true);
		//if there is no session cookie called "username"
		if(null == session.getAttribute("username")){ 
			//go to loggin
			System.out.println("nudu");
			req.setAttribute("daylist", null);
			req.setAttribute("isUser",true);
			req.setAttribute("existUser",false);
			RequestDispatcher rd = req.getRequestDispatcher("map.jsp");
			rd.forward(req, resp);
			}
		username = session.getAttribute("Username").toString();
		//if a user exist in the database
		if (connectDB.findUser(username)) {	
			ArrayList<Event> daylist = getEvents(username); 
			req.setAttribute("daylist", daylist);
			try {
				//Go to map
				req.setAttribute("isUser",true);
				req.setAttribute("existUser",true);
				RequestDispatcher rd = req.getRequestDispatcher("map.jsp");
				rd.forward(req, resp);
			} catch (ServletException e) {
				System.out.print(e.getMessage());
			}

		}
		else{
			//Go to the map, and get relinked to the url site
				System.out.println("false");
				try {
					req.setAttribute("isUser",false);
					req.setAttribute("existUser",true);
					RequestDispatcher rd = req.getRequestDispatcher("map.jsp");
					rd.forward(req, resp);
				} catch (ServletException e) {
					System.out.print(e.getMessage());
				}
		}
    }
	// in post request
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {	
		HttpSession session = request.getSession(true);
		session.setAttribute("Username", username);
		// If username exist in database
		if (connectDB.findUser(username)) {	
			ArrayList<Event> daylist = getEvents(username); 
			request.setAttribute("daylist", daylist);
			try {
				// Go to the map
				request.setAttribute("isUser",true);
				request.setAttribute("existUser",true);
				RequestDispatcher rd = request.getRequestDispatcher("map.jsp");
				rd.forward(request, response);
			} catch (ServletException e) {
				System.out.print(e.getMessage());
			}

		}
		else{
			// Go to the add-cal page if username dont exist in d
				System.out.println("false");
				try {
					request.setAttribute("isUser",false);
					request.setAttribute("existUser",true);
					RequestDispatcher rd = request.getRequestDispatcher("map.jsp");
					rd.forward(request, response);
				} catch (ServletException e) {
					System.out.print(e.getMessage());
				}
		}
		} 
		public static ArrayList<Event> getEvents(String username){
				ArrayList<Event> eventlist = connectDB.getEvents(username);
				ArrayList<Event> daylist = new ArrayList<Event>();
				if (eventlist.size()>0){
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
								if(! daylist.get(n).getRoom().equals("Saknas")){
								    daylist.get(m).setAltroom(daylist.get(n).getRoom());
								}
								daylist.remove(n);
								
							}
						}
						if(daylist.get(m).getRoom().equals("Saknas")){
							ArrayList<String> altrooms = connectDB.getAltroom(daylist.get(m).getId());
							for (String string:altrooms){
								daylist.get(m).setAltroom(string);
							}
						}
					}
				}
				for (Event ev :daylist){
					System.out.println(ev.getAltroom());
				}
				}
				return daylist;
	}
}

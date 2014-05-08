package controller;

import java.io.BufferedReader;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.nio.channels.Channels;
import java.nio.channels.ReadableByteChannel;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class UrlController extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response){
		if(request.getParameter("action").equals("addUrl")){
			String input = request.getParameter("url");
			try{
				URL schemafile = new URL(input);
				BufferedReader in = new BufferedReader(new InputStreamReader(schemafile.openStream()));

				String line;
				// Nu har jag lagt in varje rad i en array bara för att få se resultatet på sidan. 
				ArrayList<String> schemaList= new ArrayList<String>();
				while ((line = in.readLine()) != null){
					schemaList.add(line);
				}
				in.close();

				request.setAttribute("schemaList", schemaList);

				RequestDispatcher rd2 =
						request.getRequestDispatcher("register.jsp");
				rd2.forward(request, response);
			}
			catch(ServletException e){
				System.out.print(e.getMessage());
			}
			catch(IOException e){
				System.out.print(e.getMessage());
			}


		}
	}
}



package controller;


import org.jsoup.Jsoup;
import org.jsoup.helper.Validate;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

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

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import controller.connectDB;

import java.sql.PreparedStatement;
import java.io.IOException;
import java.util.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import bean.Event;

import bean.Location;


import java.sql.Timestamp;


public class LocationController extends HttpServlet {



	ArrayList<Location> locationlist = new ArrayList();
	ArrayList<String> nodata = new ArrayList<String>();

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
	   	String room = "";
    	double longitude = 0;
    	double latitude = 0;
    	int totalcount = 0;
    	int nodata_count = 0;
    	int success_count =0;
 
    	
        String url = "http://www.kth.se/places/search/?query=";
        System.out.println("Fetching %s..." + url);
     

        Document doc = Jsoup.connect(url).get();
        Elements links = doc.select("a[href]");
        Elements media = doc.select("[src]");
        Elements imports = doc.select("link[href]");

        System.out.println("\nLinks: (%d)" + links.size());
        connectDB.insertSaknasLocation();
        for (Element link : links) {
        	Boolean correct = true;
            //System.out.println(" * a: <%s>  (%s)", link.attr("abs:href"), trim(link.text(), 35));
            Document page = Jsoup.connect(link.attr("abs:href")).get();
            for(Element meta : page.select("meta[name=fn]")) {
            	totalcount++;
            	System.out.println("Totacount" + totalcount);
            	
            	if(meta.attr("content").length()>1){
                //System.out.System.out.printlnln("Name: " + meta.attr("name") + " - Content: " + meta.attr("content"));
                room = meta.attr("content");
                
            	} else {
            		correct = false;
            	}
            }
            for(Element meta : page.select("meta[name=longitude]")) {
                //System.out.System.out.printlnln("Name: " + meta.attr("name") + " - Content: " + meta.attr("content"));
               
                if(meta.attr("content").length()>1){
                		longitude = Float.parseFloat(meta.attr("content"));
                } else {
                	longitude = 0;
                	correct = false;
                }
            }
            for(Element meta : page.select("meta[name=latitude]")) {
                //System.out.System.out.printlnln("Name: " + meta.attr("name") + " - Content: " + meta.attr("content"));
                if(meta.attr("content").length()>1){
                latitude = Float.parseFloat(meta.attr("content"));
                
                } else {
                	latitude = 0;
                	correct = false;
                }
                if(correct){
                	
            		connectDB.insertLocation(room,longitude,latitude);
                	
                    System.out.println(room + longitude + ":" + latitude);
                    success_count++;
                    
                    } else {
                    nodata.add(room);
                    nodata_count++;
                    
                    }
                if (room.equals("Stacken")){
                	System.out.println("Geodata could not be found for the following rooms");
                	for(int i=0; i<nodata.size();i++){
                		System.out.println(nodata.get(i));
                	}
                    System.out.println("Total rooms handled: " + totalcount);
                    System.out.println("DataSuccess:" + success_count);
                    System.out.println("Datafailed: " + nodata_count);
                	break;
                }
            }

        }
        System.out.println("här");
    




		try {
			RequestDispatcher rd = request.getRequestDispatcher("getLocations.jsp");

			rd.forward(request, response);
		} catch (ServletException e) {
			System.out.print(e.getMessage());
		} catch (IOException e) {
			System.out.print(e.getMessage());
		}

		// end of doGet
	}





	// end of class
}


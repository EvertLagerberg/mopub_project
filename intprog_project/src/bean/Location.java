package bean;

import java.sql.Connection;

public class Location {

	private String room;
	private Float longitude;
	private Float latitude;

	

	public Location() {
	}

	public void setRoom(String u) {
		this.room = u;
	}

	public void setLongitude(Float u) {
		this.longitude = u;
	}

	public void setLatitude(Float u) {
		this.latitude = u;
	}

	public String getRoom() {
		return room;
	}

	public Float getLongitude() {
		return longitude;
	}

	public Float getLatitude() {
		return latitude;
	}

	// end of class
}
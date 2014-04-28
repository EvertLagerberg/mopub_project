package bean;

import java.sql.Connection;

public class User {

	private String username;
	private String usermail;
	private String userUrl;

	private Connection conn = null;

	public User() {
	}

	public void setUsername(String u) {
		this.username = u;
	}

	public void setUsermail(String u) {
		this.usermail = u;
	}

	public void setUserUrl(String u) {
		this.userUrl = u;
	}

	public String getUsername() {
		return username;
	}

	public String getUsermail() {
		return usermail;
	}

	public String getUserUrl() {
		return usermail;
	}

	// end of class
}
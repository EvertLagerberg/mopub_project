package controller;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
//dsfsd
public class connectDB {
	private static DataSource dataSource;
	private static Connection conn = null;

	public static Connection connect() {

		try {
			Database("jdbc/db");
			conn = dataSource.getConnection();

			System.out.println("Database connection established");

		} catch (Exception e) {

			System.err.println("Cannot connect to database server");
			e.printStackTrace();

		}
		return conn;

	}

	public static void Database(String jndiname) {
		try {
			dataSource = (DataSource) new InitialContext()
					.lookup("java:comp/env/" + jndiname);
		} catch (NamingException e) {
			// Handle error that it's not configured in JNDI.
			throw new RuntimeException(jndiname + " is missing in JNDI!", e);
		}
	}

	public Connection getConnection() throws SQLException {
		return dataSource.getConnection();
	}

}

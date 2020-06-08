package dbConn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBCon {
	private static final String DRIVER = "com.mysql.jdbc.Driver";
	private static final String URL = "jdbc:mysql://localhost:3306/db";
	private static final String USER_NAME = "root";
	private static final String PASS_WORD = "123";

	public static Connection getConnection() {
		Connection con = null;
		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER_NAME, PASS_WORD);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}

}

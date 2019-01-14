package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DButil {
	private static String URL = "jdbc:mysql://localhost:3306/dbms1?useSSL=false&serverTimezone=Hongkong";
	private static String USER = "root";
	private static String PASSWORD = "woaini";
	public Connection conn = null;

	public void connect() throws Exception {
		// 1.������������
		Class.forName("com.mysql.cj.jdbc.Driver");
		// 2. ������ݿ�����
		conn = DriverManager.getConnection(URL, USER, PASSWORD);
	}

	public void close() throws Exception {
		conn.close();
	}

	public static void main(String[] args) throws Exception {
		DButil db = new DButil();
		db.connect();
		db.close();
	}
}

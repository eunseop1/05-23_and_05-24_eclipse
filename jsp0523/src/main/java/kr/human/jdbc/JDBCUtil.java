package kr.human.jdbc;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class JDBCUtil {
	public static Connection getConnection() {
		Connection conn = null;
		Context initContext;
		try {
			initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			DataSource ds;
			ds = (DataSource) envContext.lookup("jdbc/myoracle");
			conn = ds.getConnection();
			
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}
	
	public static void close(Connection conn) {
		try {
			if(conn != null) conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static void close(Statement stmt) {
		try {
			if(stmt != null) stmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static void close(ResultSet rs) {
		try {
			if(rs != null) rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static void rollback(Connection conn) {
		try {
			if(conn != null) conn.rollback();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	/*
	web.xml에 있으니 지운다
		String driverClass="oracle.jdbc.driver.OracleDriver";
		String url="jdbc:oracle:thin:@127.0.0.1:1521:XE";
		String user="jspuser";
		String password="123456";
		*/

	// 1. 드라이버를 로드한다.
	//Class.forName(driverClass);

	Connection conn = null;
	try {
		// 2. 연결한다.
		Context initContext = new InitialContext();
		Context envContext = (Context) initContext.lookup("java:/comp/env");
		DataSource ds = (DataSource) envContext.lookup("jdbc/myoracle");
		conn = ds.getConnection();

		//conn = DriverManager.getConnection(url, user, password);

		conn.setAutoCommit(false);
		// 3. 사용한다.
		out.println("연결 성공 : " + conn);

		conn.commit();
	} catch (Exception e) {
		conn.rollback();
		e.printStackTrace();
	} finally {
		// 4. 닫는다.(반납한다)
		conn.close();
	}
	%>
</body>
</html>
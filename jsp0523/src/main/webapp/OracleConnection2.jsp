<%@page import="kr.human.jdbc.JDBCUtil"%>
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


	// 1. 드라이버를 로드한다.
	Connection conn = null;
	try {
		// 2. 연결한다.
		conn = JDBCUtil.getConnection();
		conn.setAutoCommit(false);
		// 3. 사용한다.
		out.println("연결 성공 : " + conn);

		conn.commit();
	} catch (Exception e) {
		conn.rollback();
		e.printStackTrace();
	} finally {
		// 4. 닫는다.(반납한다)
		JDBCUtil.close(conn);
	}
	%>
</body>
</html>
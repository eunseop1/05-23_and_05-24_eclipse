<%@page import="kr.human.ibatis.IbatisApp"%>
<%@page import="com.ibatis.sqlmap.client.SqlMapClient"%>
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
	SqlMapClient sqlMapClient = IbatisApp.getSqlMapClient();

	sqlMapClient.startTransaction();
	String today = (String)sqlMapClient.queryForObject("test.selectToday");
%>
</body>
</html>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jdbc test</title>
</head>
<body>
<%
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/jspdb?useUnicode=true&characterEncoding=utf-8";
	String user = "root";
	String pwd = "12345";
	
	Connection conn = null;
	
	try{
		Class.forName(driver);
		conn = DriverManager.getConnection(url, user, pwd);
		out.println("데이터베이스 연결이 성공했습니다.<br>");
	}catch(Exception e){
		out.println("데이터베이스 연결이 실패했습니다.");
		e.getMessage();
	}
%>
</body>
</html>
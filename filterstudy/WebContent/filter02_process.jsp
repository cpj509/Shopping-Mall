<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>filter 예제</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
	%>
	<p>폼에 입력 된 아이디 : <%=id %></p>
	<p>폼에 입력 된 패스워드 : <%=pwd %></p>

</body>
</html>
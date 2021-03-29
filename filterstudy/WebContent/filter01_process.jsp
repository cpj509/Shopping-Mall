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
		String name = request.getParameter("name");
	%>
	<p>폼에 입력 된 값 : <%=name %></p>

</body>
</html>
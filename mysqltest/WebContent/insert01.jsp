<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="insertProcess.jsp" method="post">
		<p>번호 : <input type="text" name="id" required="required"/></p>
		<p>이름 : <input type="text" name="name" required="required"/></p>
		<p>비밀번호 : <input type="text" name="passwd" required="required"/></p>
		<input type="submit" />
		<input type="reset" />
	</form>
</body>
</html>
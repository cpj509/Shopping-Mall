<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>welcome</title>
<link rel="stylesheet" href="resources/css/bootstrap.css" />
</head>
<body>
	<jsp:include page="menu.jsp"></jsp:include>
	<%!
		/* 변수 선언 */
		String greeting = "Welcome to Web Shopping Mall";
		String tagline = "Welcome to Web Market!";
	%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3"><%=greeting %></h1>
		</div>
	</div>
	<div class="container">
		<div class="text-center">
			<h3>
				<%= tagline %>
				<%-- <h3><%>out.println(tagline);</%></h3> --%>
			</h3>
			<%
					Date day = new Date();
					String am_pm = "";
					int hour = day.getHours();
					int minute = day.getMinutes();
					int second = day.getSeconds();
					if(hour / 12 == 0)
						am_pm = "AM";
					else{
						am_pm = "PM";
						hour = hour - 12;
					}
					
					String CT = am_pm + " " + hour + "시 " + minute + "분 " + second + "초 ";
					response.setIntHeader("Refresh", 5);
					out.println("현재 접속 시각 : " + CT);
			%>
		</div>
		<hr />
	</div>
	<%@ include file="./footer.jsp" %>

</body>
</html>
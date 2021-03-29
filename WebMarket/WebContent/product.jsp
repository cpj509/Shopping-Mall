<%@page import="dao.ProductRepository"%>
<%@page import="dto.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="exceptionNoProductId.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세 정보</title>
<link rel="stylesheet" href="resources/css/bootstrap.css" />
</head>
<body>
	<jsp:include page="menu.jsp"></jsp:include>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 정보</h1>
		</div>
	</div>
	<%
		//제품 id 받기
		String id = request.getParameter("id");
	
		//dao - getProductById() 호출
		ProductRepository dao = ProductRepository.getInstance();
		
		Product product = dao.getProductById(id);
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<img src="./upload/<%=product.getFilename() %>" style="width: 100%" />
			</div>
			<div class="col-md-4">
				<h3><%=product.getPname() %></h3>
				<p><%=product.getDescription() %></p>
				<p><b>상품 코드 : </b><span class="badge badge-danger">
					<%=product.getProductId() %></span></p>
					<p><b>제조사</b> : <%=product.getManufacturer() %></p>
					<p><b>분류</b> : <%=product.getCategory() %></p>
					<p><b>재고 수</b> : <%=product.getUnitsInStock() %></p>
					<h4><%=product.getUnitPrice() %></h4>
					<p><a href="#" class="btn btn-info">상품 주문 &raquo;</a></p>
					<a href="./products.jsp" class="btn btn-seondary">상품 목록 &raquo;</a>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
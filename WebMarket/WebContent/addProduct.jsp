<%@page import="dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
<link rel="stylesheet" href="resources/css/bootstrap.css" />
</head>
<body>
	<jsp:include page="./menu.jsp"></jsp:include>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 등록</h1>
		</div>
	</div>
	<div class="container">
		<form name="newProduct" action="./processAddProduct.jsp" method="post" class="form-horizontal" enctype="multipart/form-data">
			<div class="form-group row">
				<label class="col-md-2">상품 코드</label>
				<div class="col-md-3">
					<input type="text" name="productId" class="form-control"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-md-2">상품명</label>
				<div class="col-md-3">
					<input type="text" name="pname" class="form-control"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-md-2">가격</label>
				<div class="col-md-3">
					<input type="text" name="unitPrice" class="form-control"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-md-2">상세 정보</label>
				<div class="col-md-5">
					<textarea rows="2" cols="50" name="description" class="form-control"></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-md-2">제조사</label>
				<div class="col-md-3">
					<input type="text" name="manufacturer" class="form-control"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-md-2">분류</label>
				<div class="col-md-3">
					<input type="text" name="category" class="form-control"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-md-2">재고 수</label>
				<div class="col-md-3">
					<input type="text" name="unitInStock" class="form-control"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-md-2">상태</label>
				<div class="col-md-5">
					<input type="radio" name="condition" value="New"/>신규 제품
					<input type="radio" name="condition" value="Old"/>중고 제품
					<input type="radio" name="condition" value="Refurbished"/>재생 제품
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">이미지</label>
				<div class="col-sm-5">
					<input type="file" name="productImage" class="form-control"/>
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" class="btn btn-primary" value="등록" />
				</div>
			</div>
		</form>
	</div>
	<jsp:include page="./footer.jsp"></jsp:include>
</body>
</html>
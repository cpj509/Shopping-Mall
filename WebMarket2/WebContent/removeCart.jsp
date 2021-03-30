<%@page import="dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	if(id == null || id.trim().equals("")){
		response.sendRedirect("products.jsp");
		return;
	}
	
	//	주문 제품의 객체 가져오기
	ProductRepository dao = ProductRepository.getInstance();
	
	Product product = dao.getProductById(id);
	if (product == null) {
		response.sendRedirect("exceptionNoProductId.jsp");
	}
	
	//	세션 발급 및 유지
	ArrayList<Product> list = (ArrayList<Product>)session.getAttribute("cartlist");	//	장바구니 리스트에서 세션 가져와서 유지
	Product goodsQnt = new Product();
	
	for (int i = 0; i < list.size(); i++) { // 상품리스트 하나씩 출력하기
		goodsQnt = list.get(i);
		if (goodsQnt.getProductId().equals(id)) {
			list.remove(goodsQnt);
		}
	}
	
	response.sendRedirect("cart.jsp");
%>
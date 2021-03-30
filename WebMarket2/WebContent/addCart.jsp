<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>
<%
	String id = request.getParameter("id");
	if (id == null || id.trim().equals("")) {	//trim() 공백 제거
		response.sendRedirect("products.jsp");
		return;
	}

	ProductRepository dao = ProductRepository.getInstance();

	Product product = dao.getProductById(id);
	if (product == null) {
		response.sendRedirect("exceptionNoProductId.jsp");
	}

	//	주문 제품의 객체 가져오기
	ArrayList<Product> goodsList = dao.getAllProducts();
	Product goods = new Product();
	for (int i = 0; i < goodsList.size(); i++) {
		goods = goodsList.get(i);
		if (goods.getProductId().equals(id)) { 			
			break;
		}
	}
	//	세션 발급 및 유지
	ArrayList<Product> list = (ArrayList<Product>) session.getAttribute("cartlist");	//장바구리 리스트에서 세션 가져와서 유지
	if (list == null) { 
		list = new ArrayList<Product>();
		session.setAttribute("cartlist", list);
	}
	//	계산(제품의 개수)
	int cnt = 0;
	
	for(Product goodsQnt : list){
		if (goodsQnt.getProductId().equals(id)) {
			cnt++;
			int orderQuantity = goodsQnt.getQuantity() + 1;
			goodsQnt.setQuantity(orderQuantity);
		}
	}
	
	/*Product goodsQnt = new Product();
	for (int i = 0; i < list.size(); i++) {
		goodsQnt = list.get(i);
		if (goodsQnt.getProductId().equals(id)) {
			cnt++;
			int orderQuantity = goodsQnt.getQuantity() + 1;
			goodsQnt.setQuantity(orderQuantity);
		}
	}*/
	//	첫 주문 시 1 저장
	if (cnt == 0) { 
		goods.setQuantity(1);
		list.add(goods);
	}

	response.sendRedirect("product.jsp?id=" + id);
%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="dto.Product"%>
<%@page import="dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	//String realFolder = "C:\\Users\\JMP Korea\\Documents\\Shopping-Mall\\WebMarket\\WebContent\\upload";
	String realFolder = "D:\\GitHub\\Shopping-Mall\\WebMarket\\WebContent\\upload";
	int maxSize = 5 * 1024 * 1024;
	String encType = "utf-8";
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

	//폼의 입력 자료 수집
	String productId = multi.getParameter("productId");
	String pname = multi.getParameter("pname");
	String unitPrice = multi.getParameter("unitPrice");
	String description = multi.getParameter("description");
	String manufacturer = multi.getParameter("manufacturer");
	String category = multi.getParameter("category");
	String unitsInStock = multi.getParameter("unitsInStock");
	String condition = multi.getParameter("condition");
	
	//가격
	Integer price;
	
	if(unitPrice.isEmpty())
		price = 0;
	else
		price = Integer.valueOf(unitPrice);	//String으로 넘어온 값 형 변환
	
	//재고 수
	long stock;
	
		if(unitsInStock.isEmpty())
		stock = 0;
	else
		stock = Long.valueOf(unitsInStock);
	
	//파일 가져오기
	Enumeration<String> files = multi.getFileNames();	//파일을 넘겨받음.
	String fname = files.nextElement();
	String filename = multi.getFilesystemName(fname);	//파일을 가져옴.
		
	//dao 처리
	ProductRepository dao = ProductRepository.getInstance();
	
	Product newProduct = new Product();
	newProduct.setProductId(productId);
	newProduct.setPname(pname);
	newProduct.setUnitPrice(price);	//형 변환 해준 값을 set
	newProduct.setDescription(description);
	newProduct.setManufacturer(manufacturer);
	newProduct.setCategory(category);
	newProduct.setUnitsInStock(stock);	//형 변환 해준 값을 set
	newProduct.setCondition(condition);
	newProduct.setFilename(filename);
	
	dao.addProduct(newProduct);
	response.sendRedirect("./products.jsp");
%>
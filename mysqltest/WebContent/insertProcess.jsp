<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
<%
	//	회원 추가
	//	폼 자료 수집
	request.setCharacterEncoding("utf-8");
	int id = Integer.parseInt(request.getParameter("id"));
	String name = request.getParameter("name");
	String passwd = request.getParameter("passwd");
	
	PreparedStatement pstmt = null;
	
	try{
		String sql = "insert into t_member(id, name, passwd) values (?, ?, ?)";
		pstmt = conn.prepareStatement(sql);
		//	set() - 데이터 바인딩
		pstmt.setInt(1, id);
		pstmt.setString(2, name);
		pstmt.setString(3, passwd);
		//	쿼리 실행
		pstmt.executeUpdate();
		out.println("<script>alert('데이터를 추가했습니다.'); location.href='select01.jsp'</script>");
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(pstmt != null)
			pstmt.close();
		if(conn != null)
			conn.close();
	}
%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
<%
	/* t_member 자료 검색 */
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		String sql = "select * from t_member";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();	//	쿼리 실행
		while(rs.next()){
			out.println("번호 : " + rs.getInt("id"));
			out.println(", 이름 : " + rs.getString("name"));
			out.println(", 비밀번호 : " + rs.getString("passwd") + "<br>");
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(pstmt != null)
			pstmt.close();
		if(conn != null)
			conn.close();
		if(rs != null)
			rs.close();
	}
%>
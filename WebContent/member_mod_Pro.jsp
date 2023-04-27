<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	String mem_id = (String) session.getAttribute("uid");
	String mem_pw = request.getParameter("pw1");
	String mem_name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	String addr = request.getParameter("addr");

	String driver = "org.postgresql.Driver";
	String url = "jdbc:postgresql://localhost/pro1";
	String user = "postgres";
	String pass = "1234";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String sql = "";
	
	try{
		Class.forName(driver);
		try{
			conn = DriverManager.getConnection(url, user, pass);
			sql = "update member_tbl set mem_pw=?, mem_name=?, phone=?, email=?, addr=? where mem_id=?";
			try{
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mem_pw);
				pstmt.setString(2, mem_name);
				pstmt.setString(3, phone);
				pstmt.setString(4, email);
				pstmt.setString(5, addr);
				pstmt.setString(6, mem_id);
				int i = pstmt.executeUpdate();
				
				if (i >0){
					response.sendRedirect("mypage.jsp");
				} else {
					response.sendRedirect("mypage.jsp");
				}
				pstmt.close();
				conn.close();
			} catch(Exception e){
				System.out.println("DB 실행 중 오류");	
			}
		} catch(Exception e){
			System.out.println("DB 연결 오류");
		}
	} catch(Exception e){
		System.out.println("드라이버 연결 오류");
	}
%>	
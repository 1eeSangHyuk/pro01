<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw1");
	String name = request.getParameter("name");
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
			sql = "insert into member_tbl values(?, ?, ?, ?, ?, ?, default)";
			try{
				pstmt = conn.prepareStatement(sql);
 				pstmt.setString(1, id);
				pstmt.setString(2, pw);
				pstmt.setString(3, name);
				pstmt.setString(4, phone);
				pstmt.setString(5, email);
				pstmt.setString(6, addr);
				int i = pstmt.executeUpdate();
				if (i>0){
					response.sendRedirect("login.jsp");
				} else{
					response.sendRedirect("submit.jsp");
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	int board_id = Integer.parseInt(request.getParameter("board_id"));

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
			sql = "delete from board where board_id=?";
			try{
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, board_id);
				int i = pstmt.executeUpdate();
				
				if (i >0){
					response.sendRedirect("../admin/community.jsp");
				} else {
					response.sendRedirect("../admin/communityDetail.jsp");
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
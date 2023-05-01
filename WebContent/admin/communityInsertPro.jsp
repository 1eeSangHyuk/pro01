<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text html; charset=utf-8");

	String board_title = request.getParameter("board_title");
	String board_context = request.getParameter("board_context");
	String mem_id = (String) session.getAttribute("uid");

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
			sql = "Insert into board values(default,?,?,?,default)";
			try{
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, board_title);
				pstmt.setString(2, board_context);
				pstmt.setString(3, mem_id);

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
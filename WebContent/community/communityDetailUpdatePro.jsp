<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text html; charset=utf-8");

	int board_id = Integer.parseInt(request.getParameter("board_id"));
	String board_title = request.getParameter("board_title");
	String board_context = request.getParameter("board_context");


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
			sql = "update board set board_title=?, board_context=? where board_id=?";
			try{
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, board_title);
				pstmt.setString(2, board_context);
				pstmt.setInt(3, board_id);

				int i = pstmt.executeUpdate();
				
				if (i >0){
					response.sendRedirect("./community.jsp#page1");
				} else {
					response.sendRedirect("./community_detail.jsp");
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
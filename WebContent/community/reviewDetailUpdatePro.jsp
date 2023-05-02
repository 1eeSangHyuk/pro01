<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text html; charset=utf-8");

	String review_no = request.getParameter("review_no");
	String review_title = request.getParameter("review_title");
	String review_context = request.getParameter("review_context");


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
			sql = "update review set review_title=?, review_context=? where review_no=?";
			try{
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, review_title);
				pstmt.setString(2, review_context);
				pstmt.setString(3, review_no);

				int i = pstmt.executeUpdate();
				
				if (i >0){
					response.sendRedirect("./community.jsp#page2");
				} else {
					response.sendRedirect("./reviewDetail.jsp");
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
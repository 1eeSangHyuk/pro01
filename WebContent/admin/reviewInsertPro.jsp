<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text html; charset=utf-8");

	String prod_no = request.getParameter("prod_no");
	String review_title = request.getParameter("review_title");
	String review_context = request.getParameter("review_context");
	String writer = (String) session.getAttribute("uid");

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
			sql = "Insert into review values(default,?,?,?,?,default)";
			try{
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, prod_no);
				pstmt.setString(2, review_title);
				pstmt.setString(3, review_context);
				pstmt.setString(4, writer);

				int i = pstmt.executeUpdate();
				
				if (i >0){
					response.sendRedirect("../admin/community.jsp#page2");
				} else {
					response.sendRedirect("../admin/reviewDetail.jsp");
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
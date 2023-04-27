<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");

	String driver = "org.postgresql.Driver";
	String url = "jdbc:postgresql://localhost/pro1";
	String user = "postgres";
	String pass = "1234";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "";
	
	try{
		Class.forName(driver);
		try{
			conn = DriverManager.getConnection(url, user, pass);
			sql = "select * from member_tbl where mem_id=? and mem_pw=?";
			try{
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "id");
				pstmt.setString(2, "pw");
				rs = pstmt.executeQuery();
				while(rs.next()){
					session.setAttribute("uid", rs.getString("mem_id"));
					session.setAttribute("upw", rs.getString("mem_pw"));
				}
				response.sendRedirect("index.jsp");
				rs.close();
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
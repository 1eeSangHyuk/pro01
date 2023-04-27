<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	String id = request.getParameter("id");
	
	String driver = "org.postgresql.Driver";
	String url = "jdbc:postgresql://localhost/pro1";
	String user = "postgres";
	String pass = "1234";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "";
	
	String uid = "";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
</style>
</head>
<body>
<input type="hidden" id="id" value="<%=id %>">
<%
	try{
		Class.forName(driver);
		try{
			conn = DriverManager.getConnection(url, user, pass);
			sql = "select * from member_tbl where mem_id=?";
			try{
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();

				if(rs.next()){
%>
	<h3><%=id %> : 사용할 수 없는 아이디입니다.</h3>
	<input type="hidden" name="idCk" id="idCk" value="no">
	<input type="hidden" name="msg" id="msg" value="사용할 수 없는 아이디입니다.">
<%
				} else {
%>
	<h3><%=id %> : 사용할 수 있는 아이디입니다.</h3>
	<input type="hidden" name="idCk" id="idCk" value="yes">
	<input type="hidden" name="msg" id="msg" value="사용할 수 있는 아이디입니다.">
<%
				}
%>
	<button type="button" onclick="close_window()">닫기</button>
	<script>
	function close_window(){
		opener.document.gerElementById("id").value = document.getElementById("id").value;
		opener.document.getElementById("idCk").value = document.getElementById("idCk").value;
		opener.document.getElementById("msg").value = document.getElementById("msg").value;
		if (document.getElementById("idck").value == "yes"){
			opener.document.getElementById("id").setAttribute("readonly", true);
		}
		window.close();
	}
	</script>
</body>
</html>
<%
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
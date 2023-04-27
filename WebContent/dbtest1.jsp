<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	String driver = "org.postgresql.Driver";
	String url = "jdbc:postgresql://localhost/pro1";
	String user = "postgres";
	String pass = "1234";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String mem_id = "";
	String mem_pw = "";
	String mem_name = "";
	String phone = "";
	String email = "";
	
	String sql = "";
	
	try{
		Class.forName(driver);
		try{
			conn = DriverManager.getConnection(url, user, pass);
			sql = "select * from member_tbl";
			try{
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
.title {text-align:center;}
.table, .msg { width:1000px; margin: 0 auto;}
</style>
</head>
<body>
	<nav>
		<a href="../index.jsp">메인 페이지로</a>
	</nav>
	<hr><br>
	<table class="table">
		<thead>
			<tr>
				<th>id</th><th>pw</th><th>name</th><th>phone</th><th>email</th>
			</tr>
		</thead>
		<tbody>
<%
				while(rs.next()){
					mem_id = rs.getString("mem_id");
					mem_pw = rs.getString("mem_pw");
					mem_name = rs.getString("mem_name");
					phone = rs.getString("phone");
					email = rs.getString("email");
					
%>
			<tr>
				<td><%=mem_id %></td>
				<td><%=mem_pw %></td>
				<td><%=mem_name %></td>
				<td><%=phone %></td>
				<td><%=email %></td>
			</tr>
<%
				}
%>		
		</tbody>
	</table>
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
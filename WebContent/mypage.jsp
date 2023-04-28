<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	String path = request.getContextPath();

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
	String addr = "";
	
	String sql = "";
	
	try{
		Class.forName(driver);
		try{
			conn = DriverManager.getConnection(url, user, pass);
			sql = "select * from member_tbl where mem_id=?";
			try{
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, (String) session.getAttribute("uid"));
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					mem_id = rs.getString("mem_id");
					mem_pw = rs.getString("mem_pw");
					mem_name = rs.getString("mem_name");
					phone = rs.getString("phone");
					email = rs.getString("email");
					addr = rs.getString("addr");
				}
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
<!DOCTYPE html>
<html>
<head>
	<link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Poppins:wght@900&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" rel="stylesheet">
	<link rel="stylesheet" href="common.css">
<meta charset="UTF-8">
<title>Insert title here</title>
	
<style>
.title {text-align:center;}
.table, .msg { width:1000px; margin: 0 auto;}
#page4 { height: 200px; }
</style>
</head>
<body>
<%@ include file="header.jsp" %>
<div class="container">
	<div class="content">
        <section class="page" id="page4">
            <h2 class="page_title">페이지제목0</h2>
            <div class="page_wrap">
                <h2>000a0a</h2>
            </div>
        </section>        
		<section class="page">
			<table>
				<tbody>
					<tr>
						<th>아이디</th>
						<td><%=mem_id %></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><%=mem_pw %></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><%=mem_name %></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td><%=phone %></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><%=email %></td>
					</tr>
					<tr>
						<th>주소</th>
						<td><%=addr %></td>
					</tr>
					<tr>
						<td colspan="2">
							<a href="<%=path %>/member_mod.jsp?id=<%=mem_id %>">회원정보 수정하기</a> &nbsp; &nbsp; &nbsp; &nbsp;
							<a href="<%=path %>/member_del.jsp?id=<%=mem_id %>">회원 탈퇴하기</a>
						</td>
					</tr>
				</tbody>
			</table>
		</section>
	<%@ include file="footer.jsp" %>
	</div>
</div>
</body>
</html>

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
	
	String mem_id = request.getParameter("mem_id");
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
				pstmt.setString(1, mem_id);
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
    <link rel="stylesheet" href="<%=path %>/common.css">
	<link rel="stylesheet" href="<%=path %>/main.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.content { min-height:500px; }
	.table { width: 500px; }
</style>
</head>
<body>
<%@ include file="./headerAdmin.jsp" %>
<div class="content">
    <section class="page" id="page1">
    	<div class="page_wrap">
    		<h2 class="page_title">회원정보 수정</h2>
			<form name="join_form" action="memberModPro.jsp" method="post" onsubmit="return formCheck()">
				<table class="table">
					<tbody>
						<tr>
							<th><label for="id">아이디 : <%=mem_id %></label></th>
						</tr>
						<tr>
							<th><label for="pw1">비밀번호</label></th>
							<td><input type="password" name="pw1" id="pw1" required></td>
						</tr>
						<tr>
							<th><label for="pw2">비밀번호 확인</label></th>
							<td><input type="password" name="pw2" id="pw2" required></td>
						</tr>
						<tr>
							<th><label for="name">이름</label></th>
							<td><input type="text" name="name" id="name" required></td>
						</tr>
						<tr>
							<th><label for="phone">전화번호</label></th>
							<td><input type="text" name="phone" id="phone"></td>
						</tr>
						<tr>
							<th><label for="email">이메일</label></th>
							<td><input type="text" name="email" id="email"></td>
						</tr>
						<tr>
							<th><label for="addr">주소</label></th>
							<td><input type="text" name="addr" id="addr"></td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="submit" value="회원정보 수정"> &nbsp; &nbsp; &nbsp; &nbsp;
								<input type="reset" value="취소">
							</td>
						</tr>
					</tbody>
				</table>
			</form>
			<script>
			function formCheck(s){
				if (s.pw1.value != s.pw2.value){
					alert("비밀번호가 서로 일치하지 않습니다.");
					/* 밑에 문구 띄우기 */
					return false;
				}
	/* 			if (s.idCk.value != "no"){
					alert("ID 중복체크를 완료해주세요.");
					s.id.focus();
				} */
			}
			</script>
		</div>
	</section>
	<%@ include file="../footer.jsp" %>
</div>
</body>
</html>
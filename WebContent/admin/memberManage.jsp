<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	String path = request.getContextPath();

	String driver = "org.postgresql.Driver";
	String url = "jdbc:postgresql://localhost/pro1";
	String user = "postgres";
	String pass = "1234";

	String sql = "";
	String uid_c = "";
	if (session.getAttribute("uid") != ""){
		uid_c = (String) session.getAttribute("uid");
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
.title {text-align:center;}
.table, .msg { width:1000px; margin: 0 auto;}

#page1 { height: 100vh; }
#page1 .page_title { display: block; }
#page1 .page_wrap { height: calc(100vh - 300px);}

#page2, #page3, #page4 { clear:both; height: calc(100vh - 200px);}
#page2 .page_wrap { clear: both; width: 1580px; height: calc(100vh - 300px); text-align: center; padding: 50px 0px 50px 0px; }

#page2 { background-color: #fff; color: #000; }

</style>
</head>
<body>
<%@ include file="./headerAdmin.jsp" %>
<div class="container">
    <div class="content">
        <section class="page" id="page1">
        	<div class="page_wrap">
        		<h2 class="page_title">회원정보 관리</h2>
        		<h3 class="page_sub">회원정보 관리페이지 입니다.</h3>
           		<table class="table">
					<thead>
						<tr>
							<th>연번</th>
							<th>아이디</th>
							<th>회원명</th>
							<th>전화번호</th>
							<th>이메일</th>
							<th>주소</th>
							<th>가입일</th>
							<th colspan="2">회원정보</th>
						</tr>
					</thead>
					<tbody>
<%
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

int i=0;
String mem_id = "";
String mem_name = "";
String phone = "";
String email = "";
String addr = "";
String regdate = "";

try{
	Class.forName(driver);
	try{
		conn = DriverManager.getConnection(url, user, pass);
		sql = "select * from member_tbl order by regdate desc";

		try{
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

				while(rs.next()){
					i++;
					mem_id = rs.getString("mem_id");
					mem_name = rs.getString("mem_name");
					phone = rs.getString("phone");
					email = rs.getString("email");
					addr = rs.getString("addr");
					regdate = rs.getString("regdate");
%>
					<tr>
						<td><%=i %></td>
						<td><%=mem_id %></td>
						<td><%=mem_name %></td>
						<td><%=phone %></td>
						<td><%=email%></td>
						<td><%=addr %></td>
						<td><%=regdate %></td>
<%
					if (mem_id.equals("admin")){
%>
						<td colspan="2">
							<a href="<%=path %>/admin/memberMod.jsp?mem_id=<%=mem_id %>">수정</a>
						</td>
<%						
					} else {
%>
						<td>
							<a href="<%=path %>/admin/memberMod.jsp?mem_id=<%=mem_id %>">수정</a>
							<a href="<%=path %>/admin/memberDel.jsp?mem_id=<%=mem_id %>">삭제</a>
						</td>
					</tr>
<%
					}
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
					</tbody>
				</table>
			</div>
        </section>
    </div>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	String path = request.getContextPath();

	request.setCharacterEncoding("utf-8");
	response.setContentType("text html; charset=utf-8");

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
#page3 .page_title { display: inline; }
</style>
</head>
<body>
<%@ include file="./headerAdmin.jsp" %>
<div class="container">
    <div class="content">
        <section class="page" id="page1">
        	<div class="page_wrap">
	        	<h2 class="page_title">공지사항</h2>
           		<table class="table">
					<thead>
						<tr>
							<th>id</th><th>title</th><th>context</th><th>name</th><th>time</th>
						</tr>
					</thead>
					<tbody>
<%
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

int board_id = Integer.parseInt(request.getParameter("board_id"));
String title = "";
String context = "";
String name = "";
String regdate = "";
String mem_id = "";

try{
	Class.forName(driver);
	try{
		conn = DriverManager.getConnection(url, user, pass);
		sql = "select a.board_id as board_id, a.board_title as title, a.board_context as context, a.regdate as regdate, b.mem_name as name, a.mem_id as mem_id ";
		sql += "from board a inner join member_tbl b ";
		sql += "on a.mem_id = b.mem_id ";
		sql += "where a.board_id = ?";
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_id);
			rs = pstmt.executeQuery();

				if(rs.next()){
					title = rs.getString("title");
					context = rs.getString("context");
					name = rs.getString("name");
					regdate = rs.getString("regdate");
					mem_id = rs.getString("mem_id");
%>
						<tr>
							<td><%=board_id %></td>
							<td><%=title %></td>
							<td><%=context %></td>
							<td><%=name %></td>
							<td><%=regdate %></td>
						</tr>
<%
%>
		 				<tr>
		 					<td colspan="3"></td>
							<td colspan="1">
								<a href="<%=path %>/admin/communityDetailUpdate.jsp?board_id=<%=board_id %>">글 수정하기</a>
							</td>
							<td colspan="1">
								<a href="<%=path %>/admin/communityDetailDel.jsp?board_id=<%=board_id %>">글 삭제하기</a>
							</td>
						</tr>
<%
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
						<tr>
							<td colspan="5">
								<a href="<%=path %>/admin/community.jsp">공지사항 목록으로 가기</a>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
        </section>
    </div>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>
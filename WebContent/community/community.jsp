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
</style>
</head>
<body>
<%@ include file="../header.jsp" %>
<div class="container">
    <div class="content">
        <section class="page" id="page1">
        	<div class="page_wrap">
        		<h2 class="page_title">공지사항</h2>
        		<h3 class="page_sub">공지사항입니다.</h3>
           		<table class="table">
					<thead>
						<tr>
							<th>id</th><th>title</th><th>name</th><th>time</th>
						</tr>
					</thead>
					<tbody>
<%
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String board_id = "";
String title = "";
String context = "";
String name = "";
String regdate = "";

try{
	Class.forName(driver);
	try{
		conn = DriverManager.getConnection(url, user, pass);
		sql = "select a.board_id as board_id, a.board_title as title, a.board_context as context, a.regdate as regdate, b.mem_name as name ";
		sql += "from board a inner join member_tbl b ";
		sql += "on a.mem_id = b.mem_id ";
		sql += "order by a.board_id desc";
		try{
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

				while(rs.next()){
					board_id = rs.getString("board_id");
					title = rs.getString("title");
					context = rs.getString("context");
					name = rs.getString("name");
					regdate = rs.getString("regdate");
					
					if (uid != ""){
%>
					<tr>
						<td><%=board_id %></td>
						<td><a href="<%=path %>/community/community_detail.jsp?board_id=<%=board_id %>"><%=title %></a></td>
						<td><%=name %></td>
						<td><%=regdate %></td>
					</tr>
<%
					} else {
%>
					<tr>
						<td><%=board_id %></td>
						<td><%=title %></td>
						<td><%=name %></td>
						<td><%=regdate %></td>
					</tr>
<%

					}
				}
				if (uid != ""){
%>
				<tr>
					<td><a href="<%=path %>/community/communityInsert.jsp">글 쓰기</a></td>
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
					</tbody>
				</table>
			</div>
        </section>
        <hr>
        <section class="page" id="page2">
        	<div class="page_wrap">
        		<h2 class="page_title">Review</h2>
        		<h3 class="page_sub">Pulsar 제품의 리뷰를 확인해보세요.</h3>
        	</div>
        </section>
        <hr>
        <section class="page" id="page3">
        	<div class="page_wrap">
        		<h2 class="page_title">FAQ</h2>
        		<h3 class="page_sub">자주 묻는 질문</h3>
                <table class="table">
					<thead>
						<tr>
							<th>id</th><th>title</th><th>context</th><th>name</th><th>time</th>
						</tr>
					</thead>
					<tbody>
<%
conn = null;
pstmt = null;
rs = null;

board_id = "";
title = "";
context = "";
name = "";
regdate = "";

try{
	Class.forName(driver);
	try{
		conn = DriverManager.getConnection(url, user, pass);
		sql = "select a.board_id as board_id, a.board_title as title, a.board_context as context, a.regdate as regdate, b.mem_name as name ";
		sql += "from board a inner join member_tbl b ";
		sql += "on a.mem_id = b.mem_id";
		try{
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

				while(rs.next()){
					board_id = rs.getString("board_id");
					title = rs.getString("title");
					context = rs.getString("context");
					name = rs.getString("name");
					regdate = rs.getString("regdate");
%>
						<tr>
							<td><%=board_id %></td>
							<td><%=title %></td>
							<td><%=context %></td>
							<td><%=name %></td>
							<td><%=regdate %>
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
					</tbody>
				</table>
			</div>
        </section>
        <hr>
        <section class="page" id="page4">
           <div class="page_wrap">
           		<h2 class="page_title">1:1문의</h2>
           		<h3 class="page_sub">1:1문의 게시판입니다</h3>
           </div>
        </section>
    </div>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>
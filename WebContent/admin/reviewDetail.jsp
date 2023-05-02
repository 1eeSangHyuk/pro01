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
        		<h2 class="page_title">Review</h2>
        		<h3 class="page_sub">Pulsar 제품의 리뷰를 확인해보세요.</h3>
        		           		<table class="table">
					<thead>
						<tr>
							<th>연번</th>
							<th>제품</th>
							<th>subject</th>
							<th>context</th>
							<th>writer</th>
							<th>date</th>
						</tr>
					</thead>
					<tbody>
<%
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String review_no = request.getParameter("review_no");
String prod_name = "";
String review_title = "";
String review_context = "";
String writer = "";
String resdate = "";
int i = 0;

try{
	Class.forName(driver);
	try{
		conn = DriverManager.getConnection(url, user, pass);
		sql = "select a.review_no as review_no, c.prod_name as prod_name, a.review_title as review_title, a.review_context as review_context, b.mem_id as mem_id, a.resdate as resdate ";
		sql += "from review a, member_tbl b, product c ";
		sql += "where a.prod_no = c.prod_no and a.writer = b.mem_id and a.review_no = ?";
		sql += "order by a.review_no desc";
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, review_no);
			rs = pstmt.executeQuery();

				if(rs.next()){
					i++;
					prod_name = rs.getString("prod_name");
					review_title = rs.getString("review_title");
					review_context = rs.getString("review_context");
					writer = rs.getString("mem_id");
					resdate = rs.getString("resdate");
%>
					<tr>
						<td><%=i %></td>
						<td><%=prod_name %></td>
						<td><a><%=review_title %></a></td>
						<td><a><%=review_context %></a></td>
						<td><%=writer %></td>
						<td><%=resdate %></td>
					</tr>
<%
 					if ( uid_c.equals("admin") || uid_c.equals(writer) ){ 
%>
		 				<tr>
		 					<td colspan="4"></td>
							<td colspan="1">
								<a href="<%=path %>/admin/reviewDetailUpdate.jsp?review_no=<%=review_no %>">후기 수정하기</a>
							</td>
							<td colspan="1">
								<a href="<%=path %>/admin/reviewDetailDel.jsp?review_no=<%=review_no %>">후기 삭제하기</a>
							</td>
						</tr>
<%
 					}
%>
						<tr>
							<td colspan="6"><a href="<%=path %>/admin/community.jsp#page2">뒤로가기</a></td>
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
    </div>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>

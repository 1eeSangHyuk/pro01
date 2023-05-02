<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	/* String path_c = request.getContextPath(); */
	request.setCharacterEncoding("utf-8");
	response.setContentType("text html; charset=utf-8");
%>
<%
	String path = request.getContextPath();

	String driver = "org.postgresql.Driver";
	String url = "jdbc:postgresql://localhost/pro1";
	String user = "postgres";
	String pass = "1234";

	String sql = "";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String review_no = request.getParameter("review_no");
	String review_title = "";
	String review_context = "";

	try{
		Class.forName(driver);
		try{
			conn = DriverManager.getConnection(url, user, pass);
			sql = "select review_no, review_title, review_context ";
			sql += "from review ";
			sql += "where review_no = ? ";
			sql += "order by review_no";
			try{
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, review_no);
				rs = pstmt.executeQuery();

				if(rs.next()){
					review_title = rs.getString("review_title");
					review_context = rs.getString("review_context");
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
.table, .msg { width:500px; }
#page3 .page_title { display: inline; }
</style>
</head>
<body>
<%@ include file="../header.jsp" %>
<div class="container">
    <div class="content">
        <section class="page" id="page1">
        	<div class="page_wrap">
	        	<h2 class="page_title">후기 수정하기</h2>
	        	<form action="reviewDetailUpdatePro.jsp" method="post">
	           		<table class="table">
						<tbody>
							<tr>
								<th><label for="board_title">제목 : </label></th>
								<td>
									<input type="hidden" name="review_no" id="review_no" value="<%=review_no %>">
									<input type="text" name="review_title" id="review_title" value=<%=review_title %> required>
								</td>
							</tr>
							<tr>
								<th>내용 : </th>
								<td><textarea rows="20" cols="45" name="review_context" id="review_context"><%=review_context %></textarea></td>
							</tr>
							<tr>
								<td colspan="2">
									<input type="submit" value="글 수정하기">
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
        </section>
    </div>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>
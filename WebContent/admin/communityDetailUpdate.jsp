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
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	int board_id = Integer.parseInt(request.getParameter("board_id"));
	String board_title = "";
	String board_context = "";

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
					board_title = rs.getString("title");
					board_context = rs.getString("context");
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
	.table{ width: 500px; }
</style>
</head>
<body>
<%@ include file="./headerAdmin.jsp" %>
<div class="content">
    <section class="page" id="page1">
    	<div class="page_wrap">
    		<h2 class="page_title">글 수정하기</h2>
        	<form action="<%=path %>/communityDetailUpdatePro.jsp" method="post">
           		<table class="table">
					<tbody>
						<tr>
							<th><label for="board_title">제목 : </label></th>
							<td>
								<input type="hidden" name="board_id" id="board_id" value="<%=board_id %>">
								<input type="text" name="board_title" id="board_title" value=<%=board_title %> required>
							</td>
						</tr>
						<tr>
							<th>내용 : </th>
							<td><textarea rows="20" cols="45" name="board_context" id="board_context"><%=board_context %></textarea></td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="submit" value="글 수정하기">
								<a href="<%=path %>/admin/community.jsp">공지사항 목록으로 가기</a>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</section>
	<script>
	function formCheck(s){
		if (s.pw1.value != s.pw2.value){
			alert("비밀번호가 서로 일치하지 않습니다.");
			/* 밑에 문구 띄우기 */
			return false;
		}
	}
	</script>
	<%@ include file="../footer.jsp" %>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text html; charset=utf-8");
	
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Poppins:wght@900&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" rel="stylesheet">
	<link rel="stylesheet" href="<%=path %>/common.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.content { min-height:500px; }
	#page4 { height: 200px; }
</style>
</head>
<body>
<%@ include file="../header.jsp" %>
<div class="content">
	<section class="page" id="page4">
        <h2 class="page_title">페이지제목0</h2>
        <div class="page_wrap">
            <h2>000a0a</h2>
        </div>
    </section>
	<section class="page" id="page1">
	    <h2 class="page_title">글 쓰기</h2>
	    <form action="communityInsertPro.jsp" method="post">
	       	<table class="table">
				<tbody>
					<tr>
						<th><label for="board_title">제목 : </label></th>
						<td>
							<input type="hidden" name="board_id" id="board_id">
							<input type="text" name="board_title" id="board_title" required>
						</td>
					</tr>
					<tr>
						<th>내용 : </th>
						<td><textarea rows="20" cols="45" name="board_context" id="board_context"></textarea></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="글 쓰기">
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</section>
<%@ include file="../footer.jsp" %>
</div>
</body>
</html>
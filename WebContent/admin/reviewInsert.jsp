<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text html; charset=utf-8");
	
	String path = request.getContextPath();
	
	String writer = (String) session.getAttribute("uid");
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
<%@ include file="../header.jsp" %>
<div class="content">
	<section class="page" id="page1">
		<div class="page_wrap">
		    <h2 class="page_title">리뷰 쓰기</h2>
		    <form action="<%=path %>/admin/reviewInsertPro.jsp" method="post">
		       	<table class="table">
					<tbody>
						<tr>
							<th colspan="5">제품 : </th>
							<td>
								<label for="x2miniWireless">x2mini무선</label>
								<input type="radio" id="x2miniWireless" name="prod_no" value="150">
							</td>
							<td>
								<label for="x2Wireless">x2mini무선</label>
								<input type="radio" id="x2Wireless" name="prod_no" value="100">
							</td>
							<td>
								<label for="xliteV2mini">xliteV2mini무선</label>
								<input type="radio" id="xliteV2mini" name="prod_no" value="250">
							</td>
							<td>
								<label for="xliteV2">xliteV2무선</label>
								<input type="radio" id="xliteV2" name="prod_no" value="200">
							</td>
							<td>
								<label for="aimX2mini">aimX2mini무선</label>
								<input type="radio" id="aimX2mini" name="prod_no" value="160">
							</td>
						</tr>
						<tr>
							<th><label for="review_title">제목 : </label></th>
							<td>
								<input type="text" name="review_title" id="review_title" required>
							</td>
						</tr>
						<tr>
							<th>내용 : </th>
							<td><textarea rows="20" cols="45" name="review_context" id="review_context"></textarea></td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="submit" value="글 쓰기">
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</section>
<%@ include file="../footer.jsp" %>
</div>
</body>
</html>
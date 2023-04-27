<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Poppins:wght@900&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" rel="stylesheet">
	<link rel="stylesheet" href="common.css">
<meta charset="UTF-8">
<title>로그인 페이지</title>
<style>
	.content { min-height:500px; }
	#page4 { height: 200px; }
</style>
</head>
<body>
	<%@ include file="header.jsp" %>
	<div class="content">
		<section class="page" id="page4">
            <h2 class="page_title">페이지제목0</h2>
            <div class="page_wrap">
                <h2>000a0a</h2>
            </div>
        </section>
		<form action="loginPro.jsp" method="post">
			<label for="id">아이디 : </label>
			<input type="text" id="id" name="id">
			<br>
			<label for="pw">비밀번호 : </label>
			<input type="password" id="pw" name="pw">
			<br>
			<input type="submit" value="전송">
		</form>
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Poppins:wght@900&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" rel="stylesheet">
	<link rel="stylesheet" href="common.css">
<meta charset="UTF-8">
<title>Insert title here</title>
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
    <section class="page">
		<form name="join_form" action="submitPro.jsp" method="post" onsubmit="return pwCheck()">
			<table>
				<tbody>
					<tr>
						<th><label for="id">아이디</label></th>
						<td>
							<input type="text" name="id" id="id" required>
							<input type="hidden" name="idCk" id="idCk" value="no">
							<input type="button" value="아이디 중복 확인" onclick="idCheck()">
							<p id="msg"></p>
						</td>
						
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
						<th><label for="tel">전화번호</label></th>
						<td><input type="tel" name="tel" id="tel"></td>
					</tr>
					<tr>
						<th><label for="email">이메일</label></th>
						<td><input type="email" name="email" id="email"></td>
					</tr>
					<tr>
						<th><label for="addr">주소</label></th>
						<td><input type="text" name="addr" id="addr"></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="회원가입"> &nbsp; &nbsp; &nbsp; &nbsp;
							<input type="reset" value="취소">
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		<script>
		function idCheck(){
			var id = document.getElementById("id");
			if(id.value != ""){
				window.open("idCheck.jsp?id="+id.value, "아이디 중복 검사", "width=400, height=300");
			} else {
				alert("아이디를 입력해주세요");
				id.focus();
				return;
			}
		}
		function pwCheck(){
			if (document.getElementById("pw1") != document.getElementById("pw2")){
				alert("비밀번호가 서로 일치하지 않습니다.");
				/* 밑에 문구 띄우기 */
				return false;
			}
		}
		</script>
	</section>
	<%@ include file="footer.jsp" %>
</div>
</body>
</html>
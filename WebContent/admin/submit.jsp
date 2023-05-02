<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
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
	<link rel="stylesheet" href="<%=path %>/main.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.content { min-height:500px; }
	.table { width:auto; margin: auto auto; }
	.page_title { padding: 1.5em 0em 1.5em 0em; }
</style>
</head>
<body>
<%@ include file="./headerAdmin.jsp" %>
<div class="content">
    <section class="page" id="page1">
    	<div class="page_wrap">
    		<h2 class="page_title">회원가입</h2>
			<form name="join_form" action="<%=path %>/admin/submitPro.jsp" method="post" onsubmit="return formCheck(this)">
				<table class="table">
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
							<td><input type="text" name="phone" id="phone"></td>
						</tr>
						<tr>
							<th><label for="email">이메일</label></th>
							<td><input type="text" name="email" id="email"></td>
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
		</div>
		<script>
		function idCheck(){
			var id = document.getElementById("id");
			if(id.value != ""){
				window.open("<%=path %>/idCheck.jsp?id="+id.value, "아이디 중복 검사", "width=400, height=300");
			} else {
				alert("아이디를 입력해주세요");
				id.focus();
				return;
			}
		}
		function formCheck(s){
			if (s.pw1.value != s.pw2.value){
				alert("비밀번호가 서로 일치하지 않습니다.");
				/* 밑에 문구 띄우기 */
				return false;
			}
 			if (s.idCk.value == "no"){
				alert("ID 중복체크를 완료해주세요.");
				s.id.focus();
				return false;
			} 
		}
		</script>
	</section>
	<%@ include file="../footer.jsp" %>
</div>
</body>
</html>
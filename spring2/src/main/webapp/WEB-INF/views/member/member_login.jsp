<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<!-- <script src="./js/jquery.js"></script> -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/button.css" />
<script>
	function check() {
		if ($.trim($("#id").val()) == "") {
			alert("로그인 아이디를 입력하세요!");
			$("#id").val("").focus();
			return false;
		}
		if ($.trim($("#pwd").val()) == "") {
			alert("비밀번호를 입력하세요!");
			$("#pwd").val("").focus();
			return false;
		}
	}

	/*비번찾기 공지창*/
	function pwd_find() {
		window.open("pwd_find.do", "비번찾기", "width=600,height=400");
		//자바 스크립트에서 window객체의 open("공지창경로와 파일명","공지창이름","공지창속성")
	}
	/*아이디찾기 공지창*/
	function id_find() {
		window.open("id_find.do", "비번찾기", "width=600,height=400");
		//자바 스크립트에서 window객체의 open("공지창경로와 파일명","공지창이름","공지창속성")
	}
</script>
<%@ include file="../member/header.jsp"%>
</head>
<body>
	<div class="login_wrap" style="margin-top: 100px;">
		<h2 class="login_title" style="background: #9a6c5c;">Login</h2>
		<form method="post" action="member_login_ok.do"
			onsubmit="return check()">
			<table class="table_code">
				<tr>
					<td class="login_box" style="border: 1px solid #9a6c5c;">아이디</td>
					<td><input placeholder="아이디" name="id" id="id" size="40"
						class="input_box" autofocus/></td>
				</tr>

				<tr>
					<td class="login_box" style="border: 1px solid #9a6c5c;">비밀번호</td>
					<td><input placeholder="비밀번호" type="password" name="pwd"
						id="pwd" size="40" class="input_box" /></td>
				</tr>
				<tr>
					<td colspan=2><input type="submit" value="로그인 " class="button"
						style="cursor: pointer;" /></td>
				</tr>
			</table>
			<table class="table_code2">
				<tr>
					<td><input type="button" value="회원가입"
						class="w-btn-outline w-btn-gray-outline"
						onclick="location='member_join.do'" /></td>
					<td><input type="button" value="ID찾기"
						class="w-btn-outline w-btn-gray-outline" onclick="id_find()" /></td>
					<td><input type="button" value="비번찾기"
						class="w-btn-outline w-btn-gray-outline" onclick="pwd_find()"  />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
<%@ include file="footer.jsp"%>
</html>
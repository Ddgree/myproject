<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.category {
	margin-left: auto;
	margin-right: auto;
	list-style: none;
	background-color: #f3d49e;
	text-align: center;
	color: white;
	height: 60px;
}

.menu {
	display: inline-block;
	font-size: 30px;
	transition: color 0.5s ease-in-out;
	cursor: pointer;
	margin-top: 8px;
	color: black;
}

.menu:hover {
	color: white;
}

a {
	text-decoration-line: none;
}

.w-btn {
	border: 3px solid #9a6c5c;
	padding: 10px 20px;
	border-radius: 15px;
	font-family: "paybooc-Light", sans-serif;
	box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
	text-decoration: none;
	font-weight: 600;
	float: right;
	transition: background 0.5s ease-in-out, color 0.5s ease-in-out;
	background-color: white;
	color: black;
}

.w-btn:hover {
	background: #9a6c5c;
	color: white;
}

.screen {
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
}

.img {
	display: inline-block;
	float: left;
	margin-left: 20px;
	cursor: pointer;
	width: 60px;
	height: 60px;
}
</style>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="screen">
		<div class="category">
			<div>
				<a href="partyband.do"><img src="././resources/images/logo.jpg"
					class="img"></a>
			</div>
			<div onClick='location="https://www.naver.com"' class="menu" style="margin-left: 47px;">종료파티방</div>
			<div onClick='location="https://www.naver.com"' class="menu" style="margin-left: 200px;">커뮤니티</div>
			<div onClick='location="https://www.naver.com"' class="menu" style="margin-left: 200px;">공지사항</div>
			<input type="button" value="로그인" class="w-btn"
				style="cursor: pointer; margin-right: 20px; margin-top: 8px;"
				onclick='location="member_login.do"' />
		</div>
	</div>
</body>
</html>
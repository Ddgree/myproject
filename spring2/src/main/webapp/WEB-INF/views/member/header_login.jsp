<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.category {
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

.hello {
	float: right;
	color: black;
	font-family: "paybooc-Light", sans-serif;
	font-weight: 600;
	margin-right: 30px;
}
.mypage{
	border: 3px solid #9a6c5c;
	padding: 5px 10px;
	border-radius: 10px;
	font-family: "paybooc-Light", sans-serif;
	box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
	text-decoration: none;
	font-weight: 600;
	float: right;
	transition: background 0.5s ease-in-out, color 0.5s ease-in-out;
	background-color: white;
	color: black;
	margin-top: 22px;
}
.mypage:hover{
	background: #9a6c5c;
	color: white;
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
			<div onClick='location="https://www.naver.com"' class="menu" style="margin-left: 120px;">종료파티방</div>
			<div onClick='location="https://www.naver.com"' class="menu" style="margin-left: 200px;">커뮤니티</div>
			<div onClick='location="https://www.naver.com"' class="menu" style="margin-left: 200px;">공지사항</div>
				<input type="hidden" name="member_id" value="${sessionScope.member.member_id}" />
			
			    <div class="hello">${sessionScope.member.member_nickname}님! 환영합니다!</div>
				<input type="submit" value="로그아웃" class="mypage" style="margin-right:-170px;" onclick="location='member_logout.do'"/>
				<input type="button" value="마이페이지" class="mypage" style="margin-right:-90px;" onclick="edit_pwcheck()" /> 
			
		</div>
	</div>
</body>
</html>
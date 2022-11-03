<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.category {
	list-style: none;
	background-color: black;
	color: #f3d49e;
	height: 60px;
	position: relative;
}

.menu {	
	position: relative;
	margin-left: 200px;
	display: inline-block;
	font-size: 30px;
	transition: color 0.5s ease-in-out;
	cursor: pointer;
	margin-top: 0.7%;
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
	margin-left: -110px;
	margin-top: -10px;
	cursor: pointer;
	width: 60px;
	height: 60px;
}
.navi{
	position:relative;
	background:#f3d49e;
	margin-top:-15px;
	width:1550px;
	height:60px;
}

.navi ul{
	list-style: none; 
	height:40px;
	padding-top:10px;
	padding-bottom:5px;
}
.navi ul li {
	display:inline;
	float: left;
	font-size:25px;
}
.navi a, .navi a:visited {
	transition: color 0.5s ease-in-out;
	display: block;
	color:black;
	width: 150px; 
	text-decoration: none;
	font-family: "paybooc-Light", sans-serif;
	font-weight: 600;

}
.navi a:hover, .navi a:active, .navi a:focus {
		color:white;
		
}

.hello {
	color: black;
	font-family: "paybooc-Light", sans-serif;
	font-weight: 600;
	font-size:20px;
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
	margin-top: 9px;
	margin-left: 5px;
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
		<input type="hidden" name="member_id" value="${sessionScope.member.member_id}" />
    <nav class="navi">
      <ul>
     	<li><a href="partyband.do"><img src="././resources/images/logo.jpg" class="img" style="margin-left:50px;"></a></li>
        <li><a href="#" style="margin-left:100px;">종료파티방</a></li>
        <li><a href="#" style="margin-left:100px;">커뮤니티</a></li>
        <li><a href="#" style="margin-left:100px;">공지사항</a></li>
		<li><div class="hello" style="margin-left: 130px; margin-top: 9px;">${sessionScope.member.member_nickname}님! 환영합니다!</div></li>
		<li><input type="button" value="마이페이지" class="mypage" style=" cursor: pointer;" onclick="location='member_mypage.do'" /> </li>
		<li><input type="submit" value="로그아웃" class="mypage" style=" cursor: pointer; " onclick="location='member_logout.do'"/></li>
       
      </ul>
    </nav>  
		</div>
	</div>
			
</body>
</html>
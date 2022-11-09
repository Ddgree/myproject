<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
@import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap');
body{
	font-family: 'Gowun Dodum', sans-serif;
}
.category {
	list-style: none;
	background-color: black;
	color: #f3d49e;
	height: 60px;
	position: relative;
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
	transition: background 0.5s ease-in-out, color 0.5s ease-in-out;
	background-color: white;
	color: black;
	margin-left:800px;
	position:absolute;
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
	width:auto;
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
	font-family: 'Gowun Dodum', sans-serif;
	font-weight: 600;
	
}
.navi a:hover, .navi a:active, .navi a:focus {
		color:white;
}
</style>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/decoration.css" />
</head>
<body>
	<div class="screen">
		<div class="category">

    <nav class="navi">
      <ul>
     	<li><a href="partyband.do"><img src="././resources/images/logo.jpg" class="img"  style="margin-left:-20%;"></a></li>
        <li><a href="end_party_list.do" >종료파티방</a></li>
        <li><a href="board_list.do" >커뮤니티</a></li>
        <li><a href="notice_list.do" >공지사항</a></li>
      	<li><input type="button" value="로그인" class="w-btn" onclick="location='member_login.do'"
      	style="cursor: pointer;"></li>

      </ul>
    </nav>  

		</div>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
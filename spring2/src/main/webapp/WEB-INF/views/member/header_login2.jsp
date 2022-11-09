<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
		<input type="hidden" name="member_id" value="${member.member_id}" />
    <nav class="navi">
      <ul>
     	<li><a href="partyband.do"><img src="././resources/images/logo.jpg" class="img" style="margin-left:50px;"></a></li>
        <li><a href="end_party_list.do" style="margin-left:100px;">종료파티방</a></li>
        <li><a href="board_list.do" style="margin-left:100px;">커뮤니티</a></li>
        <li><a href="notice_list.do" style="margin-left:100px;">공지사항</a></li>
		<li><div class="hello" style="margin-left: 130px; margin-top: 9px;">${sessionScope.member.member_nickname}님! 환영합니다!</div></li>
		<li><input type="button" value="탈퇴회원 목록" class="mypage" style=" cursor: pointer;" onclick="location='member_drop.do'" /> </li>
		<li><input type="submit" value="로그아웃" class="mypage" style=" cursor: pointer; " onclick="location='member_logout.do'"/></li>
       
      </ul>
    </nav>  
		</div>
	</div>
			
</body>
</html>
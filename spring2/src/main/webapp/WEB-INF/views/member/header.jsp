<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=1600, initial-scale=1.0, minimum-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/header.css" />
</head>
<body>
	<div class="header">
		<input type="hidden" name="member_id" value="${member.member_id}" />

		<ul class="topnav">
			<li><a class="space"></a></li>
			<li><a class="img" href="partyband.do"><img
					src="././resources/images/partyband.gif" class="img"></a></li>
			<li><a class="space"></a></li>
			<c:if test="${end eq 1}">
				<li><a href="partyband.do?end=0">진행중인 파티방</a></li>
			</c:if>
			<c:if test="${end eq 0}">
				<li><a href="end_party_list.do?end=1">종료된 파티방</a></li>
			</c:if>
			<li><a href="board_list.do">커뮤니티</a></li>
			<li><a href="notice_list.do">공지사항</a></li>
			<li class="right"><input type="button" value="로그인"
				class="mypage" onclick="location='member_login.do?end=1'"></li>
			<li style="float: right"><a class="txt">Guest님! 환영합니다!</a></li>
		</ul>

		<ul class="topnavM">
			<li class="dropdown" style="float: right"><a class="dropbtn2">Guest님!<br>환영합니다!
			</a>
				<div class="dropdown-content2">
					<a class="mypage2"><input class="mini" type="button"
						value="로그인" onclick="location='member_login.do'" /></a>
				</div>
			<li class="dropdown"><a class="dropbtn" href="refresh.do"><img
					src="././resources/images/partyband.gif"></a>
				<div class="dropdown-content">
					<c:if test="${end eq 1}">
						<a href="partyband.do?end=0">진행중인 파티방</a>
					</c:if>
					<c:if test="${end eq 0}">
						<a href="end_party_list.do?end=1">종료된 파티방</a>
					</c:if>
					<a href="board_list.do">커뮤니티</a> <a href="notice_list.do">공지사항</a>
				</div>
		</ul>
	</div>
</body>
</html>
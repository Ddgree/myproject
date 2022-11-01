<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>파티 상세보기</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/party.css" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>

<body>
세션 = ${sessionId }${sessionMember.member_id }<br>
작성자 = ${party.party_id }<br>
	<div id="bbscont_wrap">
		<h2 class="bbscont_title">게시글 상세정보</h2>
		<input type="hidden" name=page value=${page }>
		<table id="bbscont_t">
			<tr>
				<th>제목</th>
				<td>${party.party_subject}</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${party.party_id }</td>
			</tr>
			<tr>
				<th>활동일</th>
				<td>${party.party_enddate }</td>
			</tr>
			<tr>
				<th>인원</th>
				<td>${party.party_count }/${party.party_max_count }명</td>
			</tr>
			<tr>
				<th>내용</th>
				<td class=con>${party.party_content}</td>
			</tr>
			<tr id="bbswrite_menu">
				<td colspan=2 align="center">
					<c:choose>
						<c:when test="${sessionScope.party_id eq party_id}">
							<input type="button" value="수정" class="input_button"
								onclick="location.href='partyedit.do'" />
							<input type="button" value="삭제" class="input_button"
								onclick="location.href='partydelete.do'" />
						</c:when>
						<c:when test="${sessionScope.admin_id eq 'admin'}">
							<input type="button" value="삭제" class="input_button"
								onclick="location.href='partydelete.do'" />
						</c:when>
						<c:otherwise>
							<input type="button" value="참가" class="input_button"
								onclick="location.href='partyjoin.do'" />
						</c:otherwise>
					</c:choose></td>
			</tr>
		</table>
	</div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>파티방 상세보기</title>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/party.css" />
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="https://kit.fontawesome.com/f82eca20b8.js" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script>
		function party_delete() 
		{
			window.open("pwcheck.do?party_no=${party.party_no}&page=${page}&member_id=${member.member_id}&stat=del", "파티방 삭제", "width=500,height=350,left=700,top=200");
		}
		
		function party_update() 
		{
			window.open("pwcheck.do?party_no=${party.party_no}&page=${page}&member_id=${member.member_id}&stat=edit", "파티방 수정", "width=500,height=350,left=700,top=200");
		}
	</script>

</head>

<c:if test="${sessionScope.member.member_id == null }">
	<%@ include file="../member/header.jsp"%>
</c:if>
<c:if test="${sessionScope.member.member_id != null}">
	<%@ include file="../member/header_login.jsp"%>
</c:if>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/party.css" />
<body>

<div class=wrapper>
<c:set var="join" value="1" scope="session"/>
<c:forEach var="j" items="${joinlist}">
	<c:if test="${j.party_no eq party.party_no}">
		<c:set var="join" value="-1" scope="session"></c:set>
	</c:if>
</c:forEach>

<!-- 오늘 날짜 -->
<jsp:useBean id="today" class="java.util.Date" />
<fmt:parseNumber value="${today.time / (1000*60*60*24)}" integerOnly="true" var="now" scope="request"/>
<!-- Dday -->
<fmt:parseDate var="enddate" value="${party.party_enddate}" pattern="yyyyMMdd" />
<fmt:parseNumber var="day" value="${enddate.time / (1000*60*60*24)}" integerOnly="true" />
<!-- 날짜포멧출력 -->
<fmt:formatDate var="dday" value="${enddate }" pattern="yyyy년 MM월 dd일"/>

	<div id="bbscont_wrap">
		<h2 class="bbscont_title">파티방 상세정보</h2>
		<input type="hidden" name=page value=${page }>
		<table id="bbscont_t">
			<tr>
				<th>제목</th>
				<td>[${party.party_address}] ${party.party_subject}</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${party.party_id }</td>
			</tr>
			<tr>
				<th>활동일</th>
				<c:if test="${now==day }"><td>${dday} [D-day]</td></c:if>
				<c:if test="${now>day }"><td>${dday} [종료]</td></c:if>
				<c:if test="${now<day }"><td>${dday} [D${now-day }]</td></c:if>
			</tr>
			<tr>
				<th>인원</th>
				<td><i class="fa-solid fa-crown"></i>
					<c:forEach begin="1" end="${party.party_count}">
						<c:if test="${party.party_count!=0}">
							<i class="fa-solid fa-user"></i>
						</c:if>
					</c:forEach>
					<c:forEach begin="1" end="${party.party_max_count-party.party_count}">
						<c:if test="${party.party_max_count-party.party_count!=0}">
							<i class="fa-regular fa-user"></i>
						</c:if>
					</c:forEach>
					${party.party_count+1} / ${party.party_max_count+1}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td class=con>${party.party_content}</td>
			</tr>
			<tr id="bbswrite_menu">
				<td colspan=2 align="center">
				<c:choose>
						<c:when test="${member.member_id eq party.party_id}">
							<input type="button" value="목록" class="input_button" onclick="location='partyband.do?page=${page}'" />
							<c:if test="${party.party_count eq 0}">
								<input type="button" value="수정" class="input_button" onclick="party_update()" />
								<input type="button" value="삭제 " class="input_button" onclick="party_delete()" />
							</c:if>
						</c:when>
						<c:when test="${member.member_id eq 'admin'}">
							<input type="button" value="목록" class="input_button"
								onclick="location='partyband.do?page=${page}'" />
							<input type="button" value="삭제 " class="input_button" onclick="party_delete()" />
						</c:when>
						<c:when test="${join eq -1}">
							<input type="button" value="목록" class="input_button"onclick="location='partyband.do?page=${page}'"/>
							<input type="button" value="참가취소" class="input_button"
								onclick="location='partyjoincancel.do?page=${page}&party_no=${party.party_no}&member_id=${member.member_id}'" />
						</c:when>
						<c:otherwise>
							<input type="button" value="목록" class="input_button" onclick="location='partyband.do?page=${page}'"/>
							<input type="button" value="참가" class="input_button" onclick="location='partyjoin.do?page=${page}&party_no=${party.party_no}&member_id=${member.member_id}'" />
						</c:otherwise>
					</c:choose></td>
			</tr>
		</table>
	</div>
	</div>
</body>
<%@ include file="../member/footer.jsp"%>
</html>

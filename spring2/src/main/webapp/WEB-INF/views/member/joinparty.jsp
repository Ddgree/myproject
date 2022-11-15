<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${sessionScope.member.member_id == null }">
	<%@ include file="../member/header.jsp"%>
</c:if>
<c:if test="${sessionScope.member.member_id != null }">
	<%@ include file="../member/header_login.jsp"%>
</c:if>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/mypage.css" />
<title>참가파티방 목록</title>
</head>
<%@ include file="../member/header_login.jsp" %>
<body>
<div class="wrapper">
	<div id="root">
		<br>
		<br>
		<br>
		<br>
		<br>
		<h1 align=center>참가파티방 목록</h1>

		<div id="dropid">
			<form role="form" method="post">
				<table style="border-spacing: 10px;"  align=center>
					<tr align="center" valign="middle" bordercolor="#333333">
						<td width="14%" height="26">
							<div align="center">파티방 번호</div>
						</td>
						<td width="14%">
							<div align="center">파티방 이름</div>
						</td>
						<td width="14%">
							<div align="center">파티 지역</div>
						</td>
						<td width="14%">
							<div align="center">파티 종료일</div>
						</td>
						<td width="14%">
							<div align="center">파티참가 현황</div>
						</td>
					</tr>

					<c:forEach var="partymem" items="${partymem}">

						<tr align="center" valign="middle" bordercolor="#333333">

							<td>
								<div align="center">
									<a href="mypageparty.do?party_no= ${partymem.party_no}">${partymem.party_no}</a>
								</div>
							</td>
							<td>
								<div align="center">${partymem.party_subject}</div>
							</td>
							<td>
								<div align="center">${partymem.party_address}</div>
							</td>
							<td>
								<div align="center">${partymem.party_enddate}</div>
							</td>
							
							<c:choose>
							<c:when test="${member.member_id eq partymem.party_id}">
							<td>
								<div align="center">파티장</div>
							</td>
							</c:when>
							<c:otherwise>
							<td>
								<div align="center">파티원</div>
							</td>
							</c:otherwise>
							</c:choose>
						</tr>
					</c:forEach>
				</table>
				<div id="drop_menu" align="center">
					<input type="button" value="돌아가기" class="button" style="margin-top:50px;"
						onclick="location='refresh.do'" />
				</div>
			</form>
		</div>
	</div>
</div>
</body>
<%@ include file="../member/footer.jsp"%>

</html>
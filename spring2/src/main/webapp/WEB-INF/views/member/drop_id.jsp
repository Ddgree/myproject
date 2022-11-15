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
<title>탈퇴 회원 목록</title>
</head>
<body>
	<br><br><br><br>
	<div id="root">
			<h1 align="center">탈퇴 회원 목록</h1>

		<div id="dropid">
			<form role="form" method="post">
				<table style="border-spacing: 10px;" width=50% align=center>
					<tr align="center" valign="middle" bordercolor="#333333">
				<td>
					<div align="center">아이디</div>
				</td>
				<td>
					<div align="center">이름</div>
				</td>
				<td>
					<div align="center">닉네임</div>
				</td>
				<td>
					<div align="center">성별</div>
				</td>
				<td>
					<div align="center">번호</div>
				</td>
				<td>
					<div align="center">나이</div>
				</td>
				<td>
					<div align="center">email</div>
				</td>
				<td>
					<div align="center">지역</div>
				</td>
			</tr>
			
			<c:forEach var="dropmem" items="${dropmem}">
			
			<tr align="center" valign="middle" bordercolor="#333333"
				onmouseover="this.style.backgroundColor='F8F8F8'"
				onmouseout="this.style.backgroundColor=''">
									
				<td>
					<div align="center">${dropmem.member_id}</div>
				</td>
				<td>
					<div align="center">${dropmem.member_name}</div>
				</td>
				<td>
					<div align="center">${dropmem.member_nickname}</div>
				</td>
				<td>
					<div align="center">${dropmem.member_gender}</div>
				</td>
				<td>
					<div align="center">${dropmem.member_phone}</div>
				</td>
				<td>
					<div align="center">${dropmem.member_age}</div>
				</td>
				<td>
					<div align="center">${dropmem.member_email}</div>
				</td>
				<td>
					<div align="center">${dropmem.member_address}</div>
				</td>
			</tr>
			</c:forEach>
				</table>
				<div id="drop_menu" align="center">
				    <input type="button" value="돌아가기" class="button" style="margin-top: 50px;"
    				onclick="location='refresh.do'" />
    			</div>
			</form>
		</div>
	</div>
</body>
<%@ include file="../member/footer.jsp"%>
</html>
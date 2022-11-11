<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<title>참가파티방 목록</title>
</head>
<%@ include file="../member/header_login.jsp" %>
<body>
<div class="wrapper">
	<div id="root">
		<header align="center">
			<h1>참가파티방 목록</h1>
		</header>
		<hr width=60%/>

		<div id="dropid">
			<form role="form" method="post">
				<table border=1 width=50% align=center>
					<tr align="center" valign="middle" bordercolor="#333333">
				<td style="font-family: Tahoma; font-size: 11pt;" width="14%"
					height="26">
					<div align="center">파티방 번호</div>
				</td>
				<td style="font-family: Tahoma; font-size: 11pt;" width="14%">
					<div align="center">파티방 이름</div>
				</td>
				<td style="font-family: Tahoma; font-size: 11pt;" width="14%">
					<div align="center">파티 지역</div>
				</td>
				<td style="font-family: Tahoma; font-size: 11pt;" width="14%">
					<div align="center">파티 종료일</div>
				</td>
				<td style="font-family: Tahoma; font-size: 11pt;" width="14%">
					<div align="center">파티방장</div>
				</td>
			</tr>
			
			<c:forEach var="partymem" items="${partymem}">
			
			<tr align="center" valign="middle" bordercolor="#333333"
				onmouseover="this.style.backgroundColor='F8F8F8'"
				onmouseout="this.style.backgroundColor=''">
									
				<td style="font-family: Tahoma; font-size: 10pt;">
					<div align="center">
					<a href="mypageparty.do?party_no=
					${partymem.party_no}">${partymem.party_no}</a>
					</div>
				</td>
				<td style="font-family: Tahoma; font-size: 10pt;">
					<div align="center">${partymem.party_subject}</div>
				</td>
				<td style="font-family: Tahoma; font-size: 10pt;">
					<div align="center">${partymem.party_address}</div>
				</td>
				<td style="font-family: Tahoma; font-size: 10pt;">
					<div align="center">${partymem.party_enddate}</div>
				</td>
				<td style="font-family: Tahoma; font-size: 10pt;">
					<div align="center">${partymem.party_id}</div>
				</td>
			</tr>
			</c:forEach>
				</table>
				<div id="drop_menu" align="center">
				    <input type="button" value="돌아가기" class="input_button"
    				onclick="location='refresh.do'" />
    			</div>
			</form>
		</div>
	</div>
</div>
</body>
<%@ include file="../member/footer.jsp" %>
</html>
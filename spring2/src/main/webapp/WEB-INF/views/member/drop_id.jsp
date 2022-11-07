<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>탈퇴 회원 목록</title>
</head>
<body>
	<div id="root">
		<header align="center">
			<h1>탈퇴 회원 목록</h1>
		</header>
		<hr width=60%/>

		<div id="dropid">
			<form role="form" method="post">
				<table border=1 width=50% align=center>
					<tr align="center" valign="middle" bordercolor="#333333">
				<td style="font-family: Tahoma; font-size: 11pt;" width="14%"
					height="26">
					<div align="center">아이디</div>
				</td>
				<td style="font-family: Tahoma; font-size: 11pt;" width="14%">
					<div align="center">이름</div>
				</td>
				<td style="font-family: Tahoma; font-size: 11pt;" width="14%">
					<div align="center">닉네임</div>
				</td>
				<td style="font-family: Tahoma; font-size: 11pt;" width="8%">
					<div align="center">성별</div>
				</td>
				<td style="font-family: Tahoma; font-size: 11pt;" width="14%">
					<div align="center">번호</div>
				</td>
				<td style="font-family: Tahoma; font-size: 11pt;" width="8%">
					<div align="center">나이</div>
				</td>
				<td style="font-family: Tahoma; font-size: 11pt;" width="14%">
					<div align="center">email</div>
				</td>
				<td style="font-family: Tahoma; font-size: 11pt;" width="8%">
					<div align="center">지역</div>
				</td>
			</tr>
			
			<c:forEach var="dropmem" items="${dropmem}">
			
			<tr align="center" valign="middle" bordercolor="#333333"
				onmouseover="this.style.backgroundColor='F8F8F8'"
				onmouseout="this.style.backgroundColor=''">
									
				<td style="font-family: Tahoma; font-size: 10pt;">
					<div align="center">${dropmem.member_id}</div>
				</td>
				<td style="font-family: Tahoma; font-size: 10pt;">
					<div align="center">${dropmem.member_name}</div>
				</td>
				<td style="font-family: Tahoma; font-size: 10pt;">
					<div align="center">${dropmem.member_nickname}</div>
				</td>
				<td style="font-family: Tahoma; font-size: 10pt;">
					<div align="center">${dropmem.member_gender}</div>
				</td>
				<td style="font-family: Tahoma; font-size: 10pt;">
					<div align="center">${dropmem.member_phone}</div>
				</td>
				<td style="font-family: Tahoma; font-size: 10pt;">
					<div align="center">${dropmem.member_age}</div>
				</td>
				<td style="font-family: Tahoma; font-size: 10pt;">
					<div align="center">${dropmem.member_email}</div>
				</td>
				<td style="font-family: Tahoma; font-size: 10pt;">
					<div align="center">${dropmem.member_address}</div>
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
</body>
</html>
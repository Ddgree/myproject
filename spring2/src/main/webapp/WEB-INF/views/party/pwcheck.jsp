<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 확인</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/find.css" />
<script src="./js/jquery.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
	<div id="del_wrap">
		<h2 class="pwd_title">비밀번호 확인</h2>
		<form method="post" action="partypwcheck.do">
			<input type="hidden" name=page value="${page}">
			<input type="hidden" name=party_no value="${party_no}">
			<input type="hidden" name=member_id value="${member.member_id}">
			<input type="hidden" name=stat value="${stat}">
			<table style="border-spacing: 20px 15px;" align="center">
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" name="delete_passwd" id="delete_passwd" size="14" class="input_box" />
					</td>
					<td></td>
					<td></td>
				</tr>
			</table>
			<br><br>
			<div id="del_menu" align="center">
				<c:choose>
					<c:when test="${stat eq 'edit'}">
						<input type="submit" value="수정" class="button" style="margin-left:50px;"/>
					</c:when>
					<c:otherwise>
						<input type="submit" value="삭제" class="button" style="margin-left:50px;"/>
					</c:otherwise>
				</c:choose>
				<input type="reset" value="취소" class="button" onclick="window.close()" />
			</div>
		</form>
	</div>
</body>
</html>
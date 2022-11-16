<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글삭제</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/party.css" /> 
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
	<%@ include file="../member/header_login.jsp"%>

<body>
<div class=wrapper>
<form method=post action="partydelete.do">
<input type="hidden" name=no value=${no }>
<input type="hidden" name=page value=${page }>
<div id="bbscont_wrap">
<table id="bbscont_t">
	<tr><th>비밀번호</th>
		<td><input type=password name="party_passwd" id="party_password" required="required"></td>
	</tr>
	<tr><td colspan=2 align=center>
			<input type=submit class="input button" value="글삭제">
			<input type=reset class="input button" value="취소">
		</td>
	</tr>
</table>
</div>
</form>
</div>
<%@ include file="../member/footer.jsp"%>
</body>
</html>
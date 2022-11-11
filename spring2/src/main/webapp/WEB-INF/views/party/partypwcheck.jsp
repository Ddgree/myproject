<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비번확인</title>
</head>
<%@ include file="../member/header_login.jsp"%>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/party.css" />
<body>
	<div class=wrapper>
	<div id="item" align="center">
		<form name="f" method="post" action="partypwcheck.do">
			<input type="hidden" name="member_id" value="${member_id}"> <input
				type="hidden" name="page" value="${page}"> <input
				type="hidden" name="party_no" value="${party_no}"> <input
				type="hidden" name="stat" value="${stat}">
			<div id="bbscont_wrap">
				<table id="bbswrite_t">
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="input_member_passwd" id="pw"
							size="14" autofocus="autofocus" required="required"></td>
					</tr>
					<tr>
						<td colspan=2 align=center><input type="submit" value="확인">
							<input type="button" value="취소" onclick="history.back()" /></td>
					</tr>
				</table>
			</div>
		</form>
	</div>
	</div>
</body>
<%@ include file="../member/footer.jsp"%>
</html>
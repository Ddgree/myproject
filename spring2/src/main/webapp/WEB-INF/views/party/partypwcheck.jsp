<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비번확인</title>
</head>
<body>
<form name="f" method="post" action="partypwcheck.do">
	<input type="hidden" name="member_id" value="${member_id}">
	<input type="hidden" name="page" value="${page}">
	<input type="hidden" name="party_no" value="${party_no}">
	<input type="hidden" name="stat" value="${stat}">

	<table>
		<tr>
			<th>비번확인</th>
			<td>
				<input type="password" name="input_member_passwd" id="pw" size="14" class="input_box" />
			</td>
		</tr>
	</table>
	
	<div id="edit_menu">
		<input type="submit" value="확인" class="input_button" />
		<input type="button" value="취소" class="input_button" onclick="history.back()" />
	</div>
</form>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>파티 생성</title>
 <link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath() %>/resources/css/party.css" /> 
<script src="http://code.jquery.com/jquery-latest.js"></script>

<script src="<%=request.getContextPath() %>/resources/js/party_check.js"></script>

</head>

<body>
	<div id="bbswrite_wrap">
		<h2 class="bbswrite_title">파티 생성</h2>
		<form method="post"
			action="<%=request.getContextPath() %>/party_create_ok.do"
			onSubmit="return party_check()">
			<table id="bbswrite_t">
				<tr>
					<th>지역</th>
					<td><%@ include file="../../../resources/include/address.jsp"%>
						<select name="party_address">
							<c:forEach var="a" items="${add}" begin="0" end="5">
								<option value="${a}">${a}</option>
							</c:forEach>
						</select></td>
					<th>성별</th>
					<td><%@ include file="../../../resources/include/gender.jsp"%>
						<select name="party_gender">
							<c:forEach var="g" items="${gen}" begin="0" end="2">
								<option value="${g}">${g}</option>
							</c:forEach>
						</select></td>
					<th>나이</th>
					<td>만 <input name="party_age" id="party_age" size="2"
						class="input_box" placeholder="00"/>세
				</tr>

				<tr>
					<th>활동일</th>
						<td colspan=3">
						<input name="party_enddate" id="party_enddate" size="8"
						class="input_box" placeholder="20220101"/></td>
					<th>인원</th>
					<td><input name="party_max_count" id="party_max_count" size="2"
						type="text" placeholder="00"/>명</td>
				</tr>
				 <tr>
					<th>제목</th>
					<td colspan="5"><input name="party_subject" id="party_subject" size="40"
						type="text" /></td>
				</tr>

				<tr>
					<th>글내용</th>
					<td colspan=6><textarea name="party_content" id="party_content" rows="8"
							cols="50" class="input_box"></textarea></td>
				</tr>


			<tr id="bbswrite_menu">
				<td colspan=6 align="center"><input type="submit" value="등록" class="input_button" /> <input
					type="reset" value="취소" class="input_button"
					onclick="$('#party_sudject').focus();" /></td>
			</tr>
			</table>
		</form>
	</div>
</body>
</html>
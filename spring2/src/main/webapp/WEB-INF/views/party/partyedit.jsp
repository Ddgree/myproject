<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>파티 생성</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/party.css" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<!-- 	js파일 수정필요
<script src="<%=request.getContextPath()%>/resources/js/party_check.js"></script>
 -->

</head>

<body>
party_no=${party_no}
	<div id="bbswrite_wrap">
		<h2 class="bbswrite_title">파티 수정</h2>
		<form method="post" action="<%=request.getContextPath()%>/partyedit.do" onSubmit="return party_check()">
			<input type="hidden" name=party_no value=${party_no}> 
			<input type="hidden" name=page value=${page}>
			<table id="bbswrite_t">
				<tr>
					<th>지역</th>
					<td><%@ include file="../../../resources/include/address.jsp"%>
						<select name="party_address">
							<c:forEach var="a" items="${add}" begin="0" end="5">
								<option value="${a}"
									<c:if test="${party_address == a}">${'selected'}
          </c:if>>${a}</option>
							</c:forEach>
					</select></td>
					<th>성별</th>
					<td><%@ include file="../../../resources/include/gender.jsp"%>
						<select name="party_gender">
							<c:forEach var="g" items="${gen}" begin="0" end="2">
								<option value="${g}"
									<c:if test="${party_gender == g}">${'selected'}
          </c:if>>${g}</option>
							</c:forEach>
					</select></td>
					<th>나이</th>
					<td>만 <input name="party_age" id="party_age" size="2"
						class="input_box" placeholder="00" value="${party_age }" />세
				</tr>

				<tr>
					<th>활동일</th>
						<td colspan=3">
						<input name="party_enddate" id="party_enddate" size="8"
						class="input_box" placeholder="20220101"/></td>
				</tr>
				<tr>
					<th>제목</th>
					<td colspan="5"><input name="party_subject" id="party_subject"
						size="40" type="text" value="${party_subject }" /></td>
				</tr>

				<tr>
					<th>글내용</th>
					<td colspan=6><textarea name="party_content"
							id="party_content" rows="8" cols="50" class="input_box">${party_content }</textarea></td>
				</tr>


				<tr id="bbswrite_menu">
					<td colspan=6 align="center"><input type="submit" value="수정" class="input_button" /> 
					<input type="button" value="목록" class="input_button" onclick="location='partyband.do?page=${page}'" /></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
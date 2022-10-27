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
<script src="<%=request.getContextPath()%>/resources/js/party.js"></script>

</head>

<body>
	<div id="bbswrite_wrap">
		<h2 class="bbswrite_title">파티 생성</h2>
		<form method="post"
			action="<%=request.getContextPath()%>/party_ok.do"
			onSubmit="return party_check()">
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
								<option value="${g}"<c:if test="${party_gender == g}">${'selected'}
          </c:if>>${g}</option>
							</c:forEach>
					</select></td>
					<th>나이</th>
					<td>만 <input name="party_age" id="party_age" size="2"
						class="input_box" placeholder="00" value="${party_age }"/>세
				</tr>

				<tr>
					<th>활동일</th>
					<%@ include file="../../../resources/include/month.jsp"%>
					<%@ include file="../../../resources/include/day.jsp"%>
					<td colspan=3"><input name="party_enddate1"
						id="party_enddate1" size="4" class="input_box" placeholder="0000" value="${party_enddate1 }"/>년
						<select name="party_enddate2">
							<c:forEach var="m" items="${mon}" begin="0" end="11">
								<option value="${m}"<c:if test="${party_enddate2 == m}">${'selected'}
          </c:if>>${m}</option>
							</c:forEach>
					</select>월 <select name="party_enddate3">
							<c:forEach var="d" items="${day}" begin="0" end="30">
								<option value="${d}"<c:if test="${party_enddate3 == d}">${'selected'}
          </c:if>>${d}</option>
							</c:forEach>
					</select>일</td>
					<th>인원</th>
					<td><input name="party_max_count" id="party_max_count"
						size="2" type="text" placeholder="00" value="${party_max_count }"/>명</td>
				</tr>
				<tr>
					<th>제목</th>
					<td colspan="5"><input name="party_subject" id="party_subject"
						size="40" type="text" value="${party_subject }"/></td>
				</tr>

				<tr>
					<th>글내용</th>
					<td colspan=6><textarea name="party_content"
							id="party_content" rows="8" cols="50" class="input_box">${party_content }</textarea></td>
				</tr>


				<tr id="bbswrite_menu">
					<td colspan=6 align="center"><input type="submit" value="수정"
						class="input_button" /> <input type="reset" value="목록"
						class="input_button" onclick="location.href='partyband.do'" /></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
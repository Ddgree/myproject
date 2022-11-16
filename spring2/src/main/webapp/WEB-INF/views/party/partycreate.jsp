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
<script src="https://kit.fontawesome.com/f82eca20b8.js" crossorigin="anonymous"></script>

</head>
<body>

<c:if test="${sessionScope.member.member_id == null }">
	<%@ include file="../member/header.jsp"%>
</c:if>
<c:if test="${sessionScope.member.member_id != null}">
	<%@ include file="../member/header_login.jsp"%>
</c:if>
<div class=wrapper>
	<div id="bbswrite_wrap">
		<h2 class="bbswrite_title">파티 생성</h2>
		<form method="post"
			action="<%=request.getContextPath() %>/party_create_ok.do"
			onSubmit="return party_check()">
			<input type="hidden" name="party_id" value="${member.member_id}">
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
					<th>성인 제한</th>
					<td><input type="radio" id="adultonly" name="party_age" value="20">
						<label for="adultonly"><i class="fa-solid fa-o"></i></label> 
					<input type="radio" id="withchild" name="party_age" value="19" checked="checked">
						<label for="withchild"><i class="fa-solid fa-x"></i></label>
					</tr>
	
				<tr>
					<th>활동일</th>
					<td colspan=3><input name="party_enddate" id="party_enddate"
						size="8" class="input_box" placeholder="20220101" /></td>
					<th>모집인원</th>
					<td><input name="party_max_count" id="party_max_count"
						size="3" class="input_box" placeholder="최대 5" />명</td>
				</tr>

				<tr>
					<th>제목</th>
					<td colspan="5"><input name="party_subject" id="party_subject"
						size="40" type="text" /></td>
				</tr>

				<tr>
					<th>글내용</th>
					<td colspan=6><textarea name="party_content"
							id="party_content" rows="8" cols="50" class="input_box"
							placeholder="
							참여신청 인원이 한 명이라도 있으면
							수정 및 삭제가 힘듭니다!
							등록 전 내용을 꼼꼼히 살펴주세요!"></textarea></td>
				</tr>

				<tr id="bbswrite_menu">
					<td colspan=6 align="center">
						<input type="submit" value="등록" class="input_button" /> 
						<input type="reset" value="취소" class="input_button" onclick="location='refresh.do'" />
					</td>
				</tr>
			</table>
		</form>
	</div>
	</div>
</body>
<%@ include file="../member/footer.jsp"%>
</html>
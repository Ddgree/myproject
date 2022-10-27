<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>파티 상세보기</title>
 <link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath() %>/resources/css/party.css" /> 
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/party.js"></script>
<script>

</script>

</head>

<body>
	<div id="bbswrite_wrap">
		<h2 class="bbswrite_title">파티 상세보기</h2>
		<form method="post"
			action="<%=request.getContextPath() %>/party_join.do">
			<table id="bbswrite_t">
				 <tr>
					<th>제목</th>
					<td colspan="5"><input name="party_subject" id="party_subject" size="40"
						type="text" /></td>
						<th>작성자</th>
						<td>${id}</td>
						<th>활동일</th>
						<td>${party.party_enddate }</td>
						<th>인원</th>
						<td>${party.party_count } / ${party.party_max_count }명</td>
				</tr>

				<tr>
					<th>글내용</th>
					<td colspan=6><textarea name="party_content" id="party_content" rows="8"
							cols="50" class="input_box"><pre>${party.party_content }</pre></textarea></td>
				</tr>

<c:choose>
    <c:when test="${sessionScope.userid eq null}">
		<jsp:forward page="/memberLogin"/>
    </c:when>
    <c:otherwise>
		<jsp:forward page="/index"/>
    </c:otherwise>
</c:choose>

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
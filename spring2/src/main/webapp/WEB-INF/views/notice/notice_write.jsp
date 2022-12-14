<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>공지사항 작성 폼</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/notice.css" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/notice.js"></script>

<c:if test="${sessionScope.member.member_id == null }">
	<%@ include file="../member/header.jsp"%>
</c:if>
<c:if test="${sessionScope.member.member_id != null }">
	<%@ include file="../member/header_login.jsp"%>
</c:if>
</head>

<body>
<div class="wrapper">
	<div id="noticewrite_wrap">
		<h2 class="noticewrite_title" align="center">공지사항 작성</h2>
		<form method="post"
			action="<%=request.getContextPath()%>/notice_write_ok.do"
			onSubmit="return notice_check()" enctype="multipart/form-data">
			<input type="hidden" name="page" value="${page}" />
			<div>
			<table id="noticewrite_t">
				<tr>
					<th>관리자</th>
					<td><input name="notice_admin_id" id="notice_admin_id"
						  value="관리자" readonly /></td>
				</tr>

				<tr>
					<th>글제목</th>
					<td><input name="notice_subject" id="notice_subject" size="40"
						class="input_box" /></td>
				</tr>

				<tr>
					<th>글내용</th>
					<td><textarea name="notice_content" id="notice_content"
							rows="8" cols="50" class="input_box"></textarea></td>
				</tr>

				<tr>
					<th>파일첨부</th>
					<td><input name="notice_file1" id="notice_file1" type="file" /></td>
				</tr>
			
			</table>
			</div>
			
			<div align=center style=padding-top:20px>
				<input type="submit" value="등록" class="input_button"> <input
					type="button" value="취소" class="input_button"
					onclick="location='notice_list.do?page=${page}'" />
			</div>
		</form>
	</div>
	</div>
</body>
<%@ include file="../member/footer.jsp" %>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>
<style>
th {
	width: 30%;
}

td {
	width: 50%;
	text-align: center;
}
</style>
<script>
	function fileDown(file) {
		location.href = "http://3.39.24.101/spring/fileDown.do?filecol="
				+ encodeURI(file);
	}
</script>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/boardnotice.css" />

</head>

<c:if test="${sessionScope.member.member_id == null }">
	<%@ include file="../member/header.jsp"%>
</c:if>
<c:if test="${sessionScope.member.member_id != null }">
	<%@ include file="../member/header_login.jsp"%>
</c:if>

<body>
	<div id="board_content_wrap" align="center">
		<h2 class="board_content_title">상세보기</h2>
		<table id="board_content_table" border=1 enctype="multipart/form-data">
			<tr>
				<th>작성자</th>
				<td>${read.board_id}</td>
			</tr>

			<tr>
				<th>제목</th>
				<td>${read.board_subject}</td>
			</tr>

			<tr>
				<th>글내용</th>
				<td><pre>${read.board_content}</pre></td>
			</tr>

			<tr>
				<th>조회수</th>
				<td>${read.board_readcount}</td>
			</tr>

			<tr>
				<th>첨부파일</th>

				<td><a href="file_down.do?file_name=${read.board_file}">${read.board_file}</a>
				</td>
			</tr>
		</table>

		<div id="board_content_menu" style='margin-top: 20px;'>

			<c:if test="${sessionScope.member.member_id == read.board_id}">
				<input type="button" value="수정" class="input_button"
					onclick="location='board_update.do?board_no=${read.board_no}&page=${page}&board_id=${read.board_id}'" />
				<input type="button" value="삭제" class="input_button"
					onclick="location='board_delete.do?board_no=${read.board_no}&page=${page}'" />
				<input type="button" value="목록" class="input_button"
				onclick="location='board_list.do?page=${page}'" />
			</c:if>
			<c:if test="${sessionScope.member.member_id != read.board_id}">
				<input type="button" value="목록" class="input_button"
				onclick="location='board_list.do?page=${page}'" />
			</c:if>
			
		</div>
	</div>
</body>
</html>
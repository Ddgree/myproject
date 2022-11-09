<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>
<script src="https://kit.fontawesome.com/f82eca20b8.js"
	crossorigin="anonymous"></script>
<style>
:text{
	text-align:center;
}

td {
	text-align:center;
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
		<h2 style="padding-top: 90px" align=center>게시글 상세내용</h2>
		<table id="board_content_table" border=1 width=50%
			style="margin-top: 50px;" enctype="multipart/form-data">
			<tr>
				<th><i class="fa-solid fa-pen"></i>&nbsp;${read.board_division}</th>
				<td>${read.board_subject}</td>
				<th>작성자</th>
				<td>${read.board_id}</td>
				<th>작성일</th>
				<td>${read.board_date}</td>
				<th>조회수</th>
				<td>${read.board_readcount}</td>
			</tr>
			
			<tr height=100px>
				<th>글내용</th>
				<td colspan=7>${b_content}</td>
			</tr>

			<tr>
				<th>첨부파일</th>
				<td colspan=7><a
					href="file_down.do?file_name=${read.board_file}">${read.board_file}</a>
				</td>
			</tr>
		</table>

		<div id="board_content_menu" style='margin-top: 20px;'>

			<c:if test="${sessionScope.member.member_id == read.board_id || sessionScope.member.member_id == 'admin'}">
				<input type="button" value="수정" class="input_button"
					onclick="location='board_update.do?board_no=${read.board_no}&page=${page}&board_id=${read.board_id}'" />&nbsp;
				<input type="button" value="삭제" class="input_button"
					onclick="location='board_delete.do?board_no=${read.board_no}&page=${page}&board_id=${read.board_id}'" />&nbsp;
			</c:if>
			<c:if test="${sessionScope.member.member_id != read.board_id && sessionScope.member.member_id == 'admin'}">
			</c:if>
				<input type="button" value="목록" class="input_button"
					onclick="location='board_list.do?page=${page}'" />&nbsp;
		</div>
	</div>
	<hr style="margin:30px auto 30px auto;"/>

	<!-- 댓글 -->
	<div align="center">
		<form method="post" action="reply_write.do?page=${page}&board_no=${read.board_no}">
		<input type="hidden" name="reboard_id" value="${read.board_id}">
		<p>
			<textarea rows="3" cols="30" name="reboard_content" place-holder="댓글을 입력해주세요."></textarea>
			&nbsp;&nbsp;&nbsp;<button type="submit" style="width:30pt; height:25pt; align:center;" class="btn btn-outline-secondary"><h4 align="center"><i class="fa-regular fa-keyboard"></i></h4></button>
		</p>
		</form>
	</div>
	<h3 style="padding-top:20px;" align=center>댓글&nbsp;<i class="fa-regular fa-comment-dots"></i></h3>
	<hr />
	<tr>
		<c:forEach items="${reply}" var="reply">
			<td>
				<div align="center">
					<p><i class="fa-regular fa-face-smile"></i>&nbsp;${reply.reboard_id} / <fmt:formatDate value="${reply.reboard_date}" pattern="yyyy-MM-dd" /></p>
					<p>${reply.reboard_content}</p>
				</div>
			</td>
			<hr width=10% style="color:#f3d49e; border-style:dotted;">
		</c:forEach>
		

	</tr>

</body>
</html>
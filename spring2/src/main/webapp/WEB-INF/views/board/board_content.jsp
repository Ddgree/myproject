<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
	$(function() {	
		$('#reboard_text').click(function() {
			if (!reboard_content.value) {
				alert('댓글 입력후에 클릭하세요!');
				reboard_content.focus();
				return false;
			}
		});
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
		<h2 style=padding-top:90px align=center>게시글 상세내용</h2>
		<table id="board_content_table" border=1 width=50% style=margin-top:50px; enctype="multipart/form-data">
			<tr>
				<th width=50px>제목</th>
				<td>${read.board_subject}</td>
				<th>작성자</th>
				<td>${read.board_id}</td>
				<th>작성일</th>
				<td>${read.board_date}</td>
				<th>조회수</th>
				<td>${read.board_readcount}</td>
			</tr>

			<tr>
				<th>글내용</th>
				<td colspan=7><pre>${read.board_content}</pre></td>
			</tr>

			<tr>
				<th>첨부파일</th>
				<td colspan=7><a href="file_down.do?file_name=${read.board_file}">${read.board_file}</a>
				</td>
			</tr>
		</table><br><br>
		
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
	<hr width=100%/>
	<!-- 댓글 작성폼 -->
	<div id = "reboard_text" align="center">
	<form name="frm" id="frm">
		<input type="hidden" name="reboard_id" value="${sessionScope.member.member_id}">
		<input type="hidden" name="board_bno" value="${board_no}">
		댓글입력:
		<textarea name="reboard_content"  id="reboard_content" rows="5" cols="40" 
     	 class="input_box"></textarea>
		<input type="button" value="작성" class="input_button" onclick="location='reboard_reply_write.do?page=${page}&
		board_id=${sessionScope.member.member_id}&board_no=${read.board_no}'" />
	</form>
	</div>
	
	
	<!-- 댓글조회 -->
	<div id = "reboard_search">
		<table class="reboard_table" width=30% align="center" style=margin-top:30px;>
		<h2 align="center"> 댓글 목록 </h2>
		<c:forEach items="${replyList}" var="replyList">
		<tr>
			<th>작성자</th>
			<th>내용</th>
			<th>작성일</th>
		</tr>
		<tr>
			<th>${replyList.reboard_id}</th>
			<td>${replyList.reboard_content}</td>
			<td> <fmt:formatDate value="${replyList.reboard_date}" pattern="yyyy-MM-dd"/></td>
		</tr>
		</c:forEach>
		</table>
	</div>
</body>
</html>
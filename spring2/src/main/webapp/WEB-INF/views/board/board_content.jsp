<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/f82eca20b8.js"
	crossorigin="anonymous"></script>
<script type="text/javascript">
	$(function() {	// load('slist?num=${board.num}')
		$('#reboard_list').load('reboard_list.do?board_no=${read.board_no}');
		$('#reboard_button').click(function() {
			if (!reply_text_frm.reboard_content.value) {
				alert('댓글 입력후에 클릭하시오');
				reply_text_frm.reboard_content.focus();
				return false;
			}
		});
	});
</script>
<style>
th {
	padding: 20px 10px;
	border: 1px solid #cccccc;
	text-align: cetner;
}

td {
	padding: 20px 20px;
	border: 1px solid #cccccc;
}

#reboard_content, #reboard_button {
	vertical-align: middle;
}

.input_button {
	background-color: black;
	color: white;
	text-align: center;
	font-size: 20px;
	width: 150px;
	height: 50px;	
	transition: background 0.5s ease-in-out, color 0.5s ease-in-out;
	cursor: pointer;
}
.input_button:hover {
	background: #61443a;
	color: white;
	border: 0;
}

:text {
	text-align: center;
}
</style>
<script>
	function fileDown(file) {
		location.href = "http://3.39.24.101/spring/fileDown.do?filecol="
				+ encodeURI(file);
	}
	function del_b_content() {
		window.open("board_delete.do?board_no=${read.board_no}&page=${page}&board_id=${read.board_id}", "게시물 삭제", "width=500,height=300");
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
			<tr align="center">
				<th><i class="fa-solid fa-pen"></i>&nbsp;${read.board_division}</th>
				<td>${read.board_id}</td>
				<td>${read.board_date}</td>
				<td>${read.board_readcount}</td>
			</tr>
			<tr align="center">
				<th>제목</th>
				<td colspan="3">${read.board_subject}</td>
			</tr>
			<tr height=150px>
				<th>글내용</th>
				<td colspan=7>&nbsp;&nbsp;${b_content}</td>
			</tr>

			<tr>
				<th>첨부파일</th>
				<td colspan=7><a
					href="file_down.do?file_name=${read.board_file}">${read.board_file}</a>
				</td>
			</tr>
		</table>

		<div id="board_content_menu" style='margin-top: 20px;'>

			<c:if
				test="${sessionScope.member.member_id == read.board_id || sessionScope.member.member_id == 'admin'}">
				<input type="button" value="수정" class="input_button"
					onclick="location='board_update.do?board_no=${read.board_no}&page=${page}&board_id=${read.board_id}'" />&nbsp;
				<input type="button" value="삭제" class="input_button"
					onclick="del_b_content()" />&nbsp;
			</c:if>
			<c:if
				test="${sessionScope.member.member_id != read.board_id && sessionScope.member.member_id == 'admin'}">
			</c:if>
			<input type="button" value="목록" class="input_button"
				onclick="location='board_list.do?page=${page}'" />&nbsp;
		</div>
	</div>
	<hr style="margin: 30px auto; width: 50%;" />

	<!-- 댓글 -->
	<div align="center">
		<form method="post" id="reply_text_frm"
			action="reply_write.do?page=${page}&board_no=${read.board_no}">
			<input type="hidden" name="reboard_id" value="${member.member_id}">
			<textarea rows="4" cols="50" id="reboard_content"
				name="reboard_content" placeholder="댓글을 입력해주세요."
				style="resize: none;"></textarea>
			<button type="submit" id="reboard_button"
				style="width: 50pt; height: 75pt; margin-left: -5px;">
				<i class="fa-regular fa-keyboard fa-2x"></i>
			</button>
		</form>
	</div>
	<h3 style="padding-top: 20px;" align=center>
		댓글&nbsp;<i class="fa-regular fa-comment-dots"></i>
	</h3>
	<div id="reboard_list"></div>
</body>
</html>
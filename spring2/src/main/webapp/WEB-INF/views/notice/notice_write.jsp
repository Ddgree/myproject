<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>공지사항 작성 폼</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/boardnotice.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/NoticeButton.css" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/notice.js"></script>

<c:if test="${sessionScope.member.member_id == null }">
	<%@ include file="../member/header.jsp"%>
</c:if>
<c:if test="${sessionScope.member.member_id != null }">
	<%@ include file="../member/header_login.jsp"%>
</c:if>
<style>
#board_write_table{
	border: 1px solid #61443A;
	border-radius: 15px;
	overflow:hidden;
}
th {
	width: 100px;
	height: 50px;
	padding: 10px 20px;
	font-size: 20px;
}

td {
	width: 500px;
	height: 50px;
	font-size: 18px;
}
</style>

</head>

<body>
<div class="wrapper">
	<div id="noticewrite_wrap" align="center">
		<h2 style=padding-top:90px align="center">공지사항 작성</h2>
		<form method="post"
			action="<%=request.getContextPath()%>/notice_write_ok.do"
			onSubmit="return notice_check()" enctype="multipart/form-data">
			<input type="hidden" name="page" value="${page}" />
			<div>
			<table id="board_write_table" border=1>
				<tr>
					<th>작성자</th>
					<td><input name="notice_admin_id" id="notice_admin_id"
						  value="관리자" class="input_box" readonly /></td>
				</tr>

				<tr>
					<th>글제목</th>
					<td><input name="notice_subject" id="notice_subject"
						class="input_box" /></td>
				</tr>

				<tr>
					<th>글내용</th>
					<td><textarea name="notice_content" id="notice_content"
							rows="8" cols="50" class="input_box_write"></textarea></td>
				</tr>

				<tr>
					<th>파일첨부</th>
					<td><input name="notice_file1" id="notice_file1" type="file" /></td>
				</tr>
			
			</table>
			</div>
			
			<div align=center style=padding-top:20px>
				<input type="submit" value="등록" class="button"> <input
					type="button" value="취소" class="button"
					onclick="location='notice_list.do?page=${page}'" />
			</div>
		</form>
	</div>
	</div>
</body>
<%@ include file="../member/footer.jsp" %>
</html>
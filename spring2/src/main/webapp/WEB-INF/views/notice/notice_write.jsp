<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>공지사항 작성 폼</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/boardnotice.css" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/notice.js"></script>

<c:if test="${sessionScope.member.member_id == null }">
	<%@ include file="../member/header.jsp"%>
</c:if>
<c:if test="${sessionScope.member.member_id != null }">
	<%@ include file="../member/header_login.jsp"%>
</c:if>
<style>
th {
	padding: 10px 20px;
	border: 1px solid #cccccc;
	font-size: 20px;
}

td {
	border: 1px solid #cccccc;
	font-size: 18px;
}
.input_button_u {
	background-color: black;
	color: white;
	text-align: center;
	font-size: 20px;
	width: 150px;
	height: 50px;	
	transition: background 0.5s ease-in-out, color 0.5s ease-in-out;
	cursor: pointer;
}
.input_button_u:hover {
	background: #61443a;
	color: white;
	border: 0;
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
			<table id="noticewrite_t">
				<tr>
					<th>관리자</th>
					<td><input name="notice_admin_id" id="notice_admin_id" style="width:99%; height:30px;"
						  value="관리자" readonly /></td>
				</tr>

				<tr>
					<th>글제목</th>
					<td><input name="notice_subject" id="notice_subject" style="width:99%; height:30px;"
						class="input_box" /></td>
				</tr>

				<tr>
					<th>글내용</th>
					<td><textarea name="notice_content" id="notice_content"
							rows="8" cols="50" style="resize: none;" class="input_box"></textarea></td>
				</tr>

				<tr>
					<th>파일첨부</th>
					<td><input name="notice_file1" id="notice_file1" type="file" /></td>
				</tr>
			
			</table>
			</div>
			
			<div align=center style=padding-top:20px>
				<input type="submit" value="등록" class="input_button_u"> <input
					type="button" value="취소" class="input_button_u"
					onclick="location='notice_list.do?page=${page}'" />
			</div>
		</form>
	</div>
	</div>
</body>
<%@ include file="../member/footer.jsp" %>
</html>
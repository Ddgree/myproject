<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>공지사항 수정폼</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/boardnotice.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/NoticeButton.css" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="<%=request.getContextPath()%> /resources/js/notice.js"></script>

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
</style>
</head>

<body>
<div class="wrapper">
	<div id="board_write" align="center">
		<h2 style=padding-top:90px align="center">공지사항 수정폼</h2>
		<form method="post" action="notice_edit_ok.do" enctype="multipart/form-data"  
			onSubmit="return notice_check()">
			<input type="hidden" name="notice_no" value="${ncont.notice_no}" />
			<input type="hidden" name="pageNum" value="${pageNum}" />

			<table id="noticewrite_t">
				<tr>
					<th>작성자</th>
					<td><input name="notice_admin_id" id="notice_admin_id"
						 class="input_box" value="관리자" readonly /></td>
				</tr>

				<tr>
					<th>글제목</th>
					<td><input name="notice_subject" id="notice_subject" style="width:99%; height:30px;"
						class="input_box" value="${ncont.notice_subject}" /></td>
				</tr>

				<tr>
					<th>글내용</th>
					<td><textarea name="notice_content" id="notice_content"
							rows="8" cols="50" class="input_box_write">${ncont.notice_content}</textarea>
					</td>
				</tr>
				<tr rowspan=2>
					<th>첨부파일</th>
					<td>${ncont.notice_file} <br><hr style="border-pattern:dotted;"/>
					<input type=file name="notice_file1" >
					</td>
				</tr>

			</table>

			<div>
				<input type="submit" value="수정" class="button" /> 
				<input type="button" value="취소" class="button" onclick="history.go(-1)" />
			</div>
		</form>
	</div>
	</div>
</body>
<%@ include file="../member/footer.jsp" %>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>공지사항 내용보기</title>
<script>
function notice_delete() 
{
	window.open("notice_del.do?notice_no=${ncont.notice_no}&pageNum=${pageNum}", "공지삭제", "width=450,height=350");
	//자바 스크립트에서 window객체의 open("공지창경로와 파일명","공지창이름","공지창속성")
}
</script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/NoticeButton.css" />
<c:if test="${sessionScope.member.member_id == null }">
	<%@ include file="../member/header.jsp"%>
</c:if>
<c:if test="${sessionScope.member.member_id != null }">
	<%@ include file="../member/header_login.jsp"%>
</c:if>
</head>

<body>
<div class="wrapper">
	<div id="noticecont_wrap">
		<h2 style=padding-top:90px align=center>공지사항 내용보기</h2>
		<table  border=1 id="noticecont_t" width=60% align="center" style=margin-top:50px>
			<tr>
				<th height=50>제목</th>
				<td width=60%>${ncont.notice_subject}</td>
				<th>작성일</th>
				<td align=center>${ncont.notice_date}</td>
				<th>조회수</th>
				<td width=50 align=center>${ncont.notice_readcount}</td>
			</tr>
			<tr>
				<th>글내용</th>
				<td colspan=5 height=300 style=vertical-align:top>
					<%--  ${board_cont} --%> <pre>${ncont.notice_content}</pre>
				</td>
			</tr>
			<tr>
				<th>파일첨부</th>
				<td colspan=5 height=40><c:if test="${ncont.notice_file != null}">
						<a href="filedown.do?notice_file=${ncont.notice_file}">
							${ncont.notice_file} </a>
					</c:if></td>
			</tr>
		</table>
		

		<div id="noticecont_menu" width="70" align="center" style=margin-top:20px >
			<c:if test="${member.member_id eq 'admin'}">
				<input type="button" value="수정" class="button"
					onclick="location='notice_edit.do?notice_no=${ncont.notice_no}&pageNum=${pageNum}'" />
				<input type="button" value="삭제" class="button"
					onclick="notice_delete()" />
			</c:if>
			<input type="button" value="목록" class="button"
				onclick="location='notice_list.do?pageNum=${pageNum}'" />
		</div>
	</div>
	</div>
</body>
<%@ include file="../member/footer.jsp" %>
</html>
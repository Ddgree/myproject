<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>공지사항 내용보기</title>
</head>

<body>
	<div id="noticecont_wrap">
		<h2 class="noticecont_title">공지사항 내용보기</h2>
		<table id="noticecont_t">
			<tr>
				<th>제목</th>
				<td>${ncont.notice_subject}</td>
			</tr>

			<tr>
				<th>글내용</th>
				<td>
					<%--  ${board_cont} --%> 
					<pre>${ncont.notice_content}</pre>
				</td>
			</tr>

			<tr>
				<th>조회수</th>
				<td>${ncont.notice_readcount}</td>
			</tr>
			
			<tr>
				<th>파일첨부</th>
				<td>
				<c:if test="${ncont.notice_file != null}">
			<a href="filedown.do?notice_file=${ncont.notice_file}">					
					${ncont.notice_file}
			</a>
			</c:if>
				</td>
			</tr>
		</table>

		<div id="noticecont_menu">
			<c:if test="${id eq 'admin'}">
			<input type="button" value="수정" class="input_button"
				onclick="location='notice_cont.do?notice_no=${ncont.notice_no}&page=${page}&state=edit'" />
			<input type="button" value="삭제" class="input_button"
				onclick="location='notice_cont.do?notice_no=${ncont.notice_no}&page=${page}&state=del'" />
			</c:if>
			<input type="button" value="목록" class="input_button"
				onclick="location='notice_list.do?page=${page}'" />
		</div>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="partyband.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>공지사항 목록</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/notice.css" type="text/css">

<c:if test="${sessionScope.member.member_id == null }">
	<%@ include file="../member/header.jsp"%>
</c:if>
<c:if test="${sessionScope.member.member_id != null }">
	<%@ include file="../member/header_login.jsp"%>
</c:if>
</head>

<body>
	<!-- 게시판 리스트 -->
	<div id="noticelist_wrap">
		<h2 class="noticelist_title">공지사항 목록</h2>
		<c:if test="${id eq 'admin'}">
			<div id="noticelist_w">
				<input type="button" value="글쓰기" class="input_button"
					onclick="location='notice_write.do?page=${page}'">
			</div>
		</c:if>
		<div id="noticelist_c">글 개수 : ${listcount}</div>

		<table id="noticelist_t" width="70%">
			<tr align="center" valign="middle">
				<td>
					<div align="center">번호</div>
				</td>
				<td>
					<div align="center">제목</div>
				</td>
				<td>
					<div align="center">날짜</div>
				</td>
				<td>
					<div align="center">조회수</div>
				</td>
			</tr>

			<!-- 화면 출력 번호  변수 정의 -->
			<c:set var="num" value="${listcount-(page-1)*10}" />

			<!-- 반복문 시작 -->
			<c:forEach var="n" items="${noticelist}">

				<tr align="center" valign="middle">
					<td>
						<!-- 번호 출력 부분 --> <c:out value="${num}" /> <c:set var="num"
							value="${num-1}" />
					</td>

					<td>
						<div align="center">
							<!-- 제목 출력 부분 -->
							<a
								href="notice_cont.do?notice_no=${n.notice_no}&page=${page}&state=cont">
								${n.notice_subject} </a>
						</div>
					</td>
					<td>
						<div align="center">${n.notice_date}</div>
					</td>
					<td>
						<div align="center">${n.notice_readcount}</div>
					</td>
				</tr>

			</c:forEach>
			<!-- 반복문 끝 -->
		</table>


		<div id="noticelist_paging">
			<c:if test="${page <=1 }">
				[이전]&nbsp;
			</c:if>

			<c:if test="${page > 1 }">
				<a href="notice_list.do?page=${page-1}">[이전]</a>&nbsp;
			</c:if>

			<c:forEach var="a" begin="${startpage}" end="${endpage}">
				<c:if test="${a == page }">
					[${a}]
				</c:if>
				<c:if test="${a != page }">
					<a href="notice_list.do?page=${a}">[${a}]</a>&nbsp;
				</c:if>
			</c:forEach>

			<c:if test="${page >= maxpage }">
				[다음] 
			</c:if>
			<c:if test="${page < maxpage }">
				<a href="notice_list.do?page=${page+1}">[다음]</a>
			</c:if>

		</div>
	</div>
</body>
<%@ include file="../member/footer.jsp" %>
</html>
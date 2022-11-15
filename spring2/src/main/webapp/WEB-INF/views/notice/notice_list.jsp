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
<style>
#search_button, #keyword, #search {
	vertical-align: middle;
}
table{
	border:1; 
	width:60%;
	border-color : 
}
th {
	padding: 5px 20px;
	border: 1px solid #cccccc;
	font-size: 20px;
}

td {
	padding: 20px 20px;
	border: 1px solid #cccccc;
}
</style>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/boardnotice.css" />
<script src="https://kit.fontawesome.com/f82eca20b8.js"
	crossorigin="anonymous"></script>
	
<c:if test="${sessionScope.member.member_id == null }">
	<%@ include file="../member/header.jsp"%>
</c:if>
<c:if test="${sessionScope.member.member_id != null}">
	<%@ include file="../member/header_login.jsp"%>
</c:if>

</head>

<body>
<div class="wrapper">
	<div class="container" align="center">
		<h2 style=padding-top:90px align=center>공지사항 목록</h2>
		<table border=1 width=60% align="center">
		<div style="margin-left:54%; margin-bottom:20px;">
			<c:if test="${member.member_id eq 'admin'}">
			<button type="submit" id="writebutton" name="button"
				style="width: 80pt; height: 30pt"
				onClick="location='notice_write.do?page=${page}'">
				<i class="fa-regular fa-pen-to-square fa-lg">&nbsp;글쓰기</i>
			</button>
			</c:if>
		</div>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			
			<c:if test="${not empty list}">
				<c:set var="no1" value="${no }"></c:set>
				<c:forEach var="notice" items="${list }">
					<tr height=30>
						<td align=center>${no1}</td>
							<td align=center><a href="notice_cont.do?notice_no=${notice.notice_no}&pageNum=${pp.currentPage}"
							       class="btn btn-default"> 
								${notice.notice_subject} </a><c:if test="${notice.notice_file != null}">
									<i class="fa-solid fa-image"></i>
								</c:if> <c:if test="${notice.notice_file == null}"></c:if></td>
							<td align=center>${notice.notice_date}</td>
							<td align=center>${notice.notice_readcount}</td>
					</tr>
					<c:set var="no1" value="${no1 - 1}"/>
				</c:forEach>
			</c:if>
		</table>
		<div align="center" style="margin-bottom:30px; margin-top:30px;">
		<form action="notice_list.do" align="center">
			<input type="hidden" name="pageNum" value="1"> 
			<select	name="search" id="search"style="height:30pt;">
				<option value="notice_subject"	<c:if test="${search=='notice_subject'}">selected="selected" </c:if>>제목</option>
				<option value="notice_content"	<c:if test="${search=='notice_content'}">selected="selected" </c:if>>내용</option>
				<option value="subcon"	<c:if test="${search=='subcon'}">selected="selected" </c:if>>제목+내용</option>
			</select> 
			<input type="text" name="keyword" id="keyword"
					style="width: 200pt; height: 26pt;" placeholder="키워드를 검색해주세요.">
				&nbsp;
				<button type="submit" id="search_button"
					style="width: 50pt; height: 30pt;">
					<i class="fa-solid fa-magnifying-glass fa-2x"></i>
				</button>
		</form>
		</div>
		
		<div align="center">
			<!-- 검색 했을 경우의 페이징 처리 -->
			<c:if test="${not empty keyword}">
				<c:if test="${pp.currentPage == 1 }">
					<div class=blackbutton-inactive><<</div>&nbsp; </c:if>
				<c:if test="${pp.currentPage != 1 }">
					<a href="notice_list.do?pageNum=1&search=${search}&keyword=${keyword}"><div class=blackbutton-active>
							<<</div>&nbsp;</a>
				</c:if>
				<c:if test="${pp.currentPage <=1 }">
					<div class=blackbutton-inactive><</div>&nbsp; </c:if>
				<c:if test="${pp.currentPage > 1 }">
					<a href="notice_list.do?pageNum=${pp.startPage - 1}&search=${search}&keyword=${keyword}"><div
							class=blackbutton-active><</div>&nbsp;</a>
				</c:if>
				
				<c:forEach var="a" begin="${pp.startPage}" end="${pp.endPage}">
					<c:if test="${a == pp.currentPage }">
						<div class=blackbutton-selected>${a }</div>
					</c:if>
					<c:if test="${a != pp.currentPage }">
						<a href="notice_list.do?page=${a}&search=${search}&keyword=${keyword}"><div class=blackbutton-active>
								${a }</div></a>
					</c:if>
				</c:forEach>
				
				<c:if test="${pp.currentPage >= pp.totalPage }">
					<div class=blackbutton-inactive>></div>&nbsp; </c:if>
				<c:if test="${pp.currentPage < pp.totalPage }">
					<a href="notice_list.do?pageNum=${page+1}&search=${search}&keyword=${keyword}"><div
							class=blackbutton-active>></div>&nbsp;</a>
				</c:if>
				<c:if test="${pp.currentPage == pp.totalPage }">
					<div class=blackbutton-inactive>>></div>&nbsp; </c:if>
				<c:if test="${pp.currentPage != pp.totalPage }">
					<a href="notice_list.do?pageNum=${pp.totalPage}&search=${search}&keyword=${keyword}"><div
							class=blackbutton-active>>></div>&nbsp;</a>
				</c:if>
<%-- 				
				<c:if test="${pp.startPage > pp.pagePerBlk }">
					<a
						href="board_list.do?pageNum=${pp.startPage - 1}&search=${search}&keyword=${keyword}">이전</a>
				</c:if>
				<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
					<a
						href="board_list.do?pageNum=${i}&search=${search}&keyword=${keyword}">${i}</a>
				</c:forEach>
				<c:if test="${pp.endPage < pp.totalPage}">
					<a
						href="board_list.do?pageNum=${pp.endPage + 1}&search=${search}&keyword=${keyword}">다음</a>
				</c:if> --%>
			</c:if>

			<!-- 전체 목록의 페이징 처리 -->
			<c:if test="${empty keyword}">
			<c:if test="${pp.currentPage == 1 }">
					<div class=blackbutton-inactive><<</div>&nbsp; </c:if>
				<c:if test="${pp.currentPage != 1 }">
					<a href="notice_list.do?pageNum=1"><div class=blackbutton-active>
							<<</div>&nbsp;</a>
				</c:if>
				<c:if test="${pp.currentPage <=1 }">
					<div class=blackbutton-inactive><</div>&nbsp; </c:if>
				<c:if test="${pp.currentPage > 1 }">
					<a href="notice_list.do?pageNum=${pp.currentPage - 1}"><div
							class=blackbutton-active><</div>&nbsp;</a>
				</c:if>
				
				<c:forEach var="a" begin="${pp.startPage}" end="${pp.endPage}">
					<c:if test="${a == pp.currentPage }">
						<div class=blackbutton-selected>${a }</div>
					</c:if>
					<c:if test="${a != pp.currentPage }">
						<a href="notice_list.do?pageNum=${a}"><div class=blackbutton-active>
								${a }</div></a>
					</c:if>
				</c:forEach>
				
				<c:if test="${pp.currentPage >= pp.totalPage }">
					<div class=blackbutton-inactive>></div>&nbsp; </c:if>
				<c:if test="${pp.currentPage < pp.totalPage }">
					<a href="notice_list.do?pageNum=${pp.currentPage + 1}"><div
							class=blackbutton-active>></div>&nbsp;</a>
				</c:if>
				<c:if test="${pp.currentPage == pp.totalPage }">
					<div class=blackbutton-inactive>>></div>&nbsp; </c:if>
				<c:if test="${pp.currentPage != pp.totalPage }">
					<a href="notice_list.do?pageNum=${pp.totalPage}"><div
							class=blackbutton-active>>></div>&nbsp;</a>
				</c:if>
<%-- 				
				<c:if test="${pp.startPage > pp.pagePerBlk }">
					<a href="board_list.do?pageNum=${pp.startPage - 1}">이전</a>
				</c:if>
				<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
					<a href="board_list.do?pageNum=${i}">${i}</a>
				</c:forEach>
				<c:if test="${pp.endPage < pp.totalPage}">
					<a href="board_list.do?pageNum=${pp.endPage + 1}">다음</a>
				</c:if> --%>
			</c:if>
		</div>
	</div>
	</div>
</body>
<%@ include file="../member/footer.jsp" %>
</html>
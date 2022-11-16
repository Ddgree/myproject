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
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/boardnotice.css" />
<style>
#search_button, #keyword, #search {
	vertical-align: middle;
}

table {
	border-radius: 15px;
	width: 60%;
	margin-top:50px;
	overflow:hidden;
}

th {
	padding: 5px 20px;
	border-bottom: 1px solid #61443A;
	background:#61443A;
	color:white;
	font-size: 20px;
}
th.board_no{
	border-top-left-radius: 15px;
	
} 
th.board_readcount{
	border-top-right-radius: 15px;
}
 

td {
	padding: 30px 20px;
	background:#FFECE5;
	font-size: 17px;
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
		<h2 style="padding-top:90px" align=center>공지사항 목록</h2>
		<table align="center">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			<c:if test="${not empty list}">
				<c:set var="no1" value="${no }"></c:set>
				<c:forEach var="notice" items="${list }">
					<tr>
						<td align=center>${no1}</td>
							<td style="text-align: left;"><a href="notice_cont.do?notice_no=${notice.notice_no}&pageNum=${pp.currentPage}"
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
		<hr style="width: 60%; margin: 50px auto;" />
		<div align="center" style="margin-bottom:30px;">
		<form action="notice_list.do" align="center">
			<input type="hidden" name="pageNum" value="1"> 
			<select	name="search" id="search"style="height:30pt;" class=input_search>
				<option value="notice_subject"	<c:if test="${search=='notice_subject'}">selected="selected" </c:if>>제목</option>
				<option value="notice_content"	<c:if test="${search=='notice_content'}">selected="selected" </c:if>>내용</option>
				<option value="subcon"	<c:if test="${search=='subcon'}">selected="selected" </c:if>>제목+내용</option>
			</select> 
			<input type="text" name="keyword" id="keyword"
					class="input_box_keyword" placeholder="키워드를 검색해주세요.">
				&nbsp;
				<button type="submit" id="search_button"
					style="width: 50pt; height: 30pt;" class="input_search">
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
			</c:if>
		</div>
		<hr style="width: 30%; margin: 30px auto;" />
		<div>
			<c:if test="${member.member_id eq 'admin'}">
			<button type="submit" id="writebutton" name="button"
				style="width: 100pt; height: 40pt" class="input_search"
				onClick="location='notice_write.do?page=${page}'">
				<i class="fa-regular fa-pen-to-square fa-lg">&nbsp;글쓰기</i>
			</button>
			</c:if>
		</div>
	</div>
	</div>
</body>
<%@ include file="../member/footer.jsp" %>
</html>
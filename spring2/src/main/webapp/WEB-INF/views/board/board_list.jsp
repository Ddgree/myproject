<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>커뮤니티</title>
<style>
a{
text-decoration-line:none;
}
</style>
</head>
<c:if test="${sessionScope.member.member_id == null }">
	<%@ include file="../member/header.jsp"%>
</c:if>
<c:if test="${sessionScope.member.member_id != null }">
	<%@ include file="../member/header_login.jsp"%>
</c:if>
<body>
	<div id="root">
		<header align="center">
			<h1>커뮤니티</h1>
		</header>
		<hr width=60%/>

		<div id="container">
			<form role="form" method="post">
				<table border=1 width=50% align=center>
					<tr>
						<th>번호</th>
						<th>구분</th>
						<th>작성자</th>
						<th>제목</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
					<c:set var="no1" value="${no}"></c:set>
					<c:forEach items="${list}" var="list">
						<tr align="center">
							<td><c:out value="${list.board_no}" /></td>
							<td><c:out value="${list.board_division}" /></td>
							<td><c:out value="${sessionId}" /></td>
							<td><a href="board_content.do?page=${page}&board_no=${list.board_no}"><c:out
										value="${list.board_subject}" /></a></td>
							<td><fmt:formatDate value="${list.board_date}"
									pattern="yyyy-MM-dd" /></td>
							<td><c:out value="${list.board_readcount}" /></td>
						</tr>
						<c:set var="no1" value="${no1 - 1}"/>
					</c:forEach>
				</table>
			</form>
		</div>
		<hr width=60%/>
				<form action="board_list.do" align="center">
			<input type="hidden" name="pageNum" value="1"> 
			<select	name="search">
				<option value="board_subject"	<c:if test="${search=='board_subject'}">selected="selected" </c:if>>제목</option>
				<option value="board_content"	<c:if test="${search=='board_content'}">selected="selected" </c:if>>내용</option>
				<option value="board_id"	<c:if test="${search=='${sessionId}'}">selected="selected" </c:if>>작성자</option>
				<option value="subcon"	<c:if test="${search=='subcon'}">selected="selected" </c:if>>제목+내용</option>
			</select> 
			<input type="text" name="keyword"> 
			<input type="submit" value="검색">
		</form>
		
		<div class="pagination" align="center">
			<!-- 검색 했을 경우의 페이징 처리 -->
			<c:if test="${not empty keyword}">
				<c:if test="${pp.startPage > pp.pagePerBlk }">
					<a href="board_list.do?pageNum=${pp.startPage - 1}&search=${search}&keyword=${keyword}">이전</a>
				</c:if>
				<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
					<a href="board_list.do?pageNum=${i}&search=${search}&keyword=${keyword}">${i}</a>
				</c:forEach>
				<c:if test="${pp.endPage < pp.totalPage}">
					<a href="board_list.do?pageNum=${pp.endPage + 1}&search=${search}&keyword=${keyword}">다음</a>
				</c:if>
			</c:if>
			
			<!-- 전체 목록의 페이징 처리 -->
			<c:if test="${empty keyword}">
				<c:if test="${pp.startPage > pp.pagePerBlk }">
					<a href="board_list.do?pageNum=${pp.startPage - 1}">이전</a>
				</c:if>
				<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
						<a href="board_list.do?pageNum=${i}">${i}</a>
				</c:forEach>
				<c:if test="${pp.endPage < pp.totalPage}">
					<a href="board_list.do?pageNum=${pp.endPage + 1}">다음</a>
				</c:if>
			</c:if>
		</div>
		<hr width=10% />
		<div align="center" style="margin-top:20px">
			<input type="button" id="writebutton" name="button" value="글쓰기" style="width:50pt;height:30pt"
			onClick="location='board_write.do'" />
			<input type="button" id="listbutton" name="button" value="목록" style="width:50pt;height:30pt"
			onClick="location='board_list.do'" />
		</div>
	</div>
</body>
</html>
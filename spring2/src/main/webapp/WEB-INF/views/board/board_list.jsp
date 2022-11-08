<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>커뮤니티</title>
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
	<div id="root">
		<div id="container">
			<form role="form" method="post">
				<table border=1 width=50% align=center style='margin-top:10%;'>
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
							<td><c:out value="${list.board_id}" /></td>
							<td><a
								href="board_content.do?page=${page}&board_no=${list.board_no}&board_id=${member.member_id}"><c:out
										value="${list.board_subject}" /></a></td>
							<td><fmt:formatDate value="${list.board_date}"
									pattern="yyyy-MM-dd" /></td>
							<td><c:out value="${list.board_readcount}" /></td>
						</tr>
						<%-- <c:set var="no1" value="${no1 - 1}" /> --%>
					</c:forEach>
				</table>
			</form>
		</div>
		<hr />
		<div align="center">
			<form action="board_list.do" align="center">
				<input type="hidden" name="page" value="1"> <select
					name="search">
					<option value="board_subject"
						<c:if test="${search=='board_subject'}">selected="selected" </c:if>>제목</option>
					<option value="board_content"
						<c:if test="${search=='board_content'}">selected="selected" </c:if>>내용</option>
					<option value="board_id"
						<c:if test="${search=='${sessionId}'}">selected="selected" </c:if>>작성자</option>
					<option value="subcon"
						<c:if test="${search=='subcon'}">selected="selected" </c:if>>제목+내용</option>
				</select> <input type="text" name="keyword"> <input type="submit"
					value="검색">
			</form>
		</div>

		<div align="center">
			<!-- 검색 했을 경우의 페이징 처리 -->
			<c:if test="${not empty keyword}">
				<c:if test="${pp.currentPage == 1 }">
					<div class=blackbutton-inactive><<</div>&nbsp; </c:if>
				<c:if test="${pp.currentPage != 1 }">
					<a
						href="board_list.do?page=${page}&search=${search}&keyword=${keyword}"><div
							class=blackbutton-active><<</div>&nbsp;</a>
				</c:if>
				<c:if test="${pp.currentPage <=1 }">
					<div class=blackbutton-inactive><</div>&nbsp; </c:if>
				<c:if test="${pp.currentPage > 1 }">
					<a
						href="board_list.do?page=${pp.startPage - 1}&search=${search}&keyword=${keyword}"><div
							class=blackbutton-active><</div>&nbsp;</a>
				</c:if>

				<c:forEach var="a" begin="${pp.startPage}" end="${pp.endPage}">
					<c:if test="${a == pp.currentPage }">
						<div class=blackbutton-selected>${a }</div>
					</c:if>
					<c:if test="${a != pp.currentPage }">
						<a
							href="board_list.do?page=${a}&search=${search}&keyword=${keyword}"><div
								class=blackbutton-active>${a }</div></a>
					</c:if>
				</c:forEach>

				<c:if test="${pp.currentPage >= pp.totalPage }">
					<div class=blackbutton-inactive>></div>&nbsp; </c:if>
				<c:if test="${pp.currentPage < pp.totalPage }">
					<a
						href="board_list.do?page=${page+1}&search=${search}&keyword=${keyword}"><div
							class=blackbutton-active>></div>&nbsp;</a>
				</c:if>
				<c:if test="${pp.currentPage == pp.totalPage }">
					<div class=blackbutton-inactive>>></div>&nbsp; </c:if>
				<c:if test="${pp.currentPage != pp.totalPage }">
					<a
						href="board_list.do?page=${pp.totalPage}&search=${search}&keyword=${keyword}"><div
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
					<a href="board_list.do?page=${page}"><div class=blackbutton-active>
							<<</div>&nbsp;</a>
				</c:if>
				<c:if test="${pp.currentPage <=1 }">
					<div class=blackbutton-inactive><</div>&nbsp; </c:if>
				<c:if test="${pp.currentPage > 1 }">
					<a href="board_list.do?page=${pp.currentPage - 1}"><div
							class=blackbutton-active><</div>&nbsp;</a>
				</c:if>

				<c:forEach var="a" begin="${pp.startPage}" end="${pp.endPage}">
					<c:if test="${a == pp.currentPage }">
						<div class=blackbutton-selected>${a }</div>
					</c:if>
					<c:if test="${a != pp.currentPage }">
						<a href="board_list.do?page=${a}"><div
								class=blackbutton-active>${a }</div></a>
					</c:if>
				</c:forEach>

				<c:if test="${pp.currentPage >= pp.totalPage }">
					<div class=blackbutton-inactive>></div>&nbsp; </c:if>
				<c:if test="${pp.currentPage < pp.totalPage }">
					<a href="board_list.do?page=${pp.currentPage + 1}"><div
							class=blackbutton-active>></div>&nbsp;</a>
				</c:if>
				<c:if test="${pp.currentPage == pp.totalPage }">
					<div class=blackbutton-inactive>>></div>&nbsp; </c:if>
				<c:if test="${pp.currentPage != pp.totalPage }">
					<a href="board_list.do?page=${pp.totalPage}"><div
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
		<hr width=10% />
		<div align="center" style="margin-top: 20px">
			<input type="button" id="writebutton" name="button" value="글쓰기"
				style="width: 50pt; height: 30pt"
				onClick="location='board_write.do?page=${page}&board_id=${member.member_id}'" /> 
		</div>
	</div>
</body>
</html>
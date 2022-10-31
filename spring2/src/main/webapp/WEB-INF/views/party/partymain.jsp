<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/pm.css" />


</head>
<body>
	sessionid = ${sessionId}<br>
	<!-- 로그인버튼 지우지 말아주세요!!!  -->
	<input type="button" value="로그인 test" class="input_button"
		onclick="location='dlatl.do?page=${page}'" /><br>
	<input type="button" value="파티만들기" class="input_button"
		onclick="location='party_create.do?party_no=${p.party_no}&page=${page}'" />
		<!-- partyroom_wrap -->
	<div id="party-list" align="center"><br>
		<c:forEach var="p" items="${partylist}">
			<button type="button" class = "party-list-button" onclick="location.href='getout.do'">
				<div id="item-type">[${p.party_address}] ${p.party_subject}</div>
				<div id="item-date">${p.party_enddate}</div>
				<div id="item-price">${p.party_count} / ${p.party_max_count}</div>
			</button>	
		</c:forEach>
	</div>
	<div id="parytslist_paging" align="center">

		<c:if test="${page == 1 }"> [처음]&nbsp; </c:if>

		<c:if test="${page != 1 }">
			<a href="partyband.do?page=1">[처음]</a>&nbsp;
		</c:if>

		<c:if test="${page <=1 }"> [이전]&nbsp; </c:if>

		<c:if test="${page > 1 }">
			<a href="partyband.do?page=${page-1}">[이전]</a>&nbsp;
		</c:if>

		<c:forEach var="a" begin="${startpage}" end="${endpage}">
			<c:if test="${a == page }"> [${a}] </c:if>
			<c:if test="${a != page }">
				<a href="partyband.do?page=${a}">[${a}]</a>&nbsp;
			</c:if>
		</c:forEach>

		<c:if test="${page >= maxpage }"> [다음] </c:if>
		<c:if test="${page < maxpage }">
			<a href="partyband.do?page=${page+1}">[다음]</a>
		</c:if>

		<c:if test="${page == maxpage }"> [맨끝]&nbsp; </c:if>

		<c:if test="${page != maxpage }">
			<a href="partyband.do?page=${maxpage}">[맨끝]</a>&nbsp;
		</c:if>
	</div>
</body>
</html>
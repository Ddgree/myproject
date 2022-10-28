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
	href="<%=request.getContextPath()%>/resources/css/partymain.css" />
</head>
<body>
<<<<<<< HEAD
	<input type="button" value="파티만들기" class="input_button"
		onclick="location='party_create.do?party_no=${p.party_no}&page=${page}'" />
	<div id=partyroom_wrap>
		<c:forEach var="p" items="${partylist}">
			<c:out value="${p.party_subject}" />
			<div id=partyslist_paging>
			[${p.party_no }]<br>
				[${p.party_id}] ${p.party_count} <br> ${p.party_enddate}"<br>
				${p.party_count} / ${p.party_max_count} <br>
			</div>
		</c:forEach>
	</div>
	<div id="parytslist_paging">
=======
		<input type="button" value="파티만들기" class="input_button"
			onclick="location='party_create.do?party_no=${p.party_no}&page=${page}'" />

	<br>
	<c:forEach var="p" items="${partylist}">
	<c:out value="${p.party_subject}" />
		<div>
			[${num}] ${p.party_count} <br>
			${p.party_enddate}"<br>
			${p.party_count} / ${p.party_max_count} <br>
		</div>
	</c:forEach>
	
	<div id="parytslist_paging">			
>>>>>>> origin/kyungmin1025
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
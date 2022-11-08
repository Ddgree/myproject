<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>종료된 파티방</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/partymain.css" />
<script src="https://kit.fontawesome.com/f82eca20b8.js"
	crossorigin="anonymous"></script>

</head>
<c:if test="${sessionScope.member.member_id == null }">
	<%@ include file="../member/header.jsp"%>
</c:if>
<c:if test="${sessionScope.member.member_id != null }">
	<%@ include file="../member/header_login.jsp"%>
</c:if>
<body>
<!-- partyroom_wrap -->
	<div id="item" align="center">
	<div class=party-list-wrap>
		<c:forEach var="p" items="${endpartylist}">
				<button type="button" class=push onclick="location.href='party_detail.do?party_no=${p.party_no}&page=${page }'">
				
				<div class=type>[${p.party_address}] ${p.party_subject}</div>
				<div>
					${dday}[종료]
				</div>
				<div>
					<i class="fa-solid fa-crown"></i>
					<c:forEach begin="1" end="${p.party_count}">
						<c:if test="${p.party_count!=0}">
							<i class="fa-solid fa-user"></i>
						</c:if>
					</c:forEach>
					<c:forEach begin="1" end="${p.party_max_count-p.party_count}">
						<c:if test="${p.party_max_count-p.party_count!=0}">
							<i class="fa-regular fa-user"></i>
						</c:if>
					</c:forEach>
					${p.party_count+1} / ${p.party_max_count+1}
				</div>
			</button>
		</c:forEach>
		</div>
	</div>
	
		<hr/>
	<div align="center">

		<c:if test="${page == 1 }"> <div class=blackbutton-inactive> << </div>&nbsp; </c:if>

		<c:if test="${page != 1 }">
			<a href="end_party_list.do?page=1"><div class=blackbutton-active> << </div>&nbsp;</a>
		</c:if>

		<c:if test="${page <=1 }"> <div class=blackbutton-inactive> < </div>&nbsp; </c:if>

		<c:if test="${page > 1 }">
			<a href="end_party_list.do?page=${page-1}"><div class=blackbutton-active> < </div>&nbsp;</a>
		</c:if>

		<c:forEach var="a" begin="${startpage}" end="${endpage}">
			<c:if test="${a == page }"> <div class=blackbutton-selected> ${a } </div> </c:if>
			<c:if test="${a != page }">
				<a href="end_party_list.do?page=${a}"><div class=blackbutton-active> ${a } </div></a>
			</c:if>
		</c:forEach>

		<c:if test="${page >= maxpage }"> <div class=blackbutton-inactive> > </div>&nbsp; </c:if>
		<c:if test="${page < maxpage }">
			<a href="end_party_list.do?page=${page+1}"><div class=blackbutton-active> > </div>&nbsp;</a>
		</c:if>

		<c:if test="${page == maxpage }"> <div class=blackbutton-inactive> >> </div>&nbsp; </c:if>

		<c:if test="${page != maxpage }">
			<a href="end_party_list.do?page=${maxpage}"><div class=blackbutton-active> >> </div>&nbsp;</a>
		</c:if>
	</div>
</body>
<%@ include file="../member/footer.jsp"%>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=1600, initial-scale=1.0, minimum-scale=1.0">
<title>메인 페이지</title>
<script src="https://kit.fontawesome.com/f82eca20b8.js"
	crossorigin="anonymous"></script>
</head>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/partymain.css" />
<body>

<c:if test="${sessionScope.member.member_id == null }">
	<%@ include file="../member/header.jsp"%>
</c:if>
<c:if test="${sessionScope.member.member_id != null}">
	<%@ include file="../member/header_login.jsp"%>
</c:if>
<div class=wrapper>


	<%@ include file="../../../resources/include/address.jsp"%>


<div id="options">
<div id="optionsheader">드래그해서이동</div>
	<input type="button" value="파티만들기" id="option-button"
		onclick="location='party_create.do?page=${page}&party_id=${member.member_id}&end=1'" /><br>
<select name="party_address" onchange="if(this.value) location.href=(this.value);else if(this.value=='') location.href='partyband.do';">
		<c:forEach var="a" items="${add}" begin="0" end="7">
			<option <c:if test ="${a ne '전체'}">value="partyband.do?address=${a}"</c:if><c:if test ="${a eq '전체'}">value=""</c:if><c:if test ="${address eq a}">selected="selected"</c:if>>${a}</option>
		</c:forEach>
	</select>
		</div>
<script src="<%=request.getContextPath()%>/resources/js/moveoptions.js"></script>
	
	<!-- partyroom_wrap -->
	<div id="item" align="center">
	<div class=party-list-wrap>
		<c:forEach var="p" items="${partylist}">
			<jsp:useBean id="today" class="java.util.Date" />
			<fmt:parseNumber value="${today.time / (1000*60*60*24)-1}" integerOnly="true" var="now" scope="request" />
			<!-- Dday -->
			<fmt:parseDate var="enddate" value="${p.party_enddate}" pattern="yyyyMMdd" />
			<fmt:parseNumber var="day" value="${enddate.time / (1000*60*60*24)}" integerOnly="true" />
			<!-- 날짜포멧출력 -->
			<fmt:formatDate var="dday" value="${enddate }" pattern="yyyy년 MM월 dd일" />
			
				<c:if test="${p.party_age lt 20 and member.member_age lt 20 }">
				<button type="button" class=push onclick="location.href='party_detail.do?party_no=${p.party_no}&page=${page }&member_id=${member.member_id}&join=${join}'">
				</c:if>
				<c:if test="${p.party_age ge 20 and member.member_age lt 20 }">
					<c:if test="!${member.member_id eq 'admin' }">
					<button type="button" class=push-child onClick="location='warn.do'">
					</c:if>
					<c:if test="${member.member_id eq 'admin' }">
					<button type="button" class=push onclick="location.href='party_detail.do?party_no=${p.party_no}&page=${page}&member_id=${member.member_id}'">
					</c:if>
				</c:if>

				<c:if test="${member.member_id eq null or member.member_age ge 20 }">
				<button type="button" class=push onclick="location.href='party_detail.do?party_no=${p.party_no}&page=${page}&member_id=${member.member_id}'">
				</c:if>
				<c:if test="${p.party_age ge 20}">
				<div class=type>[${p.party_address}] ${p.party_subject}</div>
				</c:if>
				<c:if test="${p.party_age lt 20}">
				<div class=type>[${p.party_address}<i class="fa-regular fa-face-smile"></i>] ${p.party_subject}</div>
				</c:if>
				
				<div>
					<c:if test="${now==day}">
						<td>${dday}[D-day]</td>
					</c:if>
					<c:if test="${now>day }">
						<td>${dday}[종료]</td>
					</c:if>
					<c:if test="${now<day }">
						<td>${dday}[D${now-day }]</td>
					</c:if>
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
		
		<hr/>
	<div align="center">
	<c:if test="${address eq null }">
		<c:if test="${page == 1 }"> <div class=blackbutton-inactive> << </div> </c:if>
		<c:if test="${page != 1 }">
			<a href="partyband.do?page=1"><div class=blackbutton-active> << </div></a>
		</c:if>
		<c:if test="${page <=1 }"> <div class=blackbutton-inactive> < </div> </c:if>
		<c:if test="${page > 1 }">
			<a href="partyband.do?page=${page-1}"><div class=blackbutton-active> < </div></a>
		</c:if>
		<c:forEach var="a" begin="${startpage}" end="${endpage}">
			<c:if test="${a == page }"> <div class=blackbutton-selected> ${a } </div> </c:if>
			<c:if test="${a != page }">
				<a href="partyband.do?page=${a}"><div class=blackbutton-active> ${a } </div></a>
			</c:if>
		</c:forEach>
		<c:if test="${page >= maxpage }"> <div class=blackbutton-inactive> > </div> </c:if>
		<c:if test="${page < maxpage }">
			<a href="partyband.do?page=${page+1}"><div class=blackbutton-active> > </div></a>
		</c:if>
		<c:if test="${page == maxpage }"> <div class=blackbutton-inactive> >> </div> </c:if>
		<c:if test="${page != maxpage }">
			<a href="partyband.do?page=${maxpage}"><div class=blackbutton-active> >> </div></a>
		</c:if>
		</c:if>
	<c:if test="${address ne null }">
		<c:if test="${page == 1 }"> <div class=blackbutton-inactive> << </div> </c:if>
		<c:if test="${page != 1 }">
			<a href="partyband.do?page=1&address=${address }"><div class=blackbutton-active> << </div></a>
		</c:if>
		<c:if test="${page <=1 }"> <div class=blackbutton-inactive> < </div> </c:if>
		<c:if test="${page > 1 }">
			<a href="partyband.do?page=${page-1}&address=${address }"><div class=blackbutton-active> < </div></a>
		</c:if>
		<c:forEach var="a" begin="${startpage}" end="${endpage}">
			<c:if test="${a == page }"> <div class=blackbutton-selected> ${a } </div> </c:if>
			<c:if test="${a != page }">
				<a href="partyband.do?page=${a}&address=${address }"><div class=blackbutton-active> ${a } </div></a>
			</c:if>
		</c:forEach>
		<c:if test="${page >= maxpage }"> <div class=blackbutton-inactive> > </div> </c:if>
		<c:if test="${page < maxpage }">
			<a href="partyband.do?page=${page+1}&address=${address }"><div class=blackbutton-active> > </div></a>
		</c:if>
		<c:if test="${page == maxpage }"> <div class=blackbutton-inactive> >> </div> </c:if>
		<c:if test="${page != maxpage }">
			<a href="partyband.do?page=${maxpage}&address=${address }"><div class=blackbutton-active> >> </div></a>
		</c:if>
		</c:if>
	</div>
		</div>
	</div>
	</div>
</body>
	<%@ include file="../member/footer.jsp"%>
</html>
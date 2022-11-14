<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:if test="${result==1}">
	<script>
		alert("비밀번호가 일치하지 않습니다.");
		history.go(-1);
	</script>
</c:if>
<c:if test="${result==2}">
	<script>
		alert("게시물 삭제가 완료되었습니다.");
		opener.location.href="board_list.do"
		window.close();
	</script>
</c:if>
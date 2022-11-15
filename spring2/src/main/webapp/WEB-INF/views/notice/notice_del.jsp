<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>게시물 삭제</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/boardnotice.css" />
	<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/NoticeButton.css" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	function del_check() {
		if ($.trim($("#pwd").val()) == "") {
			alert("삭제 비번을 입력하세요!");
			$("#pwd").val("").focus();
			return false;
		}
	}
</script>
</head>
<body>
<div class="wrapper">
	<div id="noticedel_wrap">
		<form method="post" action="notice_del_ok.do" 
			onsubmit="return del_check()">
			<input type="hidden" name="member_id" value="${member.member_id}"/>
			<input type="hidden" name="notice_no" value="${ncont.notice_no}" />
			<input type="hidden" name="pageNum" value="${pageNum}" />
			<table id="noticedel_t" style="margin-top:50px;">
				<tr>
					<th class="delete">삭제 비밀번호</th>
					<td class="td_delete">
					<input type="password" name="pwd" id="pwd"
						class="input_box_delete" /></td>
				</tr>
			</table>
			<div id="del_menu" align="center" style="margin-top:70px;">
				<input type="submit" value="삭제" class="button" /> 
				<input type="button" value="취소" class="button"
					onclick="window.close()" />
			</div>
		</form>
	</div>
	</div>
</body>
</html>

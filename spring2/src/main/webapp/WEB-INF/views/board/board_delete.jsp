<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!doctype html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>게시물 삭제</title>
	<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/boardnotice.css" />
<script src="https://kit.fontawesome.com/f82eca20b8.js"
	crossorigin="anonymous"></script>
	<script src="<%=request.getContextPath() %>/resources/js/board.js"></script>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	
	<script>
 	 function delete_check(){
		  if($.trim($("#board_passwd").val())==""){
			  alert("삭제 비밀번호을 입력하세요!");
			  $("#board_passwd").val("").focus();
			  return false;
	 	 }
  	}
	</script>
	<%@ include file="../member/header_login.jsp"%>
</head>
<body>
<div class="wrapper">
 <div id="boarddel_wrap">
  <h2 class="boarddel_title">게시물 삭제</h2>
  <form method="post" action="board_delete_ok.do" 
  onsubmit="return delete_check()">
  <input type="hidden" name="member_id" value="${member.member_id}" />
  <input type="hidden" name="board_no" value="${read.board_no}" />
  <input type="hidden" name="page" value="${page}" />
   <table id="board_delete_table" style="margin-top:50px;">
    <tr>
     <th>삭제 비밀번호&nbsp;&nbsp;</th>
     <td>
      <input type="password" name="board_passwd" id="board_passwd" size="20" style="width:200px; height:30px"
      class="input_box" />
     </td>
    </tr>
   </table>
   <div id="boarddel_menu" align="center">
    <input type="submit" value="삭제" class="input_button" />
    <input type="button" value="취소" class="input_button" 
    onclick="window.close()" />
   </div>
  </form>
 </div>
 </div>
</body>
<%@ include file="../member/footer.jsp" %>
</html>

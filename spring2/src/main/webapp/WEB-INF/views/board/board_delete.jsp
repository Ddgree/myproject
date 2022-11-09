<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!doctype html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>게시물 삭제</title>
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
</head>
<body>
 <div id="boarddel_wrap">
  <h2 class="boarddel_title">게시물 삭제</h2>
  <form method="post" action="board_delete_ok.do" 
  onsubmit="return delete_check()">
  <input type="hidden" name="member_id" value="${member.member_id}" />
  <input type="hidden" name="board_no" value="${read.board_no}" />
  <input type="hidden" name="page" value="${page}" />
   <table id="board_delete_table">
    <tr>
     <th>삭제 비밀번호</th>
     <td>
      <input type="password" name="board_passwd" id="board_passwd" size="14" 
      class="input_box" />
     </td>
    </tr>
   </table>
   <div id="boarddel_menu">
    <input type="submit" value="삭제" class="input_button" />
    <input type="button" value="취소" class="input_button" 
    onclick="history.go(-1)" />
   </div>
  </form>
 </div>
</body>
</html>

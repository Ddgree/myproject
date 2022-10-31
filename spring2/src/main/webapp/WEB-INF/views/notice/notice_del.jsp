<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!doctype html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>게시물 삭제</title>
	<link rel="stylesheet" type="text/css" href="./css/board.css" />
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	
	<script>
 	 function del_check(){
		  if($.trim($("#pwd").val())==""){
			  alert("삭제 비번을 입력하세요!");
			  $("#pwd").val("").focus();
			  return false;
	 	 }
  	}
	</script>
</head>

<body>
 <div id="noticedel_wrap">
  <h2 class="noticedel_title">게시물 삭제</h2>
  <form method="post" action="notice_del_ok.do" 
  onsubmit="return del_check()">
  <input type="hidden" name="notice_no" value="${ncont.notice_no}" />
  <input type="hidden" name="page" value="${page}" />
   <table id="noticedel_t">
    <tr>
     <th>삭제 비밀번호</th>
     <td>
      <input type="password" name="pwd" id="pwd" size="14" 
      class="input_box" />
     </td>
    </tr>
   </table>
   <div id="noticedel_menu">
    <input type="submit" value="삭제" class="input_button"/>
    <input type="button" value="취소" class="input_button" 
    onclick="location='notice_list.do?page=${page}'" />
   </div>
  </form>
 </div>
</body>
</html>

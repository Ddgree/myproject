<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
    
<!doctype html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>글 작성</title>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/board.js"></script>
</head>

<body>

 <div id="board_write_title" align="center">
  <h2 class="board_write_title">글 작성</h2>
  <form method="post" action="board_write_ok.do" onSubmit="return board_check()" enctype="multipart/form-data">
   <input type="hidden" name="board_id" value="${board.board_id}">
   <table id="board_write_table" border=1>
    <tr>
     <th>구분</th>
     <td>
     <input type="radio" name="board_division" id="board_division_normal" value="일반" checked="checked"/>일반 
     <input type="radio" name="board_division" id="board_division_review" value="후기" />후기 
     </td>
    </tr>
    <tr>
     <th>작성자</th>
     <td>
		${board.board_id}
     </td>
    </tr>
    
    <tr>
     <th>비밀번호</th>
     <td>
      <input type="password" name="board_passwd" id="board_passwd" size="14"
      class="input_box" />
     </td>
    </tr>
    
    <tr>
     <th>글제목</th>
     <td>
      <input name="board_subject" id="board_subject" size="40" 
      class="input_box" />
     </td>
    </tr>
    
    <tr>
     <th>글내용</th>
     <td>
      <textarea name="board_content"  id="board_content" rows="8" cols="50" 
      class="input_box"></textarea>
     </td>
    </tr>
     
    <tr>
     <th>첨부파일</th>
     <td>
      <input type=file name="board_file1" />
     </td>
    </tr> 
   </table>
   <div id="board_write_menu" style='margin-top: 20px;'>
    <input type="submit" value="등록" class="input_button" />
    <input type="button" value="취소" class="input_button"
    onclick="history.go(-1)" />
   </div>
  </form>
 </div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    

<!doctype html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>공지사항 수정폼</title>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="<%=request.getContextPath() %> /js/notice.js"></script>
</head>

<body>
 <div id="noticewrite_wrap">
  <h2 class="noticewrite_title">공지사항 수정폼</h2>
  <form method="post" action="notice_edit_ok.do" onSubmit="return notice_check()">
  <input type="hidden" name="notice_no" value="${ncont.notice_no}" />
  <input type="hidden" name="page" value="${page}" />
  
   <table id="noticewrite_t">
    <tr>
     <th>글쓴이</th>
     <td>
     <input name="notice_admin_id" id="notice_admin_id" size="14" class="input_box" 
     value="관리자" readonly />
     </td>
    </tr>
    
    <tr>
     <th>글제목</th>
     <td>
      <input name="notice_subject" id="notice_subject" size="40" 
      class="input_box" value="${ncont.notice_subject}" />
     </td>
    </tr>
    
    <tr>
     <th>글내용</th>
     <td>
      <textarea name="notice_content" id="notice_content" rows="8" cols="50"
      class="input_box">${ncont.notice_content}</textarea>
     </td>
    </tr> 
    
   </table>
   
   <div id="noticewrite_menu">
    <input type="submit" value="수정" class="input_button" />
    <input type="button" value="취소" class="input_button"
    onclick="location='notice_list.do?page=${page}'" />
   </div>
  </form>
 </div>
</body>
</html>
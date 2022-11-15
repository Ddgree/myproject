<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/find.css" />
<script src="./js/jquery.js"></script>
</head>
<body>
 <div id="del_wrap">
  <h2 class="pwd_title">회원탈퇴</h2>
  <form method="post" action="member_del_ok.do" onsubmit="return delcheck()">
  <input type="hidden" name=joinlist value=${joinlist}>
  	<input type="hidden" name=member_id value=${member.member_id}>
    <table style="border-spacing: 20px 15px;">
     <tr>
      <th>회원아이디</th>
      <td>
      ${delete_id}
      </td>
     </tr>
     
     <tr>
      <th>회원이름</th>
      <td>${delete_name}</td>
     </tr>
     
     <tr>
      <th>비밀번호</th>
      <td>
      <input type="password" name="delete_passwd" id="delete_passwd" size="14" 
      			class="input_box" />
      </td>
     </tr>
     
    </table>
    <div id="del_menu">
     <input type="submit" value="탈퇴" class="button" style="margin-left:50px;"/>
     <input type="reset" value="취소" class="button"
     	onclick="window.close()" />
    </div>
  </form>
 </div>
</body>
</html>
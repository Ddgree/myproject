<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비번확인</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/find.css" />
</head>
<body>

<form name="f" method="post" action="edit_pwcheck_ok.do">
<input type="hidden" name="member_id" value="${sessionScop.member.member_id}">
<table style="border-spacing: 0 15px;">
	 <tr>
	 	<th colspan=2>비밀번호 인증 완료 후 수정할 수 있습니다.</th>
	 </tr>
	 <tr>
     <th>비번확인</th>
     <td>
      <input type="password" name="editpw" id="editpw" size="14"
      class="input_box" />
     </td>
    </tr>
    
</table>

   <div id="edit_menu">
    <input type="submit" value="확인" class="button"/>
    <input type="button" value="취소" class="button"
    	onclick="window.close()" />
   </div>
</form>

</body>
</html>
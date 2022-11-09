<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비번확인</title>
<<<<<<< HEAD
=======
<script>
/* function check() {
	var editpw = document.getElementById("editpw").value;
	if(editpw=="" || editpw.length==0){
		alert("비밀번호를 입력해주세요");
		return false;
	}
	return true;
} */
</script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/find.css" />
>>>>>>> origin/sun
</head>
<body>
<form method="post" action="edit_pwcheck_ok.do" onsubmit="check()">
<input type="hidden" name="member_id" value="${sessionScop.member.member_id}">
<table>

	 <tr>
     <th>비번확인</th>
     <td>
      <input type="password" name="editpw" id="editpw" size="14"
      class="input_box" />
     </td>
    </tr>
    
</table>

   <div id="edit_menu">
    <input type="submit" value="확인" class="input_button"/>
    <input type="button" value="취소" class="input_button"
    	onclick="window.close()" />
   </div>
</form>

</body>
</html>
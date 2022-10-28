<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비번확인</title>
</head>
<body>

<form name="f" method="post" action="edit_pwcheck_ok.do">
<input type="hidden" name="member_id" value="${id}">
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
    <input type="submit" value="확인" class="input_button" />
    <input type="button" value="취소" class="input_button"
    	onclick="location='main'" />
   </div>
</form>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>

<script>
function check(){
	 if($.trim($("#member_name").val())==""){
		 alert("아이디를 찾고자 하는 이름을 입력해 주세요.");
		 $("#member_name").val("").focus();
		 return false;
	 }
	 if($.trim($("#member_email").val())==""){
		 alert("회원정보에 등록한 이메일을 입력하세요.");
		 $("#member_email").val("").focus();
		 return false;
	 }
}
</script>
<script type="text/javascript">
function parentMove() {
	 opener.location.href = "member_login.do";  //팝업창을 띄운.. 즉 팝업창을 호출한 페이지를 이동한다.
	 window.close();  //팝업창 종료
}
  </script>
<script src="./././js/jquery.js"></script>
</head>
<body>
<div id="pwd_wrap">
 
 <c:if test="${empty idok}"> 
  <h2 class="pwd_title">등록된 회원정보로 아이디 찾기</h2>
  <form method="post" action="id_find_ok.do" onsubmit="return check()">  
   <table id="pwd_t" border="1">

    <tr>
     <th>이름</th>
     <td><input name="member_name" id="member_name" size="14" class="input_box" /></td>
    </tr>
    
     <tr>
     <th>Email</th>
     <td><input name="member_email" id="member_email" size="14" class="input_box" /></td>
    </tr>
    
   </table>
   
   <div id="pwd_menu"><br>
    <input type="submit" value="아이디 찾기" class="input_button" />
    <input type="reset" value="취소" class="input_button" onclick="window.close()" />
   </div>
  </form>
  </c:if>
  
  
  <c:if test="${!empty idok}">
    <h2 class="pwd_title2">아이디 찾기 결과</h2>
    <table id="pwd_t2" >
     <tr>
      <td><b>PARTY BAND의 회원이시군요!</b></td>
      </tr>
      <tr>
      <td>${idok}</td>
     </tr>
    </table>
    <div id="pwd_close2">
    <br>
    <input type="button" value="확인" class="input_button" onclick="parentMove()" />
    </div>
  </c:if> 
  
 </div>
</body>
</html>
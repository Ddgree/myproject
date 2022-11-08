<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap');
h2{
	font-family: 'Gowun Dodum', sans-serif;
}
ul{
	font-family: 'Gowun Dodum', sans-serif;
}
li{
	font-family: 'Gowun Dodum', sans-serif;
}
input{
	font-family: 'Gowun Dodum', sans-serif;
}
</style>
<script>
function check(){
	var member_id=document.getElementById("member_id").value;
	var member_name = document.getElementById("member_name").value;
	if(member_id=="" || member_id.length==0){
		alert("아이디를 입력해주세요");
		return false;
	}
	if(member_name=="" || member_name.length==0){
		alert("이름을 입력해주세요");
		return false;
	}
	return true;
}
</script>
<script type="text/javascript">
function parentMove() {
	 opener.location.href = "member_login.do";  //팝업창을 띄운.. 즉 팝업창을 호출한 페이지를 이동한다.
	 window.close();  //팝업창 종료
}
  </script>
<script src="./././js/jquery.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/find.css" />
</head>
<body>
<div id="pwd_wrap">
 
 <c:if test="${empty pwdok}"> 
  <h2 class="pwd_title" style="background: #9a6c5c;">비밀번호 찾기</h2>
  <form method="post" action="PwdFindok.do" onsubmit="return check()">  
  
  
  <ul style="margin-top:50px;">
		<li>
			<span>
				<label for="name">아이디</label>
			</span>
			<div>
				<input name="member_id" id="member_id" class="input_box" />
			</div>
		</li>
	</ul>	
	<ul>
		<li>
			<span>
				<label for="name">이름</label>
			</span>
			<div>
				<input name="member_name" id="member_name"class="input_box" />
			</div>
		</li>
	</ul>	
	
   <div id="pwd_menu"><br>
    <input type="submit" value="비밀번호 찾기" class="button" style="margin-left: 100px;"/>
    <input type="reset" value="취소" class="button" onclick="window.close()" />
   </div>
  </form>
  </c:if>
  
  
  <c:if test="${!empty pwdok}">
    <h2 class="pwd_title2">비밀번호 찾기 결과</h2>
    <table id="pwd_t2" >
     <tr>
      <td><b>PARTY BAND의 회원이시군요!</b></td>
      </tr>
      <tr>
      <td>${pwdok}</td>
     </tr>
    </table>
    <div id="pwd_close2">
    <br>
    <input type="button" value="확인" class="button" onclick="parentMove()" />
    </div>
  </c:if> 
  
 </div>
</body>
</html>
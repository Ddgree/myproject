<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입폼</title>
<link rel="stylesheet" type="text/css" href="./css/admin.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/member.css" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/member.js"></script>
<c:if test="${sessionScope.id == null }">
<%@ include file="../member/header.jsp" %>
</c:if>
<c:if test="${sessionScope.id != null }">
<%@ include file="../member/header_login.jsp" %>
</c:if>
</head>
<body>
 <div id="join_wrap">
  <h2 class="join_title">회원가입</h2>
  <form name="f" method="post" action="member_join_ok.do"
  		onsubmit="return check()" enctype="multipart/form-data">
   <!-- 이진파일을 업로드 할려면 enctype 속성을 지정 -->
   <table id="join_t">
    <tr>
    <th>회원아이디</th>
     <td>
      <input name="member_id" id="member_id" size="14" class="input_box" />
      <input type="button" value="아이디 중복체크" class="input_button"
      	onclick="id_check()" />
      <div id="idcheck"></div>
     </td>
    </tr>
    
    <tr>
     <th>회원비번</th>
     <td>
      <input type="password" name="member_passwd" id="member_passwd1" size="14"
      class="input_box" />
     </td>
    </tr>
    
    <tr>
     <th>회원비번확인</th>
     <td>
      <input type="password" name="member_passwd2" id="member_passwd2" size="14"
      class="input_box" />
     </td>
    </tr>
    
    <tr>
     <th>회원이름</th>
     <td>
      <input name="member_name" id="member_name" size="14" class="input_box" />
     </td>
    </tr>
    
    <tr>
     <th>회원닉네임</th>
     <td>
      <input name="member_nickname" id="member_nickname" size="14" class="input_box" />
      <input type="button" value="닉네임 중복체크" class="input_button"
      	onclick="nick_check()" />
      <div id="nickcheck"></div>
     </td>
    </tr>

	<tr>
		<th>성별</th>
		<td>
			<input type=radio id="male" name="member_gender" value="남자">남자
			<input type=radio id="female" name="member_gender" value="여자">여자
		</td>
	</tr>

    <tr>
     <th>휴대전화번호</th>
     <td>
	<input name="member_phone" id="member_phone" size="15"
     maxlength="11" class="input_box" placeholder="-없이 입력하세요" />
     </td>
    </tr>
    	
	<tr>
		<th>나이</th>
		<td>
			<input type=radio id="adult" name="member_age" value="20">20세 이상
			<input type=radio id="student" name="member_age" value="19">19세 이하
		</td>
	</tr>
    
    
    <tr>
     <th>E메일</th>
     <td>
      <input name="member_mailid" id="member_mailid" size="10" 
      class="input_box" />@<input name="member_maildomain" 
      id="member_maildomain" size="20" class="input_box" readonly />
      
      <select name="mail_list" onchange="domain_list()">
      <option value="">=이메일선택=</option>
      <option value="daum.net">daum.net</option>
      <option value="nate.com">nate.com</option>
      <option value="naver.com">naver.com</option>
      <option value="hotmail.com">hotmail.com</option>
      <option value="gmail.com">gmail.com</option>
      <option value="0">직접입력</option>
     </select> 
     </td>
    </tr>
    
    <tr>
     <th>지역</th>
     <td>
     <%@ include file="../../../resources/include/address_sample.jsp" %>
     <select id="member_address" name="member_address">
      <c:forEach var="p" items="${address}" begin="0" end="5">
       <option value="${p}">${p}</option>
      </c:forEach>
     </select>
     </td>
   </tr>
    
    <tr>
     <th>프로필사진</th>
     <td>
      <input type="file" name="file1" />
     </td>
    </tr>
   </table>
   
   <div id="join_menu">
    <input type="submit" value="회원가입" class="input_button" />
    <input type="reset" value="가입취소" class="input_button" 
    onclick="$('#member_id').focus();" />
   </div>
  </form>
 </div>
</body>
<%@ include file="footer.jsp" %>
</html>

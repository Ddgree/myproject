<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정폼</title>
<link rel="stylesheet" type="text/css" href="./css/admin.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/member.css" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="<%=request.getContextPath()%>/js/member.js"></script>
</head>
<body>
 <div id="join_wrap">
  <h2 class="join_title">회원정보 수정</h2>
  <form name="f" method="post" action="member_edit_ok.do"
  		onsubmit="return edit_check()" enctype="multipart/form-data">
   <!-- 이진파일을 업로드 할려면 enctype 속성을 지정 -->
   <table id="join_t">
    <tr>
    <th>회원아이디</th>
     <td>
      ${upmem.member_id}
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
      <input name="member_name" id="member_name" size="14" class="input_box"
      value="${upmem.member_name}" />
     </td>
    </tr>
    
    <tr>
     <th>회원닉네임</th>
     <td>
     ${upmem.member_nickname}
     </td>
    </tr>

	<tr>
		<th>성별</th>
		<td>
		${upmem.member_gender}
		</td>
	</tr>
    
    <tr>
     <th>휴대전화번호</th>
     <td>
	<input name="member_phone" id="member_phone" size="15"
     maxlength="11" class="input_box" placeholder="-없이 입력하세요" 
     value="${upmem.member_phone}"/>
     </td>
    </tr>
    	
	<tr>
		<th>나이</th>
		<td>
			<input type=radio id="adult" name="member_age" value="20"
			<c:if test ="${upmem.member_age == '20'}">checked="checked"</c:if>/>20세 이상
			<input type=radio id="student" name="member_age" value="19"
			<c:if test ="${upmem.member_age == '19'}">checked="checked"</c:if>/>19세 이하
		</td>
	</tr>
    
    
    <tr>
     <th>E메일</th>
     <td>
      <input name="member_mailid" id="member_mailid" size="10" 
      class="input_box" value="${member_mailid}"/>@<input name="member_maildomain" 
      id="member_maildomain" size="20" class="input_box" readonly
      value="${member_maildomain}" />
      
      <select name="mail_list" onchange="domain_list()">
      <option value="">=이메일선택=</option>
      <option value="daum.net"
      		<c:if test="${member_maildomain == 'daum.net'}">${'selected'}
            </c:if>>daum.net</option>
      <option value="nate.com"
      		<c:if test="${member_maildomain == 'nate.com'}">${'selected'}
            </c:if>>nate.com</option>
      <option value="naver.com"
      		<c:if test="${member_maildomain == 'naver.com'}">${'selected'}
            </c:if>>naver.com</option>
      <option value="hotmail.com"
      		<c:if test="${member_maildomain == 'hotmail.com'}">${'selected'}
            </c:if>>hotmail.com</option>
      <option value="gmail.com"
    		<c:if test="${member_maildomain == 'gmail.com'}">${'selected'}
            </c:if>>gmail.com</option>
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
       <option value="${p}"
       <c:if test ="${upmem.member_address == p}">${'selected' }</c:if>
       >${p}</option>
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
    <input type="submit" value="회원수정" class="input_button" />
    <input type="button" value="취소" class="input_button"
    	onclick="location='member_mypage.do'" />
   </div>
  </form>
 </div>
</body>
</html>

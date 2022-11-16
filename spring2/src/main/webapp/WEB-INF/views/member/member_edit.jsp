<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
<style>
.join {
	margin-left: auto;
	margin-right: auto;
	border-spacing: 0 15px;
}

.button {
	background-color: #FFECE5;
	color: #443029;
	text-align: center;
	border:solid 3px #443029;
	font-size: 20px;
	border-radius:15px;
	border:solid 3px #443029;
	width: 150px;
	height: 50px;
	transition: background 0.5s ease-in-out, color 0.5s ease-in-out;
}

.button:hover {
	background: #61443a;
	color: white;
	border: 0;
}

.button_1 {
	background-color: #61443a;
	color: white;
	border: 0;
	padding: 5px 5px;
	border-radius: 10px;
}

.dflex {
	display: flex;
	gap: 10px;
}

.radio-wrap input[type="radio"] {
	display: none;
}

.radio-wrap {
	width: 100px;
	height: 30px;
	border: 2px solid #eaeaea;
	border-radius: 5px;
}

.radio-wrap label {
	display: block;
	margin: 0 auto;
	height: -webkit-fill-available;
	line-height: 30px;
	border-radius: 5px;
	text-align: center;
	cursor: pointer;
}

.radio-wrap input[type="radio"]:checked+label {
	background: #61443a;
	color: white;
	font-weight: 500;
}
.pl{
    border: 2px solid #61443a;
    box-sizing: border-box;
    border-radius: 10px;
    padding: 5px 5px;
    font-family: 'Roboto';
    font-style: normal;
    font-weight: 400;
    font-size: 14px;
    line-height: 16px;
}

.pl:focus{
    border: 2px solid #61443a;
    box-sizing: border-box;
    border-radius: 10px;
    outline: 3px solid #F8E4FF;
    border-radius: 10px;
}
.input_box{
	padding: 3px;
	border-radius: 3px;
}
input[type=file]::file-selector-button {
 	 width: 100px;
 	 height: 30px;
 	 background: #fff;
 	 background-color: #61443a;
   	color: white;
   	border: 0;
  	border-radius: 10px;
  	cursor: pointer;
  &:hover {
    background: rgb(77,77,77);
    color: #fff;
  }
}
</style>
<meta charset="UTF-8">
<title>회원정보 수정폼</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="<%=request.getContextPath()%>/js/member.js"></script>
</head>
<%@ include file="../member/header_login.jsp" %>
<body>
<div class="wrapper">
 <div id="join_wrap">
  <h2 class="join_title">회원정보 수정</h2>
  <form name="f" method="post" action="member_edit_ok.do"
  		onsubmit="return edit_check()" enctype="multipart/form-data">
   <!-- 이진파일을 업로드 할려면 enctype 속성을 지정 -->
   <table class="join">
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
	 ${upmem.member_name}
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
			<div class="dflex">
				<div class="radio-wrap">
					<input type=radio id="adult" name="member_age" value="20" 
					<c:if test ="${upmem.member_age == '20'}">checked="checked"</c:if>/>
					<label for="adult" >20세이상 </label>
				</div>
				<div class="radio-wrap">
					<input type=radio id="student" name="member_age" value="19" 
					<c:if test ="${upmem.member_age == '19'}">checked="checked"</c:if>/>
					<label for="student">19세이하 </label>
				</div>
			</div>
		</td>
	</tr>
    
    
    <tr>
     <th>E메일</th>
     <td>
      <input name="member_mailid" id="member_mailid" size="10" 
      class="input_box" value="${member_mailid}"/>@<input name="member_maildomain" 
      id="member_maildomain" size="20" class="input_box" readonly
      value="${member_maildomain}" />
      
      <select name="mail_list" onchange="domain_list()" class="pl"  style="width: 130px;">
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
     <select id="member_address" name="member_address" class="pl" style="width: 80px;">
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
   <div id="join_menu" style="text-align: center;">
    <input type="submit" value="회원수정" class="button" />
    <input type="button" value="취소" class="button"
    	onclick="location='member_mypage.do'" />
   </div>
  </form>
 </div>
 </div>
</body>
<%@ include file="../member/footer.jsp" %>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<style>
.join {
	margin-left: auto;
	margin-right: auto;
	border-spacing: 0 15px;
}
</style>


<head>
<meta charset="UTF-8">	
<title>회원정보 마이페이지</title>
<c:if test="${sessionScope.member.member_id == null }">
<%@ include file="../member/header.jsp" %>
</c:if>
<c:if test="${sessionScope.member.member_id != null }">
<%@ include file="../member/header_login.jsp" %>
</c:if>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="<%=request.getContextPath()%>/js/member.js"></script>
</head>
<body>

 <div id="mem_mypage">
  <form name="f" method="post" action="member_logout.do" 
   enctype="multipart/form-data">
   <table class="join">
   <br><br><br><br><br>
    <tr>
    <td>회원아이디</td>
     	<td>
     	 ${mymem.member_id}
     	</td>
    </tr>
    
    <tr>
     <th>회원이름</th>
     	<td>
      	${mymem.member_name}
     	</td>
    </tr>
    
    <tr>
     <th>회원닉네임</th>
     <td>
     ${mymem.member_nickname}
     </td>
    </tr>

	<tr>
	<th>성별</th>
		<td>
		 ${mymem.member_gender}
	</td>
	</tr>
    
    <tr>
     <th>휴대전화번호</th>
     	<td>
	 	 ${mymem.member_phone}
     	</td>
    </tr>
    
    <tr>
     <th>E메일</th>
     	<td>
     	 ${mymem.member_email}
     	</td>
    </tr>
    
    <tr>
     <th>지역</th>
    	 <td>
     	 ${mymem.member_address}
    	 </td>
   </tr>
    
    <tr>
     <th>프로필사진</th>
     <td>
       <c:if test="${empty mymem.member_file}">
      	 &nbsp; 사진이 없어요!
       </c:if>
       <c:if test="${!empty mymem.member_file}">
       	<img src="<%=request.getContextPath() %>/upload/${mymem.member_file}" height="100" width="100" />
       </c:if>
     </td>
    </tr>
   </table>
   
   <div id="mymem_menu">
   <input type="button" value="정보수정" class="input_button"
    		onclick="location='edit_pwcheck.do'" />
   <input type="button" value="회원탈퇴" class="input_button"
     		onclick="location='member_del.do'" />	
   <input type="submit" value="로그아웃" class="input_button" /> 	
   </div>
  </form>
 </div>
</body>
<%@ include file="../member/footer.jsp" %>
</html>

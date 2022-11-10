<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">	
<title>회원정보 마이페이지</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/mypage.css" />
<c:if test="${sessionScope.member.member_id == null }">
<%@ include file="../member/header.jsp" %>
</c:if>
<c:if test="${sessionScope.member.member_id != null }">
<%@ include file="../member/header_login.jsp" %>
</c:if>
<script>
function edit_pwcheck() {
	window.open("edit_pwcheck.do", "비번인증", "width=600,height=400");
}

function member_delete() {
	window.open("member_del.do", "회원탈퇴", "width=450,height=350");
}
</script>
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
    <th>회원아이디</th>
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
   <input type="button" value="정보수정" class="button" style="margin-left: 690px;"
    		onclick="edit_pwcheck()" />
   <input type="button" value="회원탈퇴" class="button"
     		onclick="member_delete()" />	
   <input type="button" value="참여 파티방" class="button"
     		onclick="location='member_party.do?member_id=${member.member_id}'" />	  		
     				
   </div>
  </form>
 </div> 
</body>
<%@ include file="../member/footer.jsp" %>
</html>

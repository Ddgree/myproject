<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script>
alert("비밀번호 인증이 완료되었습니다!");
opener.location.href = "member_edit.do";  //팝업창을 띄운.. 즉 팝업창을 호출한 페이지를 이동한다.
window.close();  //팝업창 종료
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/f82eca20b8.js"
	crossorigin="anonymous"></script>
<style>
.edit1, .del1{
float:right;
margin:0px 0px 0px 10px;
}
</style>
<script type="text/javascript">
$(function() {
		$('.edit1').click(function() {
			var id  = $(this).attr('id');  // rno
			var txt = $('#td_'+id).text(); // replytext
			$('#td_'+id).html("<textarea rows='2' cols='50' id='tt_"+id+"'>"+txt
				+"</textarea>");
			$('#btn_'+id).html(
			   "<input type='button' value='확인' onclick='up("+id+")'> "
			  +"<input type='button' value='취소' onclick='lst()'>");
		});
	});
	 function up(id) {
		var replytext = $('#tt_'+id).val();
		var formData = "reboard_rno="+id+'&reboard_content='+replytext
			+"&reboard_bno=${board.board_no}";
		$.post('repUpdate.do',formData, function(data) {
			$('#reboard_list').html(data);
		});
	}
	function lst() {
		$('#reboard_list').load('reboard_list.do?board_no=${board.board_no}');
	}
	function del(reboard_rno,reboard_bno) {
		var formData="reboard_rno="+reboard_rno+"&reboard_bno="+reboard_bno;
		$.post("repDelete.do",formData, function(data) {
			$('#reboard_list').html(data);
		});
//		location.reload();
	}
</script>
</head>
<body>
<div align="center">
<hr style="width: 20%;"/>
		<c:forEach items="${rlist}" var="rlist">
						<div style="width:20%; text-align:left;">
						<i class="fa-regular fa-face-smile"></i>&nbsp;${rlist.reboard_id}
						&nbsp;&nbsp;/&nbsp;&nbsp;
						<fmt:formatDate value="${rlist.reboard_date}" pattern="yyyy-MM-dd a hh:mm" />
						<c:if test="${member.member_id == rlist.reboard_id || member.member_id == 'admin'}">
						<button type="button" class="del1" onclick="del(${rlist.reboard_rno},${rlist.reboard_bno})">
							<i class="fa-regular fa-trash-can fa-lg"></i></button>
						<button type="button" class="edit1" id="${rlist.reboard_rno}">
							<i class="fa-solid fa-check fa-lg"></i></button>
						</c:if>
						</div>
						<br> 
						<div style="width:20%; text-align:left;" id="td_${rlist.reboard_rno}">&nbsp;&nbsp;${rlist.reboard_content}</div>
						<div id="btn_${rlist.reboard_rno}"></div>
			<hr	style="color: #FFD9CC; border: 3px; border-style: dotted; width: 20%; margin: 20px auto;">

		</c:forEach>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$('.edit1').click(function() {
			var id  = $(this).attr('id');  // rno
			var txt = $('#td_'+id).text(); // replytext
			$('#td_'+id).html("<textarea rows='3' cols='30' id='tt_"+id+"'>"+txt
				+"</textarea>");
			$('#btn_'+id).html(
			   "<input type='button' value='확인' onclick='up("+id+")'> "
			  +"<input type='button' value='취소' onclick='lst()'>");
		});
	});
	function up(id) {
		var replytext = $('#tt_'+id).val();
		var formData = "rno="+id+'&replytext='+replytext
			+"&bno=${rlist.reboard_bno}";
		$.post('${path}/repUpdate',formData, function(data) {
			$('#reboard_list').html(data);
		});
	}
	function lst() {
		$('#reboard_list').load('${path}/reboard_list/board_no/${rlist.board_no}')
	}
	function del(rno,bno) {
		var formData="rno="+rno+"&bno="+bno;
		$.post("${path}/repDelete",formData, function(data) {
			$('#reboard_list').html(data);
		});
	}
</script>
</head>
<body>
<div align="center">
		<c:forEach items="${rlist}" var="rlist">
						<div id="td_${rlist.reboard_rno}">${rb.replytext}</div>
						<div id="btn_${rlist.reboard_rno}">
						<button type="button" class="edit1" id="${rlist.reboard_rno}">
							<i class="fa-solid fa-check fa-lg"></i></button>
							&nbsp;|&nbsp; 
						<button type="button" onclick="del(${rlist.reboard_rno},${rlist.reboard_bno})">
							<i class="fa-regular fa-trash-can fa-lg"></i></button></div>
			<hr	style="color: #FFD9CC; border: 3px; border-style: dotted; width: 20%;">
		</c:forEach>
	</div>
</body>
</html>
function board_wcheck() {
	if ($.trim($("#board_subject").val()) == "") {
		alert("글제목을 입력하세요!");
		$("#board_subject").val("").focus();
		return false;
	}
	if ($.trim($("#board_content").val()) == "") {
		alert("글내용을 입력하세요!");
		$("#board_content").val("").focus();
		return false;
	}
}
function board_check() {
	if ($.trim($("#board_passwd").val()) == "") {
		alert("비밀번호를 입력하세요!");
		$("#board_passwd").val("").focus();
		return false;
	}
	if ($.trim($("#board_subject").val()) == "") {
		alert("글제목을 입력하세요!");
		$("#board_subject").val("").focus();
		return false;
	}
	if ($.trim($("#board_content").val()) == "") {
		alert("글내용을 입력하세요!");
		$("#board_content").val("").focus();
		return false;
	}
}
function delete_check(){
	  if($.trim($("#board_passwd").val())==""){
		  alert("삭제 비밀번호을 입력하세요!");
		  $("#board_passwd").val("").focus();
		  return false;
	 }
}

function notice_check() {
	if ($.trim($("#notice_admin_id").val()) == "") {
		alert("글쓴이를 입력하세요!");
		$("#notice_admin_id").val("").focus();
		return false;
	}
	if ($.trim($("#notice_subject").val()) == "") {
		alert("글제목을 입력하세요!");
		$("#notice_subject").val("").focus();
		return false;
	}
	if ($.trim($("#notice_content").val()) == "") {
		alert("글내용을 입력하세요!");
		$("#notice_content").val("").focus();
		return false;
	}
}
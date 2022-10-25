function party_check() {
	if ($.trim($("#party_subject").val()) == "") {
		alert("제목을 입력하세요!");
		$("#party_subject").val("").focus();
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
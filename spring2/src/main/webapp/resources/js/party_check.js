function party_check() {
	//나이
	if ($("input:checkbox").is(":checked") == true) {
		return $("#party_age").val("20");
	}else{
		return $("#party_age").val("19");
	}
	
	//활동일
	if ($.trim($("#party_enddate").val()) == "") {
		alert("활동일을 입력하세요!");
		$("#party_enddate").val("").focus();
		return false;
	}
	if (isNaN($.trim($("#party_enddate").val()))) {
		alert("활동일은 숫자만 입력하세요!");
		$("#party_enddate").val("").focus();
		return false;
	}
	if ($.trim($("#party_enddate").val()).length != 8) {
		alert("활동일은 8자리 숫자로 입력하세요!");
		$("#party_enddate").val("").focus();
		return false;
	}
	
	//인원
	if ($.trim($("#party_max_count").val()) == "") {
		alert("모집인원 수를 입력하세요!");
		$("#party_max_count").val("").focus();
		return false;
	}
	if (isNaN($.trim($("#party_max_count").val()))) {
		alert("모집인원 수는 숫자로 입력하세요!");
		$("#party_max_count").val("").focus();
		return false;
	}
	if ($.trim($("#party_max_count").val()) > 5) {
		alert("최대 모집인원은 5명 이하입니다.");
		$("#party_max_count").val("").focus();
		return false;
	}
	
	//제목
	if ($.trim($("#party_subject").val()) == "") {
		alert("제목을 입력하세요!");
		$("#board_subject").val("").focus();
		return false;
	}
	
	//내용
	if ($.trim($("#party_content").val()) == "") {
		alert("내용을 입력하세요!");
		$("#board_content").val("").focus();
		return false;
	}
}

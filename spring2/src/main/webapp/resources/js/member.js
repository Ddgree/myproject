var idcheck = 0;
var nickcheck =0;

function check(){
	 if($.trim($("#member_id").val())==""){
		 alert("회원아이디를 입력하세요!");
		 $("#member_id").val("").focus();
		 return false;
	 }
	 if($.trim($("#member_passwd1").val())==""){
		 alert("회원비번을 입력하세요!");
		 $("#member_pwd1").val("").focus();
		 return false;
	 }
	 if($.trim($("#member_passwd2").val())==""){
		 alert("회원비번확인을 입력하세요!");
		 $("#member_pwd2").val("").focus();
		 return false;
	 }
	 if($.trim($("#member_passwd1").val()) != $.trim($("#member_passwd2").val())){
		 //!=같지않다 연산. 비번이 다를 경우
		 alert("비번이 다릅니다!");
		 $("#member_passwd1").val("");
		 $("#member_passwd2").val("");
		 $("#member_passwd1").focus();
		 return false;
	 }
	 if($.trim($("#member_name").val())==""){
		 alert("회원이름을 입력하세요!");
		 $("#member_name").val("").focus();
		 return false;
	 }
	 
	 if($.trim($("#member_nickname").val())==""){
		 alert("회원닉네임을 입력하세요!");
		 $("#member_nickname").val("").focus();
		 return false;
	 }
	
	 if($.trim($("#member_address").val())==""){
		 alert("지역을 선택하세요!");
		 $("#member_address").val("").focus();
		 return false;
	 }
	 
	 if($("#male").is(":checked")==false &&
		$("#female").is(":checked")==false){
		alert("성별을 체크하세요!");
		return false;
	 }
	 
	 if($("#adult").is(":checked")==false &&
		$("#student").is(":checked")==false){
		alert("나이를 체크하세요!");
		return false;
	 }

	 
	 if($.trim($("#member_phone").val())==""){
		 alert("전화번호를 입력하세요!");
		 $("#member_phone").val("").focus();
		 return false;
	 }
	 if($.trim($("#member_phone").val()).length > 11){
		 	alert("전화번호는 11자리만 입력하세요!");
			$("#member_phone").val("").focus();
			return false;
	 }
	 if($.trim($("#member_phone").val()).length < 11){
		 	alert("전화번호는 11자리만 입력하세요!");
			$("#member_phone").val("").focus();
			return false;
	 }

	 if($.trim($("#member_mailid").val())==""){
		 alert("메일 아이디를 입력하세요!");
		 $("#member_mailid").val("").focus();
		 return false;
	 }
	 if($.trim($("#member_maildomain").val())==""){
		 alert("메일 주소를 입력하세요!");
		 $("#member_maildomain").val("").focus();
		 return false;
	 }	 	 
	 if(idcheck ==0){
		 alert("ID 중복 체크를 입력하세요")
		 return false;
	 }
	 if(nickcheck ==0){
		 alert("닉네임 중복 체크를 입력하세요")
		 return false;
	 }
	
 }
// 아이디 찾기 유효성 검사


/* 아이디 중복 체크*/
function id_check(){
	$("#idcheck").hide();//idcheck span 아이디 영역을 숨긴다.
	var memid=$("#member_id").val();
	
	//1.입력글자 길이 체크
	if($.trim($("#member_id").val()).length < 4){
		var newtext='<font color="red">아이디는 4자 이상이어야 합니다.</font>';
		$("#idcheck").text('');
		$("#idcheck").show();
		$("#idcheck").append(newtext);//span 아이디 영역에 경고문자 추가
		$("#member_id").val("").focus();
		return false;
	};
	if($.trim($("#member_id").val()).length >12){
		var newtext='<font color="red">아이디는 12자 이하이어야 합니다.</font>';
		$("#idcheck").text('');
		$("#idcheck").show();
		$("#idcheck").append(newtext);//span 아이디 영역에 경고문자 추가
		$("#member_id").val("").focus();
		return false;
	};
	//입력아이디 유효성 검사
	if(!(validate_userid(memid))){
		var newtext='<font color="red">아이디는 영문소문자,숫자,_ 조합만 가능합니다.</font>';
		$("#idcheck").text('');//문자 초기화
		$("#idcheck").show();//span 아이디 영역을 보이게 한다.
		$("#idcheck").append(newtext);
		$("#member_id").val("").focus();
		return false;
	};
	

	//아이디 중복확인
    $.ajax({
        type:"POST",
        url:"member_idcheck.do",
        data: {"memid":memid},        
        success: function (data) { 
      	  if(data==1){	//중복 ID
      		var newtext='<font color="red">중복 아이디입니다.</font>';
      			$("#idcheck").text('');
        		$("#idcheck").show();
        		$("#idcheck").append(newtext);
          		$("#member_id").val('').focus();
          		return false;
	     
      	  }else if(data==3){
          	var newtext='<font color="red">사용할 수 없는 아이디 입니다.</font>';
          		$("#idcheck").text('');
          		$("#idcheck").show();
            	$("#idcheck").append(newtext);
              	$("#member_id").val('').focus();
              	return false;
              	
      	  }else{	//사용 가능한 ID
      		var newtext='<font color="blue">사용가능한 아이디입니다.</font>';
      		$("#idcheck").text('');
      		$("#idcheck").show();
      		$("#idcheck").append(newtext);
      		$("#member_passwd1").focus();
      		idcheck = 1;
      	  }  	    	  
        }
        ,
    	  error:function(e){
    		  alert("data error"+e);
    	  }
      });//$.ajax	
};
/*아이디 중복 체크 끝*/


/* 닉네임 중복 체크*/
function nick_check(){
	$("#nickcheck").hide();//idcheck span 아이디 영역을 숨긴다.
	var memnick=$("#member_nickname").val();
	
	//1.입력글자 길이 체크
	if($.trim($("#member_nickname").val()).length < 2){
		var newtext='<font color="red">닉네임은 2자 이상이어야 합니다.</font>';
		$("#nickcheck").text('');
		$("#nickcheck").show();
		$("#nickcheck").append(newtext);//span 아이디 영역에 경고문자 추가
		$("#member_nickname").val("").focus();
		return false;
	};
	if($.trim($("#member_nickname").val()).length >6){
		var newtext='<font color="red">닉네임은 6자 이하이어야 합니다.</font>';
		$("#nickcheck").text('');
		$("#nickcheck").show();
		$("#nickcheck").append(newtext);//span 아이디 영역에 경고문자 추가
		$("#member_nickname").val("").focus();
		return false;
	};
	
	//입력닉네임 유효성 검사
	if(!(validate_usernick(memnick))){
		var newtext='<font color="red">닉네임은 영문소문자,숫자 조합만 가능합니다.</font>';
		$("#nickcheck").text('');//문자 초기화
		$("#nickcheck").show();//span 아이디 영역을 보이게 한다.
		$("#nickcheck").append(newtext);
		$("#member_nickname").val("").focus();
		return false;
	};
	

	//닉네임 중복확인
    $.ajax({
        type:"POST",
        url:"member_nickcheck.do",
        data: {"memnick":memnick},        
        success: function (data) { 
      	  if(data==1){	//중복 ID
      		var newtext='<font color="red">중복 닉네임입니다.</font>';
      			$("#nickcheck").text('');
        		$("#nickcheck").show();
        		$("#nickcheck").append(newtext);
          		$("#member_nickname").val('').focus();
          		return false;
	     
      	  }else{	//사용 가능한 ID
      		var newtext='<font color="blue">사용가능한 닉네임입니다.</font>';
      		$("#nickcheck").text('');
      		$("#nickcheck").show();
      		$("#nickcheck").append(newtext);
      		nickcheck = 1;
      	  }  	    	  
        }
        ,
    	  error:function(e){
    		  alert("data error"+e);
    	  }
      });//$.ajax	
};
/*닉네임 중복 체크 끝*/

function validate_userid(memid)
{
  var pattern= new RegExp(/^[a-z0-9_]+$/);
  //영문 소문자,숫자 ,_가능,정규표현식
  return pattern.test(memid);
};


function validate_usernick(memnick)
{
  var pattern= new RegExp(/^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣a-z0-9]+$/);
  //영문 소문자,숫자 ,_가능,정규표현식
  return pattern.test(memnick);
};

 
function domain_list() {
	 var num=f.mail_list.selectedIndex;
	/*selectedIndex속성은 select객체하위의 속성으로서 해당리스트 목록번호를 반환
	*/
	if ( num == -1 ) {
	//num==-1은 해당 리스트목록이 없다
	return true;
	 }
	 if(f.mail_list.value=="0") // 직접입력
	 {
	/*리스트에서 직접입력을 선택했을때*/
	 f.member_maildomain.value="";
	//@뒤의 도메인입력란을 빈공간시켜라.
	 f.member_maildomain.readOnly=false;
	//@뒤의 도메인입력란을 쓰기 가능
	f.member_maildomain.focus();
	//도메인입력란으로 입력대기상태
	}
	 
	 else {
	//리스트목록을 선택했을때
	 
	f.member_maildomain.value=f.mail_list.options[num].value;
	/*num변수에는 해당리스트 목록번호가 저장되어있다.해당리스트 번호의 option value값이 도메인입력란에 선택된다.options속성은 select객체의 속성으로서 해당리스트번호의 value값을 가져온다
	*/
	f.member_maildomain.readOnly=true;
	 }
 }

 
 /* 회원정보 수정 경고창 */
function edit_check(){
	if($.trim($("#member_passwd1").val())==""){
		 alert("회원비번을 입력하세요!");
		 $("#member_passwd1").val("").focus();
		 return false;
	 }
	 if($.trim($("#member_passwd2").val())==""){
		 alert("회원비번확인을 입력하세요!");
		 $("#member_passwd2").val("").focus();
		 return false;
	 }
	 if($.trim($("#member_passwd1").val()) != $.trim($("#member_passwd2").val())){
		 //!=같지않다 연산. 비번이 다를 경우
		 alert("비번이 다릅니다!");
		 $("#member_passwd1").val("");
		 $("#member_passwd2").val("");
		 $("#member_passwd1").focus();
		 return false;
	 }
	 if($.trim($("#member_name").val())==""){
		 alert("회원이름을 입력하세요!");
		 $("#member_name").val("").focus();
		 return false;
	 }
	
	 if($.trim($("#member_address").val())==""){
		 alert("지역을 입력하세요!");
		 $("#member_address").val("").focus();
		 return false;
	 }

	 if($.trim($("#member_phone").val())==""){
		 alert("휴대전화번호를 입력하세요!");
		 $("#member_phone").val("").focus();
		 return false;
	 }
	 if($.trim($("#member_mailid").val())==""){
		 alert("메일 아이디를 입력하세요!");
		 $("#member_mailid").val("").focus();
		 return false;
	 }
	 if($.trim($("#member_maildomain").val())==""){
		 alert("메일 주소를 입력하세요!");
		 $("#member_maildomain").val("").focus();
		 return false;
	 }	 	 
}

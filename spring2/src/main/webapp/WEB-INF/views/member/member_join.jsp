<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<style>
.join {
	margin-left: auto;
	margin-right: auto;
	border-spacing: 0 15px;
}

.button {
	background-color: black;
	color: white;
	text-align: center;
	font-size: 20px;
	width: 150px;
	height: 50px;
	transition: background 0.5s ease-in-out, color 0.5s ease-in-out;
}

.button:hover {
	background: #61443a;
	color: white;
	border: 0;
}

.button_1 {
	background-color: #61443a;
	color: white;
	border: 0;
	padding: 5px 5px;
	border-radius: 10px;
}

.dflex {
	display: flex;
	gap: 10px;
}

.radio-wrap input[type="radio"] {
	display: none;
}

.radio-wrap {
	width: 100px;
	height: 30px;
	border: 2px solid #eaeaea;
	border-radius: 5px;
}

.radio-wrap label {
	display: block;
	margin: 0 auto;
	height: -webkit-fill-available;
	line-height: 30px;
	border-radius: 5px;
	text-align: center;
	cursor: pointer;
}

.radio-wrap input[type="radio"]:checked+label {
	background: #61443a;
	color: white;
	font-weight: 500;
}
.pl{
    border: 2px solid #61443a;
    box-sizing: border-box;
    border-radius: 10px;
    padding: 5px 5px;
    font-family: 'Roboto';
    font-style: normal;
    font-weight: 400;
    font-size: 14px;
    line-height: 16px;
}

.pl:focus{
    border: 2px solid #61443a;
    box-sizing: border-box;
    border-radius: 10px;
    outline: 3px solid #F8E4FF;
    border-radius: 10px;
}
.input_box{
	padding: 3px;
	border-radius: 3px;
}
input[type=file]::file-selector-button {
 	 width: 100px;
 	 height: 30px;
 	 background: #fff;
 	 background-color: #61443a;
   	color: white;
   	border: 0;
  	border-radius: 10px;
  	cursor: pointer;
  &:hover {
    background: rgb(77,77,77);
    color: #fff;
  }
}
</style>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/member.js"></script>
<%@ include file="../member/header.jsp"%>
</head>
<body>
	<div id="join_wrap">
	<br><br><br>
		<form name="f" method="post" action="member_join_ok.do"
			onsubmit="return check()" enctype="multipart/form-data">
			<!-- 이진파일을 업로드 할려면 enctype 속성을 지정 -->
			<table class="join">
				<tr>
					<th>회원아이디</th>
					<td><input name="member_id" id="member_id" size="14"
						class="input_box" /> <input type="button" value="아이디 중복체크"
						class="button_1" style="cursor: pointer;" onclick="id_check()" />
						<div id="idcheck"></div></td>
				</tr>

				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="member_passwd"
						id="member_passwd1" size="14" class="input_box" /></td>
				</tr>

				<tr>
					<th>비밀번호확인</th>
					<td><input type="password" name="member_passwd2"
						id="member_passwd2" size="14" class="input_box" /></td>
				</tr>

				<tr>
					<th>회원이름</th>
					<td><input name="member_name" id="member_name" size="14"
						class="input_box" /></td>
				</tr>

				<tr>
					<th>회원닉네임</th>
					<td><input name="member_nickname" id="member_nickname"
						size="14" class="input_box" /> <input type="button"
						value="닉네임 중복체크" class="button_1" style="cursor: pointer;"
						onclick="nick_check()" />
						<div id="nickcheck"></div></td>
				</tr>

				<tr>
					<th>성별</th>
					<td>
						<div class="dflex">
							<div class="radio-wrap">
								<input type=radio id="male" name="member_gender" value="남자" />
								<label for="male">남자</label>
							</div>
							<div class="radio-wrap">
								<input type=radio id="female" name="member_gender" value="여자" />
								<label for="female">여자</label>
							</div>
						</div>
					</td>
				</tr>

				<tr>
					<th>휴대전화번호</th>
					<td><input name="member_phone" id="member_phone" size="15"
						maxlength="11" placeholder="-없이 입력하세요" class="input_box"/></td>
				</tr>

				<tr>
					<th>나이</th>
					<td>
						<div class="dflex">
							<div class="radio-wrap">
								<input type=radio id="adult" name="member_age" value="20" /> <label
									for="adult">20세이상 </label>
							</div>
							<div class="radio-wrap">
								<input type=radio id="student" name="member_age" value="19">
								<label for="student">19세이하 </label>
							</div>
						</div>
					</td>
				</tr>


				<tr>
					<th>E메일</th>
					<td><input name="member_mailid" id="member_mailid" size="10"
						class="input_box" />@<input name="member_maildomain"
						id="member_maildomain" size="20" class="input_box" readonly /> <select
						name="mail_list" onchange="domain_list()" class="pl"  style="width: 130px;">
							<option value="">=이메일선택=</option>
							<option value="daum.net">daum.net</option>
							<option value="nate.com">nate.com</option>
							<option value="naver.com">naver.com</option>
							<option value="hotmail.com">hotmail.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="0">직접입력</option>
					</select></td>
				</tr>

				<tr>
					<th>지역</th>
					<td><%@ include
							file="../../../resources/include/address_sample.jsp"%>
						<select id="member_address" name="member_address" class="pl" style="width: 80px;">
							<c:forEach var="p" items="${address}" begin="0" end="5">
								<option value="${p}">${p}</option>
							</c:forEach>
					</select></td>
				</tr>

				<tr>
					<th>프로필사진</th>
					<td>
   						<input type="file" name="file1">
					</td>
				</tr>
			</table>

			<div>
				<input type="submit" value="회원가입" class="button"
					style="margin-left: 600px; cursor: pointer;" /> 
					<input type="reset" value="가입취소" class="button" style="cursor: pointer;"
					onclick='location="partyband.do"' />
			</div>
		</form>
	</div>
</body>
<%@ include file="footer.jsp"%>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/boardnotice.css" />
<script src="https://kit.fontawesome.com/f82eca20b8.js"
	crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/board.js"></script>
<script>
	$(document)
			.ready(
					function() {
						$(
								"input:radio[name='board_division'][value='${read.board_division}']")
								.attr("checked", true);
					});
</script>
<style>
.division_flex_wrap {
	display: flex;
	gap: 10px;
}

.division_flex input[type="radio"] {
	display: none;
}

.division_flex {
	width: 100px;
	height: 30px;
	border: 2px solid #eaeaea;
	border-radius: 5px;
}

.division_flex label {
	display: block;
	margin: 0 auto;
	height: -webkit-fill-available;
	line-height: 30px;
	border-radius: 5px;
	text-align: center;
	cursor: pointer;
}

.division_flex input[type="radio"]:checked+label {
	background: #61443a;
	color: white;
	font-weight: 500;
}
th {
	padding: 10px 20px;
	border: 1px solid #cccccc;
	font-size: 20px;
}

td {
	border: 1px solid #cccccc;
	font-size: 18px;
}
.input_button_u {
	background-color: black;
	color: white;
	text-align: center;
	font-size: 20px;
	width: 150px;
	height: 50px;	
	transition: background 0.5s ease-in-out, color 0.5s ease-in-out;
	cursor: pointer;
}
.input_button_u:hover {
	background: #61443a;
	color: white;
	border: 0;
}
</style>
</head>
	<%@ include file="../member/header_login.jsp"%>
<body>
<div class="wrapper">
	<div id="board_write" align="center">
		<h2 class="board_write_title">글 수정</h2>
		<form method="post" action="board_update_ok.do" enctype="multipart/form-data" onSubmit="return board_check()">
			<input type="hidden" name="member_id" value="${read.board_id}" />
			<input type="hidden" name="board_no" value="${read.board_no}" /> 
			<input type="hidden" name="page" value="${page}" />
			<table id="board_write_table" border=1 >
				<tr>
					<th>구분</th>
					<td>
					<div class="division_flex_wrap">
     				<div class="division_flex">
					<input type="radio" name="board_division" id="board_division_normal" class="input_box" value="일반" /> 
					<label for="board_division_normal">일반</label>
					</div>
					<div class="division_flex">
					<input type="radio" name="board_division" id="board_division_review" class="input_box" value="후기" />
					<label for="board_division_review">후기</label>
					</div>
					</td>
				</tr>

				<tr>
					<th>작성자</th>
					<td>${read.board_id}</td>
				</tr>

				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="board_passwd"
						id="board_passwd" size="14" class="input_box" /></td>
				</tr>

				<tr>
					<th>글제목</th>
					<td><input name="board_subject" id="board_subject" size="40"
						class="input_box" value="${read.board_subject}" /></td>
				</tr>

				<tr>
					<th>글내용</th>
					<td><textarea name="board_content" id="board_content" rows="8"
							cols="50" class="input_box">${read.board_content}</textarea></td>
				</tr>
				<tr rowspan=2>
					<th>첨부파일</th>
					<td>${read.board_file} <br><hr style="border-pattern:dotted;"/>
					<input type=file name="board_file1" >
					</td>
				</tr>

			</table>

			<div id="board_write_menu" style='margin-top: 20px;'>
				<input type="submit" value="수정" class="input_button_u" /> 
				<input type="reset" value="취소" class="input_button_u" onclick="history.go(-1)" />
			</div>
		</form>
	</div>
	</div>
</body>
<%@ include file="../member/footer.jsp"%>
</html>
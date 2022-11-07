<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
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
</head>

<body>
	<div id="board_write" align="center">
		<h2 class="board_write_title">글 수정</h2>
		<form method="post" action="board_update_ok.do" enctype="multipart/form-data" onSubmit="return board_check()">
			<input type="hidden" name="board_no" value="${read.board_no}" /> <input
				type="hidden" name="page" value="${page}" />
			<table id="board_write_table" border=1 >
				<tr>
					<th>구분</th>
					<td><input type="radio" name="board_division"
						id="board_division_normal" class="input_box" value="일반" /> 일반 <input
						type="radio" name="board_division" id="board_division_review"
						class="input_box" value="후기" /> 후기</td>
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
					<td>${read.board_file} <br><hr/>
					<input type=file name="board_file1" >
					</td>
				</tr>


			</table>

			<div id="board_write_menu" style='margin-top: 20px;'>
				<input type="submit" value="수정" class="input_button" /> <input
					type="reset" value="취소" class="input_button"
					onclick="history.go(-1)" />
			</div>
		</form>
	</div>
</body>
</html>
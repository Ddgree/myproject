<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
    
<!doctype html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>글 작성</title>
	<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/boardnotice.css" />
	<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/NoticeButton.css" />
<script src="https://kit.fontawesome.com/f82eca20b8.js"	crossorigin="anonymous"></script>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/board.js"></script>
	
<style>
#board_write_table{
	border: 1px solid #61443A;
	border-radius: 15px;
	overflow:hidden;
}
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
	width: 100px;
	height: 50px;
	padding: 10px 20px;
	font-size: 20px;
}

td {
	width: 500px;
	height: 50px;
	font-size: 18px;
}
</style>	
</head>
	<%@ include file="../member/header_login.jsp"%>
<body>

<div class="wrapper">
 <div id="board_write_title" align="center">
  <h2 class="board_write_title">글 작성</h2>
  <form method="post" action="board_write_ok.do" onSubmit="return board_wcheck()" enctype="multipart/form-data">
   <input type="hidden" name="board_id" value="${board.board_id}">
   <table id="board_write_table" border=1>
    <tr>
     <th>구분</th>
     <td>
     <div class="division_flex_wrap">
     	<div class="division_flex">
    		 <input type="radio" name="board_division" id="board_division_normal" value="일반" checked="checked"/>
     		<label for="board_division_normal">일반</label>
     	</div >
    	 <div class="division_flex">
     		<input type="radio" name="board_division" id="board_division_review" value="후기" />
    		<label for="board_division_review">후기</label>  
    	 </div>
     </div>
     </td>
    </tr>
    <tr>
     <th>글제목</th>
     <td>
      <input name="board_subject" id="board_subject"
      class="input_box" />
     </td>
    </tr>
    
    <tr>
     <th>글내용</th>
     <td>
      <textarea name="board_content"  id="board_content" rows="8" cols="50"
      class="input_box_write"></textarea>
     </td>
    </tr>
     
    <tr>
     <th>첨부파일</th>
     <td>
      <input type=file name="board_file1" />
     </td>
    </tr> 
   </table>
   <div id="board_write_menu" style='margin-top: 20px;'>
    <input type="submit" value="등록" class="button" />
    <input type="button" value="취소" class="button"
    onclick="history.go(-1)" />
   </div>
  </form>
 </div>
	</div>
</body>
<%@ include file="../member/footer.jsp"%>
</html>
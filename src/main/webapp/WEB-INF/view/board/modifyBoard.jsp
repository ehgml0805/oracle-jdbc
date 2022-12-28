<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/board/modifyBoard" method="post" id="modifyBoard">
			<input type="hidden" name="boardNo" value="${b.boardNo}">
		<table>
			<tr>
				<td>Title</td>
				<td><input type="text" name="boardTitle" id="boardTitle" value="${b.boardTitle }"></td>
			</tr>
			<tr>
				<td>Content</td>
				<td><textarea cols="30" rows="10" name="boardContent" id="boardContent">${b.boardContent }</textarea></td>
			</tr>
			<tr>
				<td>ID</td>
				<td><input type="text" name="memberId" value="${loginMember.memberId }" readonly="readonly"></td>
			</tr>
		</table>
		<button type="button" name="addBoardBt" id="modifyBoardBt">update</button>
	</form>
	<script>
		let modifyBoardBt=document.querySelector('#modifyBoardBt');
		modifyBoardBt.addEventListener("click",function(e) {
			console.log('게시판 추가 버튼 클릭');
		//폼 유효성 검사
		let boardTitle=document.querySelector('#boardTitle');
		if(boardTitle.value==''){
			alert('제목을 입력하세요');
			boardTitle.focus();
			return;
		}
		let boardContent=document.querySelector('#boardContent');
		if(boardContent.value==''){
			alert('내용을 입력하세요!');
			boardContent.focus();
			return;
		}
		let modifyBoard=document.querySelector('#modifyBoard');
		modifyBoard.submit();
	});
	</script>


</body>
</html>
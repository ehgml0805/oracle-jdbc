<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/board/addBoard" method="post" id="addBoard">
		<table>
			<tr>
				<td>Title</td>
				<td><input type="text" name="boardTitle" id="boardTitle"></td>
			</tr>
			<tr>
				<td>Content</td>
				<td><textarea cols="30" rows="10" name="boardContent" id="boardContent"></textarea></td>
			</tr>
			<tr>
				<td>ID</td>
				<td><input type="text" name="memberId" value="${loginMember.memberId }" readonly="readonly"></td>
			</tr>
		</table>
		<button type="button" name="addBoardBt" id="addBoardBt">add</button>
	</form>
	<script>
		let addBoardBt=document.querySelector('#addBoardBt');
		addBoardBt.addEventListener("click",function(e) {
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
		let addBoard=document.querySelector('#addBoard');
		addBoard.submit();
	});
	</script>
</body>
</html>
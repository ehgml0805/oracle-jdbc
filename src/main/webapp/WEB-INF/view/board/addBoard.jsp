<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보드 추가하기</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootswatch@5.2.3/dist/sketchy/bootstrap.min.css"
	integrity="sha256-S9eRkzoV4yJSM9TDp50jDeYtu26CRF837ePOLCUlcwo="
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootswatch@5.2.3/dist/sketchy/bootstrap.css"
	integrity="sha256-JJ4p3Dz8B2dC73R30IJXrwTeMvB8hi3VMOgHmWxMeZw="
	crossorigin="anonymous">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="#">Blog</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarColor02" aria-controls="navbarColor02"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarColor02">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active">
					<a class="nav-link" href="${pageContext.request.contextPath}/home">Home
					<span class="sr-only">(current)</span> </a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="${pageContext.request.contextPath}/board/boardList">Board</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="${pageContext.request.contextPath}/member/memberOne">My Page</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="${pageContext.request.contextPath}/member/logout">LOG OUT</a>
				</li>
			</ul>
		</div>
	</nav>
	<div class="card">
		<div class="card-body">
			<h4 class="card-title">Board List</h4>
			<h6 class="card-subtitle mb-2 text-muted">Board Add</h6>
			<hr class="my-4">
			<form action="${pageContext.request.contextPath}/board/addBoard"
				method="post" id="addBoard">
				<table>
					<tr class="form-group">
						<td><label for="exampleInputEmail1">Title</label></td>
						<td><input type="text" class="form-control" name="boardTitle" id="boardTitle"></td>
					</tr>
					<tr class="form-group">
						<td><label for="exampleInputEmail1">Content</label></td>
						<td><textarea class="form-control" cols="30" rows="10" name="boardContent" id="boardContent"></textarea></td>
					</tr>
					<tr class="form-group">
						<td><label for="exampleInputEmail1">ID</label></td>
						<td><input type="text" class="form-control" name="memberId" value="${loginMember.memberId }" readonly="readonly"></td>
					</tr>
				</table>
				<div class="btn-group">
					<button type="button" name="addBoardBt" id="addBoardBt" class="btn btn-outline-primary ">add</button>
				</div>
			</form>
		</div>
	</div>

	<script>
		let addBoardBt = document.querySelector('#addBoardBt');
		addBoardBt.addEventListener("click", function(e) {
			console.log('게시판 추가 버튼 클릭');
			//폼 유효성 검사
			let boardTitle = document.querySelector('#boardTitle');
			if (boardTitle.value == '') {
				alert('제목을 입력하세요');
				boardTitle.focus();
				return;
			}
			let boardContent = document.querySelector('#boardContent');
			if (boardContent.value == '') {
				alert('내용을 입력하세요!');
				boardContent.focus();
				return;
			}
			let addBoard = document.querySelector('#addBoard');
			addBoard.submit();
		});
	</script>
</body>
</html>
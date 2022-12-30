<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보 수정하기</title>
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
	<form action="${pageContext.request.contextPath}/member/modifyMember"
		method="post" id="updateForm">
		<div class="jumbotron" style="max-width: 28rem; margin: auto;">
			<h3 class="display-3" style="text-align: center;">update</h3>
			<div class="card-body">
				<div class="form-group">
					<label for="exampleInputEmail1">ID</label> <input class="form-control" type="text" name="memberId" value="${loginMember.memberId}" readonly="readonly">
				</div>
				<div class="form-group">
					<label for="exampleInputEmail1">변경 전 이름</label>
					<input class="form-control" type="text" name="bememberName" value="${loginMember.memberName}" readonly="readonly">
				</div>
				<div class="form-group">
					<label for="exampleInputEmail1">변경 할 이름</label>
					<input class="form-control" type="text" name="memberName" id="memberName" placeholder="Name">
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">PASSWORD</label>
					<input class="form-control" type="password" name="memberPw" id="memberPw" placeholder="Password">
				</div>
				<hr class="my-4">
				<button type="button" id="updateBt" class="btn btn-outline-primary">update</button>
			</div>
		</div>
	</form>
	<script>
		let updateBt = document.querySelector('#updateBt');
		updateBt.addEventListener("click", function(e) {
			console.log('수정하기 버튼 클릭');
			//폼 유효성 검사
			let memberName = document.querySelector('#memberName');
			if (memberName.value == '') {
				alert('이름을 입력하세요');
				memberName.focus();
				return;
			}
			let memberPw = document.querySelector('#memberPw');
			if (memberPw.value == '') {
				alert('비밀번호를 확인하세요!');
				memberPw.focus();
				return;
			}
			let updateForm = document.querySelector('#updateForm');
			updateForm.submit();
		});
	</script>
</body>
</html>
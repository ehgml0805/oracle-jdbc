<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>로그인</title>
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
	<form action="${pageContext.request.contextPath}/member/login"
		method="post" id="loginForm">
		<div class="jumbotron" style="max-width: 28rem; margin: auto;">
			<h3 class="display-3" style="text-align: center;">LOGIN</h3>
			<div class="card-body">
				<div class="form-group">
					<label for="exampleInputEmail1">ID</label>
					<input type="text" class="form-control" name="memberId" id="memberId" placeholder="ID">
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">PASSWORD</label>
					<input type="password" class="form-control" name="memberPw" id="memberPw" placeholder="Password">
				</div>
			</div>
			<hr class="my-4">
			<div class="btn-group">
				<button type="button" id="loginInBt" class="btn btn-outline-primary ">LOGIN</button>
			</div>
		</div>
	</form>

	<script>
		let loginInBt = document.querySelector('#loginInBt');
		loginInBt.addEventListener("click", function(e) {
			console.log('로그인 버튼 클릭');
			//폼 유효성 검사
			let memberId = document.querySelector('#memberId');
			if (memberId.value == '') {
				alert('아이디를 입력하세요');
				memberId.focus();
				return;
			}
			let memberPw = document.querySelector('#memberPw');
			if (memberPw.value == '') {
				alert('비밀번호를 확인하세요!');
				memberPw.focus();
				return;
			}
			let loginForm = document.querySelector('#loginForm');
			loginForm.submit();
		});
	</script>
</body>
</html>
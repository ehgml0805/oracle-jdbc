<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<body>
	<form action="${pageContext.request.contextPath}/member/removeMember"
		method="post" id="removeMember">
		<div class="jumbotron" style="max-width: 28rem; margin: auto;">
			<h3 class="display-3" style="text-align: center;">SIGN UP</h3>
			<div class="card-body">

				<div class="form-group">
					<label for="exampleInputEmail1">ID</label> <input
						class="form-control" type="text" name="memberId"
						value="${loginMember.memberId}" readonly="readonly">
				</div>
				<div class="form-group">
					<label for="exampleInputEmail1">NAME</label> <input
						class="form-control" type="text" name="memberName" id="memberName"
						value="${loginMember.memberName}" readonly="readonly">
				</div>

				<div class="form-group">
					<label for="exampleInputPassword1">PASSWORD</label> <input
						class="form-control" type="password" name="memberPw" id="memberPw">
				</div>
			</div>
			<hr class="my-4">
			<button type="button" id="removeBt" class="btn btn-outline-primary"
				placeholder="Password">remove</button>
		</div>
	</form>
	<script>
		let removeBt = document.querySelector('#removeBt');
		removeBt.addEventListener("click", function(e) {
			console.log('수정하기 버튼 클릭');
			//폼 유효성 검사
			let memberPw = document.querySelector('#memberPw');
			if (memberPw.value == '') {
				alert('비밀번호를 입력하세요!');
				memberPw.focus();
				return;
			}

			let removeMember = document.querySelector('#removeMember');
			removeMember.submit();
		});
	</script>

</body>
</html>
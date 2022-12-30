<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
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
	<form action="${pageContext.request.contextPath}/member/addMember" method="post" id="signInForm">
		<div class="jumbotron" style="max-width: 28rem; margin: auto;">
		<h3 class="display-3" style="text-align: center;">SIGN UP</h3>
			<div class="card-body">
			
				<div class="form-group">
					<label for="exampleInputEmail1">NAME</label>
					<input class="form-control" type="text" name="memberName" id="memberName" placeholder="Name">
				</div>
				<div class="form-group">
					<label for="exampleInputEmail1">ID</label>
					<input class="form-control" type="text" name="memberId" id="memberId" placeholder="ID">
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">PASSWORD</label>
					<input class="form-control" type="password" name="memberPwCk" id="memberPwCk" placeholder="Password">
				</div>
				<div class="form-group">
					<label for="exampleInputEmail1">PASSWORD</label>
					<input class="form-control" type="password" name="memberPw" id="memberPw" placeholder="Confirm Password">
				</div>
				
			</div>
			<hr class="my-4">
		<button type="button" id="signinInBt" class="btn btn-outline-primary" >SIGN UP</button>
		</div>
	</form>

<script>
	let signinInBt=document.querySelector('#signinInBt');
	signinInBt.addEventListener("click", function(e) {
		//폼 유효성 검사
		let memberName=document.querySelector('#memberName');
		if(memberName.value==''){
			alert('이름을 입력하세요');
			memberName.focus();
			return;
		}
		
		let memberId=document.querySelector('#memberId');
		if(memberId.value==''){
			alert('아이디를 입력하세요');
			memberId.focus();
			return;
		}
		let memberPwCk=document.querySelector('#memberPwCk');
		if(memberPwCk.value==''){
			alert('비밀번호를 입력하세요!');
			memberPwCk.focus();
			return;
		}
		let memberPw=document.querySelector('#memberPw');
		if(memberPw.value!=memberPwCk.value){
			alert('비밀번호를 확인하세요!');
			return false; //false 적어줘야 비밀번호가 다를 경우 회원가입 액션으로 안넘어감
		}
		let signInForm=document.querySelector('#signInForm');
		signInForm.submit();
	});
</script>
</body>
</html>
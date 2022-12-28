<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/member/login" method="post" id="loginForm">
		<table>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="memberId" id="memberId"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="memberPw" id="memberPw"></td>
			</tr>
		</table>
		<button type="button" id="loginInBt">로그인</button>
	</form>
<script>
	let loginInBt=document.querySelector('#loginInBt');
	loginInBt.addEventListener("click",function(e) {
		console.log('로그인 버튼 클릭');
		//폼 유효성 검사
		let memberId=document.querySelector('#memberId');
		if(memberId.value==''){
			alert('아이디를 입력하세요');
			memberId.focus();
			return;
		}
		let memberPw=document.querySelector('#memberPw');
		if(memberPw.value==''){
			alert('비밀번호를 확인하세요!');
			memberPw.focus();
			return;
		}
		
		let loginForm=document.querySelector('#loginForm');
		loginForm.submit();
	});
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/member/addMember" method="post" id="signInForm">
		<table>
			<tr>
				<th>이름</th>
				<td><input type="text" name="memberName" id="memberName"></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="memberId" id="memberId"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="memberPwCk" id="memberPwCk"></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td><input type="password" name="memberPw" id="memberPw"></td>
			</tr>
		</table>
		<button type="button" id="signinInBt">회원가입</button>
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
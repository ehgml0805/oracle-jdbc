<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<body>
	<form action="${pageContext.request.contextPath}/member/removeMember" method="post"  id="removeMember">
		<table>
			<tr>
				<td>ID</td>
				<td><input type="text" name="memberId" value="${loginMember.memberId}" readonly="readonly"></td>
			</tr>
			<tr>
				<td>Name</td>
				<td><input type="text" name="memberName" id="memberName" value="${loginMember.memberName}" readonly="readonly"></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="password" name="memberPw" id="memberPw"></td>
			</tr>
		</table>
		<button type="button" id="removeBt">remove</button>
		
	</form>
<script>

	let removeBt=document.querySelector('#removeBt');
	removeBt.addEventListener("click", function(e) {
		console.log('수정하기 버튼 클릭');
		//폼 유효성 검사
		let memberPw=document.querySelector('#memberPw');
		if(memberPw.value==''){
			alert('비밀번호를 입력하세요!');
			memberPw.focus();
			return;
		}
		
		let removeMember=document.querySelector('#removeMember');
		removeMember.submit();
	});

</script>

</body>
</html>
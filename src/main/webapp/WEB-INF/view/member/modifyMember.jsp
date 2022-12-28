<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/member/modifyMember" method="post"  id="updateForm">
		<table>
			<tr>
				<td>ID</td>
				<td><input type="text" name="memberId" value="${loginMember.memberId}" readonly="readonly"></td>
			</tr>
			<tr>
				<td>변경 전 이름</td>
				<td><input type="text" name="bememberName" value="${loginMember.memberName}" readonly="readonly"></td>
			</tr>
			<tr>
				<td>변경 후 이름</td>
				<td><input type="text" name="memberName" id="memberName"></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="password" name="memberPw" id="memberPw"></td>
			</tr>
		</table>
		<button type="button" id="updateBt">update</button>
		
	</form>
<script>

	let updateBt=document.querySelector('#updateBt');
	updateBt.addEventListener("click", function(e) {
		console.log('수정하기 버튼 클릭');
		//폼 유효성 검사
		let memberName=document.querySelector('#memberName');
		if(memberName.value==''){
			alert('이름을 입력하세요');
			memberName.focus();
			return;
		}
		let memberPw=document.querySelector('#memberPw');
		if(memberPw.value==''){
			alert('비밀번호를 확인하세요!');
			memberPw.focus();
			return;
		}
		
		let updateForm=document.querySelector('#updateForm');
		updateForm.submit();
	});

</script>
</body>
</html>
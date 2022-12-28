<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	 ${loginMember.memberName}님, 반갑습니다.
	 
	<div>
		<a href="${pageContext.request.contextPath}/member/modifyMember">개인정보수정</a>
		<a href="${pageContext.request.contextPath}/member/removeMember">회원탈퇴</a>
		<a href="${pageContext.request.contextPath}/member/logout">로그아웃</a>
	</div>
</body>
</html>
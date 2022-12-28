<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
</head>
<body>
<!-- 설명.. 포트 폴리오 이 프로젝트를 왜 하였는지? 주로 마리아디비를 사용하였지만 
오라클 디비 사용해서 프로그램 하나 만들고 싶었음... 
그리고 mvc 모델2로 바꾸는 작업도 해볼겸 두달정도 수업한거 정리할겸 간단하게 만드어보았음 -->
		<div>Menu</div>
		<!-- 로그인 전  -->
		<c:if test="${loginMember == null}">
		<ul>
			<li><a href="${pageContext.request.contextPath}/member/login"> 로그인 </a></li>
			<li><a href="${pageContext.request.contextPath}/member/addMember">회원가입</a></li>
		</ul>
		</c:if>
		<!-- 로그인 후 -->
		<c:if test="${loginMember != null}">
		<ul>
			<li><a href="${pageContext.request.contextPath}/board/boardList">게시판</a></li>
			<li><a href="${pageContext.request.contextPath}/member/memberOne">마이페이지</a></li>
			<li><a href="${pageContext.request.contextPath}/member/logout">로그아웃</a></li>
		</ul>
		</c:if>

</body>
</html>
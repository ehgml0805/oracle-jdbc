<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
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
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="#">Blog</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor02" aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarColor02">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="${pageContext.request.contextPath}/home">Home
          <span class="sr-only">(current)</span>
        </a>
        
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/board/boardList">Board</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/member/memberOne">My Page</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">About</a>
      </li>
    </ul>
  </div>
</nav>
<!-- 설명.. 포트 폴리오 이 프로젝트를 왜 하였는지? 주로 마리아디비를 사용하였지만 
오라클 디비 사용해서 프로그램 하나 만들고 싶었음... 
그리고 mvc 모델2로 바꾸는 작업도 해볼겸 두달정도 수업한거 정리할겸 간단하게 만드어보았음 -->
	 <div class="jumbotron">
  <h3 class="display-3">Hello, ${loginMember.memberName}.</h3>
  <p class="lead">This is a simple hero unit, a simple jumbotron-style component for calling extra attention to featured content or information.</p>
  <hr class="my-4">
  <p>It uses utility classes for typography and spacing to space content out within the larger container.</p>
  <p class="lead">
    <a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a>
  </p>
</div>
	<div>
		<a href="${pageContext.request.contextPath}/member/modifyMember">개인정보수정</a>
		<a href="${pageContext.request.contextPath}/member/removeMember">회원탈퇴</a>
		<a href="${pageContext.request.contextPath}/member/logout">로그아웃</a>
	</div>
</body>
</html>
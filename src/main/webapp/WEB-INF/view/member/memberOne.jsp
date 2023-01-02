<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
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
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarColor02" aria-controls="navbarColor02"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarColor02">
			<ul class="navbar-nav mr-auto">
			
				<li class="nav-item active">
					<a class="nav-link" href="${pageContext.request.contextPath}/home">Home
					<span class="sr-only">(current)</span> </a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="${pageContext.request.contextPath}/board/boardList">Board</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="${pageContext.request.contextPath}/member/memberOne">My Page</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/logout">LOG OUT</a>
				</li>
			</ul>
		</div>
	</nav>
	<h3 class="display-3">Hello, ${loginMember.memberName}.</h3>
	<div class="card mb-3">
		<h3 class="card-header">My Page</h3>
		<div class="card-body">
			<h6 class="card-subtitle text-muted">이 프로젝트를 왜 하였는지?</h6>
		</div>
		<div class="card-body">
			<p class="card-text">
			...작성예정
				두달차 미니 프로젝트
				학원에서 처음 디비 사용할때는 마리아디비를 이용하였음 <br> 
				배울때 느낀 점은 처음 사용하는 사람 입장에서는 마리아디비가 이용하기 쉽다고 느꼈음<br>
				하지만 현직 나가면 오라클을 더 많이 사용한다고 함<br> 그래서 오라클 디비 사용해서 간단한 웹프로젝트를 하나 만들고 싶었음... <br>
				그리고 이전에는 서블릿을 사용하지 않고 mvc 모델1으로 CRUD를 하였다면 이제는 mvc 모델2로
				바꾸는 작업도 해볼겸 두달정도 수업한거 정리할겸 간단하게 만들어보았음 (수정예정)
			</p>
		</div>
		<ul class="list-group list-group-flush">
			<li class="list-group-item">
				<a href="${pageContext.request.contextPath}/member/modifyMember" class="card-link">개인정보 수정하기</a>
			</li>
			<li class="list-group-item">
				<a href="${pageContext.request.contextPath}/member/removeMember" class="card-link">회원탈퇴</a>
			</li>
		</ul>
		<!-- 아래 꺼 의미 없음,,,그냥 허전해보이길래,, -->
		<div class="card-footer text-muted">2 days ago..</div>
	</div>
</body>
</html>
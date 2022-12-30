<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보드 상세보기</title>
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
				<li class="nav-item">
					<a class="nav-link" href="${pageContext.request.contextPath}/member/logout">LOG OUT</a>
				</li>
			</ul>
		</div>
	</nav>
	<div class="card">
		<div class="card-body">
			<h4 class="card-title">Board List</h4>
			<h6 class="card-subtitle mb-2 text-muted">Board Detail</h6>
			<form>
				<div class="card-body">
					<div class="form-group">
						<label for="exampleInputEmail1">No. </label> ${b.boardNo }
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Title: </label> ${b.boardTitle }
					</div>
					<p class="card-text">
						<label for="exampleInputPassword1">Content: </label> <br>
						${b.boardContent }
					</p>
					<div class="form-group">
						<label for="exampleInputPassword1">ID: </label> ${b.memberId }
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Creat: </label> ${b.createdate }
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Update: </label> ${b.updatedate }
					</div>
				</div>
			</form>
			<p class="card-text">
				<c:if test="${b.memberId==loginMember.memberId}">
					<!-- 작성자랑 로그인아이디가 같으면 보여줄거 -->
					<a href="${pageContext.request.contextPath}/board/modifyBoard?boardNo=${b.boardNo}&memberId=${b.memberId}">수정</a>
					<a href="${pageContext.request.contextPath}/board/removeBoard?boardNo=${b.boardNo}&memberId=${b.memberId}">삭제</a>
				</c:if>
			</p>
		</div>
	</div>
</body>
</html>
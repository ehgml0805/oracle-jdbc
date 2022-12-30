<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보드 리스트</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
	$('#rowPerPage').change(function() {
		$('#pageForm').submit();
		//alert('change');
	})
});
</script>
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
	<h1>Board List</h1>
	<form action="${pageContext.request.contextPath}/board/boardList"
		method="get" name="pageForm">
		<select name="rowPerPage" id="rowPerPage">
			<c:if test="${rowPerPage==10 }">
				<option value="10" selected="selected">10</option>
				<option value="20">20</option>
				<option value="30">30</option>
			</c:if>
			<c:if test="${rowPerPage==20 }">
				<option value="10">10</option>
				<option value="20" selected="selected">20</option>
				<option value="30">30</option>
			</c:if>
			<c:if test="${rowPerPage==30 }">
				<option value="10">10</option>
				<option value="20">20</option>
				<option value="30" selected="selected">30</option>
			</c:if>
		</select>
	</form>
	<a href="${pageContext.request.contextPath}/board/addBoard">공지사항 추가</a>
	<table class="table table-hover" style="text-align: center;">
		<tr>
			<th scope="col">No</th>
			<th scope="col">Title</th>
			<th scope="col">Createdate</th>
		</tr>
		<c:forEach var="b" items="${boardList}">
			<tr class=" table table-active">
				<td scope="row">${b.boardNo }</td>
				<td scope="row">
					<a href="${pageContext.request.contextPath}/member/boardOne?boardNo=${b.boardNo}">${b.boardTitle }</a></td>
				<td scope="row">${b.createdate }</td>
			</tr>
		</c:forEach>
	</table>
	<div>
		<a href="${pageContext.request.contextPath}/board/boardList?rowPerPage=${rowPerPage}&currentPage=1">처음</a>
		
		<c:if test="${rowPerPage<currentPage }">
			<a href="${pageContext.request.contextPath}/board/boardList?rowPerPage=${rowPerPage}&currentPage=${currentPage-1}">이전</a>
		</c:if>
		<c:if test="${rowPerPage>currentPage }">
			<a href="${pageContext.request.contextPath}/board/boardList?rowPerPage=${rowPerPage}&currentPage=${currentPage+1}">다음</a>
		</c:if>
	</div>
</body>
</html>
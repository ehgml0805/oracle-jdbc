<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$('#rowPerPage').change(function() {
			$('#pageForm').submit();
			
		})
	});
</script>

</head>
<body>
	<h1>Board List</h1>
	<form action="${pageContext.request.contextPath} //board/boardList" method="get" name="pageForm">
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
	<table>
		<tr>
			<th>No</th>
			<th>Title</th>
			<th>Createdate</th>
			<th>Updatedate</th>
		</tr>
		<c:forEach var="b" items="${boardList}">
			<tr>
				<td>${b.boardNo }</td>
				<td><a href="${pageContext.request.contextPath}/member/boardOne?boardNo=${b.boardNo}">${b.boardTitle }</a></td>
				<td>${b.createdate }</td>
				<td>${b.updatedate }</td>
			</tr>
		</c:forEach>
	</table>
	<div>
		<a href="${pageContext.request.contextPath}/BoardListController?rowPerPage=${rowPerPage}&currentPage=${currentPage-1}">이전</a>
		<a href="${pageContext.request.contextPath}/BoardListController?rowPerPage=${rowPerPage}&currentPage=${currentPage+1}">다음</a>
	</div>
</body>
</html>
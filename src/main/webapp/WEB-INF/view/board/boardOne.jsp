<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<th>No</th>
			<th>Title</th>
			<th>Content</th>
			<th>memberId</th>
			<th>Createdate</th>
			<th>Updatedate</th>
		</tr>

			<tr>
				<td>${b.boardNo }</td>
				<td>${b.boardTitle }</td>
				<td>${b.boardContent }</td>
				<td>${b.memberId }</td>
				<td>${b.createdate }</td>
				<td>${b.updatedate }</td>
			</tr>

	</table>
	<c:if test="${b.memberId==loginMember.memberId}"> <!-- 작성자랑 로그인아이디가 같으면 보여줄거 -->
	<a href="${pageContext.request.contextPath}/board/modifyBoard?boardNo=${b.boardNo}&memberId=${b.memberId}">수정</a>
	<a href="${pageContext.request.contextPath}/board/removeBoard?boardNo=${b.boardNo}&memberId=${b.memberId}">삭제</a>
	</c:if>
</body>
</html>
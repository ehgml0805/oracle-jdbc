<%@page import="oracle.jdbc.proxy.annotation.Pre"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
	
	int currentPage=1; //시작 페이징 1로 할거
	if(request.getParameter("currentPage")!=null){
		currentPage=Integer.parseInt(request.getParameter("currentPage"));
	}
	int rowPerPage=10; //10개씩 뽑을거
	int beginRow=(currentPage-1)*rowPerPage+1; //1번부터 뽑을거// 11번부터 뽑을거
	int endRow=beginRow+rowPerPage-1; //10번까지 보여줄거 //20번까지 보여줄거
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","gdj58","java1234");
	//System.out.println("드라이버 설치 성공");
	
	String sql="SELECT t2.rnum, t2.name FROM (SELECT rownum rnum, t.member_name name FROM (SELECT member_name FROM member ORDER BY member_name ASC) t) t2 WHERE rnum BETWEEN ? AND ?";
	PreparedStatement stmt= conn.prepareStatement(sql);
	stmt.setInt(1, beginRow);
	stmt.setInt(2, endRow);
	ResultSet rs=stmt.executeQuery();
	
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<th>번호</th>
			<th>이름</th>
		</tr>
		<%
			while(rs.next()){
		%>		
				<tr>
					<td><%=rs.getInt("rnum") %></td>
					<td><%=rs.getString("name") %></td>
				</tr>
		<%		
			}
		
		%>
	</table>
	<a href="<%=request.getContextPath()%>/memberList.jsp?currentPage=<%=currentPage-1%>">이전</a>
	<a href="<%=request.getContextPath()%>/memberList.jsp?currentPage=<%=currentPage+1%>">다음</a>

</body>
</html>
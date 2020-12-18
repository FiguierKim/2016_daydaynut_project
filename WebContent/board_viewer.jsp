<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="dao.PostDao"%>
<%@ page import="model.Post"%>
<%@ page import="model.PostListView"%>
<%@ page import="jdbc.connection.ConnectionProvider"%>
<%@ page import="jdbc.loader.DBCPInit"%>
<%@ page import="jdbc.util.JdbcUtil"%>
<%@ page import="java.net.*"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String pageNumberStr = request.getParameter("page");
		String id = request.getParameter("id");
		
		int pageNumber = 1;
		if (pageNumberStr != null) {
			pageNumber = Integer.parseInt(pageNumberStr);
		}
		Connection conn = ConnectionProvider.getConnection();
		PostDao postDao = new PostDao();
		PostListView postList = postDao.getPostListM(conn, pageNumber, id);

		if (postList == null) {
	%>
		등록된 메시지가 없습니다.
	<%
		} else {
	%>
	<table width="980" border="1">
		<tr>
			<th width="30" scope="col">번호</th>
			<th width="60" scope="col">분류</th>
			<th width="80" scope="col">작성자</th>
			<th width="200" scope="col">제목</th>
			<th width="150" scope="col">등록일</th>
		</tr>

		<%
			for (Post post : postList.getMessageList()) {
		%>
		<tr>
			<td align="center"><%=post.getPostId()%></td>
			<td align="center"><%=post.getItemCategory()%></td>
			<td align="center"><%=post.getMaker()%></td>
			<td><%=post.getTitle()%></td>
			<td align="center"><%=post.getMakeDate()%></td>
		</tr>

		<%
			}
		%>
	</table>
	<%
		}
	%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jdbc.connection.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@ page import="jdbc.util.JdbcUtil"%>
<%@ page import="dao.PostDao"%>
<%@ page import="model.Post"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <%
	//postId 값을 기준으로 튜플 삭제
	String postId = request.getParameter("postId"); //게시판에서 title 누르면 해당 게시글의 postId 값 넘겨줌
	String saleCategory = request.getParameter("saleCategory"); //saleCategory 값도 넘겨줌
	Connection conn = ConnectionProvider.getConnection();
	try {
		PostDao postDao = new PostDao();
		postDao.delete(conn, postId);
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		JdbcUtil.close(conn);
	}
    %>
    
    <script>
    var sc = "<%=saleCategory%>";
	alert("삭제되었습니다!");
	/*삭제 후 이동할 페이지 선택*/
	if(sc=="기업"){
	location.href="ListAll_comp.jsp";
	}else{
	location.href="ListAll_indivi.jsp";	
	}
	</script>
	
</body>
</html>
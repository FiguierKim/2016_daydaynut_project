<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="jdbc.util.JdbcUtil"%>
<%@ page import="jdbc.connection.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@ page import="model.User_Indivi"%>
<%@ page import="model.User_Comp"%>
<%@ page import="dao.UserDao_Indivi"%>
<%@ page import="dao.UserDao_Comp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#form {
	width: 500px;
	height: 400px;
	background-image: url(Images/back.png);
	background-repeat: no-repeat;
}

#form2 {
	width: 450px;
	height: 300px;
	margin-left: auto;
	margin-right: auto;
	padding-top: 150px;
}

#form #form2 font {
	font-size: 20px;
}
</style>
</head>
<body>
<div id="form">
	<div id="form2">
	<%
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("userName");
		String num = request.getParameter("userNum1") + "-"
				+ request.getParameter("userNum2");

		Connection conn = ConnectionProvider.getConnection();
		User_Indivi userI = new User_Indivi();

		try {
			UserDao_Indivi userDaoI = new UserDao_Indivi();
			userI = userDaoI.select2(conn, name, num);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
		}
		if (userI != null) {
	%>
	<font><%=name%>님의 아이디는
	<%=userI.getUserId()%>입니다.</font><br>
	<a href="pass_select.jsp">[비밀번호 찾기]</a>
	<%
		} else {
	%>
	<script>
		alert("검색결과가 없습니다.");
		history.go(-1);
	</script>
	<%
		}
	%>
        </div>
    </div>
</body>
</html>
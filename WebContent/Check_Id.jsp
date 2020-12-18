<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.UserDao_Indivi"%>
<%@ page import="model.User_Indivi"%>
<%@ page import="dao.UserDao_Comp"%>
<%@ page import="model.User_Comp"%>
<%@ page import="java.sql.*"%>
<%@ page import="jdbc.connection.ConnectionProvider"%>
<%@ page import="jdbc.util.JdbcUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
<form>
	<%
		request.setCharacterEncoding("utf-8");
		String id = (String) request.getParameter("id");
		String categori = (String) session.getAttribute("USER");

		Connection conn = ConnectionProvider.getConnection();

		if (categori.equals("indivi")) {
			User_Indivi user = new User_Indivi();

			try {
				UserDao_Indivi userDao = new UserDao_Indivi();
				user = userDao.select(conn, id);
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				JdbcUtil.close(conn);
			}
			if (user != null) {
				if (id.equals(user.getUserId())) {
	%>
	<img src="Images/id_check_pop_up1.png" usemap="#Map" border="0">
    <map name="Map">
      <area shape="rect" coords="113,152,186,175" onClick="window.close()">
    </map>
<% session.setAttribute("RESULT","false");
		}
			} else {
	%>
	<img src="Images/id_check_pop_up2.png" usemap="#Map" border="0">
    <map name="Map">
      <area shape="rect" coords="113,152,186,175" onClick="window.close()">
    </map>
	<% session.setAttribute("RESULT","true");
		}
		} else {
			User_Comp user = new User_Comp();
			try {
				UserDao_Comp userDao = new UserDao_Comp();
				user = userDao.select(conn, id);
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				JdbcUtil.close(conn);
			}

			if (user != null) {
				if (id.equals(user.getUserId())) {
	%>
	<img src="Images/id_check_pop_up1.png" usemap="#Map" border="0">
    <map name="Map">
      <area shape="rect" coords="113,152,186,175" onClick="window.close()">
    </map>
	<% session.setAttribute("RESULT","false");
		}
			} else {
	%>
	<img src="Images/id_check_pop_up2.png" usemap="#Map" border="0">
    <map name="Map">
      <area shape="rect" coords="113,152,186,175" onClick="window.close()">
    </map>
	<% session.setAttribute("RESULT","true");
		}
		}
	%>
    	</form>
</body>
</html>
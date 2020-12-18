<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.User_Indivi"%>
<%@ page import="model.User_Comp"%>
<%@ page import="dao.PostDao"%>
<%@ page import="dao.UserDao_Indivi"%>
<%@ page import="dao.UserDao_Comp"%>
<%@ page import="dao.TradeDao"%>
<%@ page import="java.sql.*"%>
<%@ page import="jdbc.util.JdbcUtil"%>
<%@ page import="jdbc.connection.ConnectionProvider"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="design.css" rel="stylesheet" type="text/css">
<style>
.button {
	border: 1px solid #0a3c59;
	background: #3e779d;
	background: -webkit-gradient(linear, left top, left bottom, from(#65a9d7), to(#3e779d));
	background: -webkit-linear-gradient(top, #65a9d7, #3e779d);
	background: -moz-linear-gradient(top, #65a9d7, #3e779d);
	background: -ms-linear-gradient(top, #65a9d7, #3e779d);
	background: -o-linear-gradient(top, #65a9d7, #3e779d);
	background-image: -ms-linear-gradient(top, #65a9d7 0%, #3e779d 100%);
	padding: 6px 12px;
	-webkit-border-radius: 6px;
	-moz-border-radius: 6px;
	border-radius: 6px;
	-webkit-box-shadow: rgba(255,255,255,0.4) 0 1px 0, inset rgba(255,255,255,0.4) 0 1px 0;
	-moz-box-shadow: rgba(255,255,255,0.4) 0 1px 0, inset rgba(255,255,255,0.4) 0 1px 0;
	box-shadow: rgba(255,255,255,0.4) 0 1px 0, inset rgba(255,255,255,0.4) 0 1px 0;
	text-shadow: #7ea4bd 0 1px 0;
	color: #6633CC;
	font-size: 15px;
	font-family: helvetica, serif;
	text-decoration: none;
	vertical-align: middle;
   }
.button:hover {
   border: 1px solid #0a3c59;
   text-shadow: #1e4158 0 1px 0;
   background: #3e779d;
   background: -webkit-gradient(linear, left top, left bottom, from(#65a9d7), to(#3e779d));
   background: -webkit-linear-gradient(top, #65a9d7, #3e779d);
   background: -moz-linear-gradient(top, #65a9d7, #3e779d);
   background: -ms-linear-gradient(top, #65a9d7, #3e779d);
   background: -o-linear-gradient(top, #65a9d7, #3e779d);
   background-image: -ms-linear-gradient(top, #65a9d7 0%, #3e779d 100%);
   color: #ffffff;
   }
.button:active {
   text-shadow: #1e4158 0 1px 0;
   border: 1px solid #0a3c59;
   background: #65a9d7;
   background: -webkit-gradient(linear, left top, left bottom, from(#3e779d), to(#3e779d));
   background: -webkit-linear-gradient(top, #3e779d, #65a9d7);
   background: -moz-linear-gradient(top, #3e779d, #65a9d7);
   background: -ms-linear-gradient(top, #3e779d, #65a9d7);
   background: -o-linear-gradient(top, #3e779d, #65a9d7);
   background-image: -ms-linear-gradient(top, #3e779d 0%, #65a9d7 100%);
   color: #fff;
   }
</style>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String id = (String) session.getAttribute("USERID");
		String category = (String) session.getAttribute("USERCATEGORY");

		User_Indivi user1 = new User_Indivi();
		User_Comp user2 = new User_Comp();

		Connection conn = ConnectionProvider.getConnection();

		String name = "";
		int pCount = 0;
		int tCount = 0;
	
		try {
			TradeDao tradeDao = new TradeDao();
			tCount = tradeDao.selectCount2(conn, id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		try {
			PostDao postDao = new PostDao();
			pCount = postDao.selectCount2(conn, id);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		if (category.equals("comp")) {
			try {
				UserDao_Comp userDao2 = new UserDao_Comp();
				user2 = userDao2.select(conn, id);
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				JdbcUtil.close(conn);
			}
			name = user2.getUserName();
		} else {
			try {
				UserDao_Indivi userDao1 = new UserDao_Indivi();
				user1 = userDao1.select(conn, id);
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				JdbcUtil.close(conn);
			}
			name = user1.getUserName();
		}
	%>

	<div id="login_form">
		<div id="login_sub_form">
			<form action="logout.jsp" method="post">
				<table height="60" width="100%" border="0" bgcolor="#99CCFF" cellpadding="7">
					<tr>
						<td width="57%"><strong id="user_name"><%=name%></strong>님<br>환영합니다.</td>
						<td width="43%"><a href='logout.jsp' class='button'>로그아웃</a></td>
					</tr>
                    </table>
                    <table height="145" width="100%" border="0" bgcolor="#99CCFF" cellpadding="7">
					<tr>
						<td width="163" rowspan="2">게시글 수</td>
						
					</tr>
					<tr>
						<td width="73"><a href="board_viewer.jsp?id=<%=id %>" target="_block"><%=pCount %></a>개</td>
					</tr>
					<tr>
						<td width="163" rowspan="2">진행중인 거래</td>
						
					</tr>
					<tr>
						<td width="73"><a href="trade_viewer.jsp?id=<%=id %>"  target="_block"><%=tCount%></a>건</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>
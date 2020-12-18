<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="dao.TradeDao"%>
<%@ page import="model.Trade"%>
<%@ page import="model.TradeListView"%>
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
		TradeDao tradeDao = new TradeDao();
		TradeListView tradeList = tradeDao.getTradeListM(conn, pageNumber, id);

		if (tradeList == null) {
	%>
	등록된 메시지가 없습니다.
	<%
		} else {
	%>
	<table width="980" border="1">
		<tr>
			<th width="30" scope="col">판매자</th>
			<th width="60" scope="col">구매자</th>
			<th width="80" scope="col">상품</th>
			<th width="150" scope="col">등록일</th>
		</tr>

		<%
			for (Trade trade : tradeList.getMessageList()) {
		%>
		<tr>
			<td align="center"><%=trade.getSeller()%></td>
			<td align="center"><%=trade.getBuyer()%></td>
			<td><%=trade.getItem()%></td>
			<td align="center"><%=trade.getTradeDate()%></td>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.TradeDao"%>
<%@ page import="model.Trade"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="jdbc.util.JdbcUtil"%>
<%@ page import="jdbc.connection.ConnectionProvider"%>
<%@ page import="java.net.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String num = (String)session.getAttribute("NUM");
		String seller = (String)session.getAttribute("MAKER");
		String buyer = (String)session.getAttribute("USERID");
		String item = (String)session.getAttribute("ITEM");
		int price = (int)session.getAttribute("PRICE");
		String sc = (String)session.getAttribute("SC");
		
		Trade trade1 = new Trade();
		Trade trade2 = new Trade();
		Connection conn = ConnectionProvider.getConnection();		
		
		try{
			TradeDao tradeDao = new TradeDao();
			trade1 = tradeDao.select(conn, num);
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		if(trade1 == null){
		
		trade2.setpNo(num);
		trade2.setSeller(seller);
		trade2.setBuyer(buyer);
		trade2.setItem(item);
		trade2.setPrice(price);
		trade2.setTradeDate(new Date());
			
		try{
			TradeDao tradeDao = new TradeDao();
			tradeDao.insert(conn, trade2);
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JdbcUtil.close(conn);
		}
	%>
	<script>
		alert("해당 상품에 대한 거래를 진행합니다.");
		history.go(-1);
	</script>
	<%
		}else{
	%>
	<script>
		alert("해당 상품에 대한 거래는 이미 진행 중입니다..");
		history.go(-1);
	</script>
	<%
		}
	%>
</body>
</html>
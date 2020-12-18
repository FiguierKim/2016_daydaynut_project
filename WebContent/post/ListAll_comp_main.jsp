<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="utf-8"%>
<%@ page import="dao.PostDao"%>
<%@ page import="model.Post"%>
<%@ page import="model.PostListView"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="jdbc.util.JdbcUtil"%>
<%@ page import="jdbc.connection.ConnectionProvider"%>
<%@ page import="java.net.URLEncoder" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style type="text/css">
@charset "euc-kr";
#table_wrap {
	width: 310px;
	height: 150px;
}

th {
	color: #fff;
	border-right-style: none;
	border-right-color: #fff;
	border-top-width: 2px;
	border-bottom-width: 3px;
	border-top-style: none;
	border-bottom-style: solid;
	border-top-color: #FFF;
	border-bottom-color: #FF6;
	background-color: #ABC668;
	padding: 0px;
	margin: 0px;
	font-size: 15px;
}
td {
	border-right-width: 0px;
	border-left-width: 0px;
	border-top-width: 0px;
	border-bottom-width: 1px;
	border-top-color: #000;
	border-bottom-color: #999;
	height: auto;
	border-bottom-style: dashed;
	border-right-style: none;
	border-left-style: none;
	padding: 0px;
	margin: 0px;
	font-size: 13px;
}
</style>
</head>
<body>
	<%
	    
		String pageNumberStr = request.getParameter("page");
		String saleCategory = "기업";//request.getParameter("saleCategory"); //페이지 로드시 해당 파라미터값 전달 기업 or 개인
		int pageNumber = 1;
		if (pageNumberStr != null) {
			pageNumber = Integer.parseInt(pageNumberStr);
		}
		Connection conn = ConnectionProvider.getConnection();
		PostDao postDao = new PostDao();
		PostListView postList = postDao.getPostList(conn, pageNumber, saleCategory);
		
		
	%>
<div>
<table width="330"  border="0"  cellspacing="0">
  <tr >
    <th>&nbsp;&nbsp;&nbsp;기업 게시판</th>
    <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
     <th align="right"><a href="../board_comp.jsp" target="_parent">더보기</a></th>
    </tr>
</table>
</div>
<div style="width:100%; height:130;">
<div id="table_wrap">
<table width="310"  border="0" height="150" cellspacing="0">
			<%
				for(Post post : postList.getMessageList()){
			%>
			<tr> 
			  <td align="center" width="23%"><%=post.getItemName()%></td>
			  <td width="77%">&nbsp;&nbsp;&nbsp;<%=post.getTitle()%></td>
			</tr>

			<%}%>
</table>
</div>
		<!-- 만족하는 결과가 없을 때 -->
		<%if(postList.getPageTotalCount()==0){%>
		<center>해당 상품이 없습니다.</center>
		<%}%>
</div>
</body>
	</html>


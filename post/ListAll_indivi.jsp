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
<link href="postDesign.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
</script>
</head>
<body onLoad="MM_preloadImages('image/전체.png','image/전자제품.png','image/스포츠.png','image/의류패션.png','image/도서.png','image/가구.png','image/기타.png')">
	<%
		String id = request.getParameter("id");
		String pageNumberStr = request.getParameter("page");
		String saleCategory = "개인";//request.getParameter("saleCategory"); //페이지 로드시 해당 파라미터값 전달 기업 or 개인
		int pageNumber = 1;
		
		if(id==null){
		if (pageNumberStr != null) {
			pageNumber = Integer.parseInt(pageNumberStr);
		}
		Connection conn = ConnectionProvider.getConnection();
		PostDao postDao = new PostDao();
		PostListView postList = postDao.getPostList(conn, pageNumber, saleCategory);
		
		
	%>

	  <%
	if (postList==null){
		%>
		등록된 메시지가 없습니다.
		<%
			}else{
		%>
<div id="table_wrap">

</div>


<table width="980" border="0"  cellspacing="0">
  <tr>
    <th width="10%" scope="col">번호</th>
    <th width="15%" scope="col">분류</th>
    <th width="15%" scope="col">작성자</th>
    <th width="40%" scope="col">제목</th>
    <th width="20%" scope="col">등록일</th>
  </tr>

			<%
				for(Post post : postList.getMessageList()){
			%>
			<tr>
				<td align="center"><%=post.getPostId() %></td>
				<td align="center"><%=post.getItemCategory() %></td>
				<td align="center"><%=post.getMaker() %></td>
				<td>
				<a href="detailView.jsp?postId=<%=post.getPostId()%>"><%=post.getTitle()%></a>
				</td>
				<td align="center"><%=post.getMakeDate() %></td>
			</tr>

			<%}%>
</table>


		<%}%>
		
 <table width="980" border="0" cellspacing="0">
    <tr>
    <td width=30%>
        <%
			for(int i=1;i<postList.getPageTotalCount();i++) {
		%>
		<a href="ListAll_indivi.jsp?page=<%=i%>">[<%=i%>]</a>
		<%}}else{%>
		<script>
		location.href("detailView.jsp?bid=<%=id%>");
		</script>
		<%} %>
    </td>
    <td align="center" WIDTH="30%">
    <form action="search_indivi.jsp" method="post" accept-charset="utf-8">
    <select name="select">
      <option value="title">제목</option>
      <option value="content">내용</option>
      <option value="itemName">상품명</option>
      <option value="all">전체</option>
    </select>
	<input type="text" size="20" maxlength="30" name="keyword" />
	<input type="submit" value="검색" />
    </form>
    </td>
    <td align="right" WIDTH="30%"><a href="PostForm_indivi.jsp">&nbsp;&nbsp;</a></td>
  </tr>
</table>
</div>
</body>
	</html>


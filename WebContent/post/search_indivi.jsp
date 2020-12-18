<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="utf-8"%>
<%@ page import="dao.SearchDao"%>
<%@ page import="dao.SearchAllDao"%>
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
	    request.setCharacterEncoding("utf-8");
		String login = (String)session.getAttribute("USERID"); //로그인 세션 (아이디)
		String pageNumberStr = request.getParameter("page");
		String selectbox = request.getParameter("select");
		String keyword = request.getParameter("keyword");
		String saleCategory = "개인";//request.getParameter("saleCategory"); //페이지 로드시 해당 파라미터값 전달 기업 or 개인
		int pageNumber = 1;
		if (pageNumberStr != null) {
			pageNumber = Integer.parseInt(pageNumberStr);
		}
		Connection conn = ConnectionProvider.getConnection();
		PostListView postList = new PostListView();
		if(selectbox.equals("all")){  //전체 범주에서 검색시 SearchAllDao 실행
		SearchAllDao sad = new SearchAllDao();	
		postList = sad.getSearchList(conn, pageNumber, saleCategory, keyword);
		}else{                        //나머지 해당 범주에서 검색시 SearchDao 실행
		SearchDao sd = new SearchDao();
		postList = sd.getSearchList(conn, pageNumber, saleCategory, selectbox, keyword);
		}
		
	%>

	 
<div id="table_wrap">
<div id="category_box">
	<%
	if(login!=null){  //로그인 상태가 아니면 카테고리 클릭시 뷰페이지로
	%>
  <div class="category"><a href="ListAll_indivi.jsp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','image/전체.png',1)"><img src="image/all.png" width="80" height="50" id="Image1"></a></div>
  <div class="category"><a href="List_indivi.jsp?itemCategory=<%=URLEncoder.encode("전자제품", "utf-8")%>" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image2','','image/전자제품.png',2)"><img src="image/elect.png" width="80" height="50" id="Image2"></a></div>
  <div class="category"><a href="List_indivi.jsp?itemCategory=<%=URLEncoder.encode("스포츠", "utf-8")%>" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3','','image/스포츠.png',3)"><img src="image/sports.png" width="80" height="50" id="Image3"></a></div>
  <div class="category"><a href="List_indivi.jsp?itemCategory=<%=URLEncoder.encode("의류패션", "utf-8")%>" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image4','','image/의류패션.png',4)"><img src="image/fashion.png" width="80" height="50" id="Image4"></a></div>
  <div class="category"><a href="List_indivi.jsp?itemCategory=<%=URLEncoder.encode("도서", "utf-8")%>" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image5','','image/도서.png',5)"><img src="image/book.png" width="80" height="50" id="Image5"></a></div>
  <div class="category"><a href="List_indivi.jsp?itemCategory=<%=URLEncoder.encode("가구", "utf-8")%>" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image6','','image/가구.png',6)"><img src="image/furniture.png" width="80" height="50" id="Image6"></a></div>
  <div class="category"><a href="List_indivi.jsp?itemCategory=<%=URLEncoder.encode("기타", "utf-8")%>" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image7','','image/기타.png',7)"><img src="image/etc.png" width="80" height="50" id="Image7"></a></div>
	<%}else{ %>
  <div class="category"><a href="ListAll_indivi_view.jsp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','image/전체.png',1)"><img src="image/all.png" width="80" height="50" id="Image1"></a></div>
  <div class="category"><a href="List_indivi_view.jsp?itemCategory=<%=URLEncoder.encode("전자제품", "utf-8")%>" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image2','','image/전자제품.png',2)"><img src="image/elect.png" width="80" height="50" id="Image2"></a></div>
  <div class="category"><a href="List_indivi_view.jsp?itemCategory=<%=URLEncoder.encode("스포츠", "utf-8")%>" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3','','image/스포츠.png',3)"><img src="image/sports.png" width="80" height="50" id="Image3"></a></div>
  <div class="category"><a href="List_indivi_view.jsp?itemCategory=<%=URLEncoder.encode("의류패션", "utf-8")%>" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image4','','image/의류패션.png',4)"><img src="image/fashion.png" width="80" height="50" id="Image4"></a></div>
  <div class="category"><a href="List_indivi_view.jsp?itemCategory=<%=URLEncoder.encode("도서", "utf-8")%>" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image5','','image/도서.png',5)"><img src="image/book.png" width="80" height="50" id="Image5"></a></div>
  <div class="category"><a href="List_indivi_view.jsp?itemCategory=<%=URLEncoder.encode("가구", "utf-8")%>" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image6','','image/가구.png',6)"><img src="image/furniture.png" width="80" height="50" id="Image6"></a></div>
  <div class="category"><a href="List_indivi_view.jsp?itemCategory=<%=URLEncoder.encode("기타", "utf-8")%>" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image7','','image/기타.png',7)"><img src="image/etc.png" width="80" height="50" id="Image7"></a></div>
	<%}%>
  <div id="salecategory"><img src="image/개인게시판.png" width="150" height="55"></div>
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
				<%
				if(login!=null){  //로그인 상태가 아니면 게시판 보기만 가능.(상세보기 못함)
				%>
				<a href="detailView.jsp?postId=<%=post.getPostId()%>"><%=post.getTitle()%></a>
				<%}else{ %>
				<%=post.getTitle()%>
				<%}%>
				</td>
				<td align="center"><%=post.getMakeDate() %></td>
			</tr>

			<%}%>
</table>
		<!-- 만족하는 결과가 없을 때 -->
		<%if(postList.getPageTotalCount()==0){%>
		<center>해당 상품이 없습니다.</center>
		<%}%>
		
 <table width="980" border="0" cellspacing="0">
    <tr>
    <td width=30%>
        <%
			for(int i=1;i<postList.getPageTotalCount();i++) {
		%>
		<a href="search_indivi.jsp?page=<%=i%>&select=<%=selectbox%>&keyword=<%=URLEncoder.encode(keyword, "utf-8")%>">[<%=i%>]</a>
		<%}%>
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
    <td align="right" WIDTH="30%">
    <%
    if(login!=null){  //로그인 상태가 아니면 게시판 보기만 가능.(글쓰기 링크 없음)
	%>
	<a href="PostForm_comp.jsp">글쓰기&nbsp;&nbsp;</a>
	<%}else{}%>
    </td>
  </tr>
</table>
</div>
</body>
	</html>


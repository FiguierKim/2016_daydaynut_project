<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<style type="text/css">
a {
	text-decoration: none
}

table {
	border: 3px solid #ABC668;
}

td {
	border-bottom-width: 3px;
	border-bottom-style: none;
	border-bottom-color: #ABC668;
}

body table tr td {
	border-bottom-width: 3px;
	border-bottom-style: none;
}
</style>
<script type="text/javascript">
	function buy() {
		if (confirm("해당 상품에 대한 거래를 진행하시겠습니까?") == true) { //확인
			location.href("buy.jsp");
		} else { //취소
			return;
		}
	}
</script>

</head>
<body>

	<%
		//postId 값을 기준으로 해당 DB를 모두 불러옴. 그 후 이미지파일의 이름으로 해당 이미지 출력
		String postId = request.getParameter("postId"); //게시판에서 title 누르면 해당 게시글의 postId 값 넘겨줌
		String bid = request.getParameter("bid");
		String mainId ="";
		
		if(postId == null){
			mainId = bid;
		}else{
			mainId = postId;
		}
		
		Connection conn = ConnectionProvider.getConnection();
		Post post = new Post();
		PostDao postDao;
		try {
			postDao = new PostDao();
			post = postDao.select(conn, mainId);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
		}
	%>

	<table width="800" border="1" cellspacing="0" cellpadding="5"
		align="center">
		<tr>
			<td>&nbsp;&nbsp;제&nbsp;&nbsp;&nbsp;&nbsp;목 : <%=post.getTitle()%></td>
		</tr>
		<tr>
			<td>&nbsp;&nbsp;분&nbsp;&nbsp;&nbsp;&nbsp;류 : <%=post.getItemCategory()%></td>
		</tr>
		<tr>
			<td>&nbsp;&nbsp;작성자 : <%=post.getMaker()%></td>
		</tr>
		<tr>
			<td>&nbsp;&nbsp;물품명 : <%=post.getItemName()%> &nbsp;&nbsp;가격 : <%=post.getPrice()%>원
			</td>
		</tr>
		<tr>
			<td>&nbsp;&nbsp;등록일 : <%=post.getMakeDate()%></td>
		</tr>
	</table>
	<table width="800" border="0" cellspacing="0" cellpadding="5"
		align="center">
		<tr>
			<td align="center">
				<div style="width: 100%; height: 470px; overflow: auto">
					<!-- 내용 스크롤링 -->
					<!-- db에서 불러온 텍스트를 줄바꿈해주기 위해 replasceAll -->
					<%=post.getContent().replaceAll("\r\n", "<br>")%><br>
					<%
						if (post.getImageFile() != null) {
					%>
					<!--상대경로! 자신의 위치에서 경로 찾음!-->
					<img src="imageFile/<%=post.getImageFile()%>" width=600></img>
					<%

						}
					%>

				</div>
			</td>
		</tr>
	</table>
	<table width="800" cellpadding="3" align="center">
		<tr align="right">
			<td>
				<%
					String id = (String) session.getAttribute("USERID"); //세션 짱짱맨!!
					session.setAttribute("NUM", mainId);
					session.setAttribute("MAKER", post.getMaker());
					session.setAttribute("ITEM", post.getItemName());
					session.setAttribute("PRICE", post.getPrice());
					session.setAttribute("SC", post.getSaleCategory());
					
					if (id.equals(post.getMaker())) { //현재 로그인 아이디와 게사자 아이디 비교 -> 같으면 삭제버튼 생김
				%> <a
				href="updateForm.jsp?postId=<%=postId%>&saleCategory=<%=post.getSaleCategory() %>">[수정]</a>
				&nbsp;&nbsp; <a
				href="delete.jsp?postId=<%=postId%>&saleCategory=<%=post.getSaleCategory()%>">[삭제]</a>
				<%
					} else {
				%> <a href="#" onClick="buy()">[구매]</a> <%
 	}
 %> &nbsp;&nbsp; <a
				href="javascript:history.back(-1)">뒤로가기</a>
			</td>
		</tr>
	</table>
</body>
</html>
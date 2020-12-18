<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.sql.*"%>
<%@ page import="jdbc.util.JdbcUtil"%>
<%@ page import="model.Post"%>
<%@ page import="dao.PostDao"%>
<%@ page import="jdbc.connection.ConnectionProvider"%>
<%@ page import="java.io.File"%>
<%@ page
	import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		request.setCharacterEncoding("utf-8");
		 //이미지 업로드
		 String saleCategory=""; //자바스크립트로 넘기기위한 변수
		 String realFolder = "";
		 String filename1 = "";
		 int maxSize = 1024*1024*5;
		 String encType = "utf-8";
		 String savefile = "post\\imageFile";
		 ServletContext scontext = getServletContext();
		 realFolder = "C:\\eclipse-jee-luna-SR1-win32\\eclipse\\PJ\\projectt\\WebContent\\"+savefile; //실제 경로
		 
		 try{
		  MultipartRequest multi=new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
		   Enumeration<?> files = multi.getFileNames();
		     String file1 = (String)files.nextElement();
		     filename1 = multi.getFilesystemName(file1);
		     String fullpath = realFolder + filename1;
		     
		     //DB업로드.  mutipartRequest는 request로 파라미터 못받음. muti.getParameter로 받아줘야한다. usebean도 사용 불가.
		     Post post = new Post();
		     saleCategory = multi.getParameter("saleCategory");
		 	 post.setPostId(Integer.parseInt(multi.getParameter("postId")));
		     post.setSaleCategory(saleCategory);
		     post.setItemCategory(multi.getParameter("itemCategory"));
		     post.setMaker(multi.getParameter("maker"));
		     post.setPassword(multi.getParameter("password"));
		     post.setTitle(multi.getParameter("title"));
		     post.setItemName(multi.getParameter("itemName"));
		     post.setPrice(Integer.parseInt(multi.getParameter("price"))); //정수형 파싱
		     post.setTradeWay(multi.getParameter("tradeWay"));
		     post.setPhone(multi.getParameter("phone"));
		     post.setContent(multi.getParameter("content"));
		     post.setImageFile(filename1);
		     post.setMakeDate(new Date());   
		     
		     
		     Connection conn = ConnectionProvider.getConnection();
		     
		     try {
			 		PostDao postdao = new PostDao();
			 		postdao.update(conn, post);
			 	} catch (SQLException e) {
			 		e.printStackTrace();
			 	} finally {
			 		JdbcUtil.close(conn);
			 	}
		 	
		 } catch(Exception e) {
		  e.printStackTrace();
		 }
	%>

	<script type="text/javascript">
	self.window.alert("수정되었습니다!");
	var sc = "<%=saleCategory%>";
		if (sc == "개인") {
			location.href = "ListAll_indivi.jsp";
		} else {
			location.href = "ListAll_comp.jsp";
		}
	</script>

</body>
</html>
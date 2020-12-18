<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title></title>
		<style></style>
		<script type="text/javascript"></script>
	</head>

	<body>
	
<%
	// String saveDir = application.getRealPath("images");
    String saveDir = "C:\\eclipse\\ws\\test\\WebContent\\images";
	int maxSize = 1024*1024*100;
	String encType = "UTF-8";

	MultipartRequest multipartRequest
	= new MultipartRequest(request, saveDir, maxSize, encType, new DefaultFileRenamePolicy());
	
    out.write("이름 : " + multipartRequest.getParameter("name") + "<br>");
    out.write("파일 : " + multipartRequest.getParameter("file") + "<br>"); //null 값을 갖는다.
    out.write("업로드파일명 : " + multipartRequest.getFilesystemName("file") + "<br>");
    out.write("원래파일명 : " + multipartRequest.getOriginalFileName("file") + "<br>");
    
    File file = multipartRequest.getFile("file");
%>


	</body>
</html>
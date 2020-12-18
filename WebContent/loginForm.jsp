<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="design.css" rel="stylesheet" type="text/css">
<script>
	function sid(){
		window.open("id_select.jsp","","height = 450, width = 520, resizable=no, location=no, resizable=no");
	}
	
	function spass(){
		window.open("pass_select.jsp","","height = 450, width = 520, resizable=no, location=no, resizable=no");
	}
</script>
</head>
<body>
	<div id="login_form">
		<div id="login_sub_form">
			<center><h2><font color="#FFFFFF">회원 로그인</font></h2></center>
																											<!--  아래 부분은 로그인 폼  -->
			<form action="loginCheck.jsp" method="post">
				<div id="insert_form">
					<input type="text" name="userid" id="idfield" /><br />
					<input type="password" name="userpw" id="pwfield" />
				</div>
				<div id="user_login">
					<input type="image" src="Images/new/login_btn.png" id="login_btn" />
				</div>
			</form>
            <p></p>
			<p align="center">
				<a href="#" onClick="sid()">ID 찾기</a> / <a href="#" onClick="spass()">비밀번호 찾기</a>
			</p>
			<div id="user_create">
				<a href="terms.jsp"><img
					src="Images/new/user_insert.png" width="250" height="50"
					alt="회원가입" /></a>
			</div>
		</div>
	</div>
</body>
</html>
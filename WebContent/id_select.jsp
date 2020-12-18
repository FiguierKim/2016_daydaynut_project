<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<style type="text/css">
		#form{
	width: 500px;
	height: 400px;
	background-image: url(Images/back.png);
	background-repeat: no-repeat;
		}
		
		#form2{
	width: 450px;
	height: 300px;
	margin-left: auto;
	margin-right: auto;
	padding-top: 20px;
		}
	</style>
</head>
<body>
	<div id="form">
    <div id="form2">
	<h2>아이디 찾기</h2>
	<form action="searchId.jsp" method="post">
		<h3>개인 아이디</h3>
		<table width="440">
			<tr>
				<th>이름</th>
				<td><input type="text" name="userName" id="userName"></td>
			</tr>
			<tr>
				<th>주민등록번호</th>
				<td><input type="text" name="userNum1" id="userNum1">-<input
					type="password" name="userNum2" id="userNum2"></td>
			</tr>
			<tr>
				<th colspan="2"><input type="submit" value="조회"></th>
			</tr>
		</table>
	</form>
		<form action="searchId2.jsp" method="post">
		<h3>기업 아이디</h3>
		<table width="440">
			<tr>
				<th width="70">이름</th>
				<td width="249"><input type="text" name="userName" id="userName"></td>
			</tr>
			<tr>
				<th>사업자번호</th>
				<td><input type="text" name="cNum" id="cNum"></td>
			</tr>
			<tr>
				<th colspan="2"><input type="submit" value="조회"></th>
			</tr>
		</table>
	</form>
    </div>
	</div>
</body>
</html>
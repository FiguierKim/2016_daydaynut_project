<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="dao.UserDao" %>
<%@ page import="jdbc.connection.ConnectionProvider" %>
<%@ page import="jdbc.loader.DBCPInit" %>
<%@ page import="jdbc.util.JdbcUtil" %>
<%@ page import="model.User" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원가입</h2>
	<form action="InsertUser.jsp" method="post">
		<table border="1">
			<tr>
				<td colspan="2">아이디</td>
				<td>
					<input type="text" name="userId" id="userId">
					
					
				</td>
			</tr>
			<tr>
				<td colspan="2">비밀번호</td>
				<td><input type="password" name="pwd" id="pwd"></td>
			</tr>
			<tr>
				<td colspan="2">비밀번호 확인</td>
				<td><input type="password" name="pwdChk" id="pwdChk"></td>
			</tr>
			<tr>
				<td colspan="2">사용자 이름</td>
				<td>
				<select name="categori">
					<option>선 택</option>
					<option value="개인">개인</option>
					<option value="기업">기업</option>
				</select>
				&nbsp;
				<input type="text" name="userName" id="userName"></td>
			</tr>
			<tr>
				<td colspan="2">주민등록번호</td>
				<td><input type="text" name="userFirstNum" id="userFirstNum">
					- <input type="password" name="userSecondNum" id="userSecondNum">
				</td>
			</tr>
            <tr>
            <td colspan="2">e-mail
            </td>
            <td>
            <input type="text" name="email1" id="email" >
            @
            <select name="email2" id="email2">
            	<option value="">선택해주세요.</option>
            	<option value="naver.com">naver.com</option>
                <option value="hanmail.net">hanmail.net</option>
                <option value="gmail.com">gmail.com</option>
            </select>
            </td>
            </tr>
			<tr>
				<td colspan="2">주소</td>
				<td><input type="text" name="mainAddress" id="mainAddress" size="25"><br>
				<input type="text" name="subAddress" id="subAddress" size="55">
				</td>
			</tr>
			<tr>
				<td rowspan="2">전화 번호</td>
				<td>집</td>
				<td>
				<select name="tel1">
					<option>선 택</option>
					<option value="02">02)</option>
					<option value="031">031)</option>
					<option value="032">032)</option>
					<option value="033">033)</option>
					<option value="041">041)</option>
					<option value="042">042)</option>
					<option value="043">043)</option>
					<option value="044">044)</option>
					<option value="051">051)</option>
					<option value="052">052)</option>
					<option value="053">053)</option>
					<option value="054">054)</option>
					<option value="055">055)</option>
					<option value="061">061)</option>
					<option value="062">062)</option>
					<option value="063">063)</option>
					<option value="063">064)</option>
				</select>
				&nbsp;
				<input type="text" name="tel2" maxlength="4" size="3">
				- <input type="text" name="tel3" maxlength="4" size="3">
				</td>
			</tr>
			<tr>
			<td>모바일</td>
				<td>
				통신사
				<select name="telecom">
					<option>선 택</option>
					<option value="SKT">SKT</option>
					<option value="KT">KT</option>
					<option value="LGU+">LGU+</option>
				</select>
				&nbsp;
				<select name="mobile1">
					<option>선 택</option>
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="018">018</option>
					<option value="019">019</option>
				</select>
				- <input type="text" name="mobile2" maxlength="4" size="3">
				- <input type="text" name="mobile3" maxlength="4" size="3">
				</td>
			</tr>
			<tr>
				<td colspan="3"  align="center"><input type="submit" value="전송"></td>
			</tr>
		</table>
	</form>
</body>
</html>
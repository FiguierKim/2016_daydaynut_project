<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.User_Comp"%>
<%@ page import="dao.UserDao_Comp"%>
<%@ page import="model.User_Indivi"%>
<%@ page import="dao.UserDao_Indivi"%>
<%@ page import="java.sql.*"%>
<%@ page import="jdbc.util.JdbcUtil"%>
<%@ page import="jdbc.connection.ConnectionProvider"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Connection conn = ConnectionProvider.getConnection();
		String userId = request.getParameter("userid"); // 아이디 체크를 위한 파라미터 받아오기
		String password = request.getParameter("userpw"); // 패스워드 체크를 위한 파라미터 받아오기

		try {
			UserDao_Indivi userDao1 = new UserDao_Indivi(); // Dao 생성
			User_Indivi user1 = userDao1.select(conn, userId); // user 모델 변수 생성(userId의 값과 동일한 튜플을 찾는 쿼리 실행 : select)
			UserDao_Comp userDao2 = new UserDao_Comp(); // Dao 생성
			User_Comp user2 = userDao2.select(conn, userId);

			if (user1 == null) { // 검색 결과가 없는 경우
				if (user2 == null) {
	%>
	<script type="text/javascript">
		alert("아이디를 확인하여 주시기 바랍니다.");
		history.go(-1); // 경고창 띄우기 & 이전 페이지로 돌아가기
	</script>
	<%
		} else if (user2.getPwd().equals(password) == false) {
	%>
	<script type="text/javascript">
		alert("비밀번호를 확인하여 주시기 바랍니다.");
		history.go(-1); // 경고창 띄우기 & 이전 페이지로 돌아가기
	</script>
	<%
		} else {
			session.setAttribute("USERID", userId);
			session.setAttribute("USERCATEGORY", "comp");
	%>
	<script type="text/javascript">
		location.href = "index.jsp"; // 해당하는 페이지로 이동
	</script>
	<%
		}
	%>
	<script type="text/javascript">
		alert("아이디를 확인하여 주시기 바랍니다.");
		history.go(-1); // 경고창 띄우기 & 이전 페이지로 돌아가기
	</script>
	<%
		} else if (user1.getPwd().equals(password) == false) { // 검색된 튜플이 있으나 튜플에 저장되어있는 비밀번호가 다른 경우
	%>
	<script type="text/javascript">
		alert("비밀번호를 확인하여 주시기 바랍니다.");
		history.go(-1); // 경고창 띄우기 & 이전 페이지로 돌아가기
	</script>
	<%
		} else { // 위의 조건을 모두 통과한 경우
				session.setAttribute("USERID", userId); // 해당하는 아이디의 세션 생성
				session.setAttribute("USERCATEGORY", "indibvi");
	%>
	<script type="text/javascript">
		location.href = "index.jsp"; // 해당하는 페이지로 이동
	</script>
	<%
		}
		} catch (SQLException e) {
			e.printStackTrace(); // 예외 처리
		} finally {
			JdbcUtil.close(conn); // Util(Connection, resultSet, statement) 종료
		}
	%>
</body>
</html>
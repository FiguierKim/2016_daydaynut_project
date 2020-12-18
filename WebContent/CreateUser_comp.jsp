<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="dao.UserDao_Indivi"%>
<%@ page import="jdbc.connection.ConnectionProvider"%>
<%@ page import="jdbc.loader.DBCPInit"%>
<%@ page import="jdbc.util.JdbcUtil"%>
<%@ page import="model.User_Indivi"%>
<%@ page import="java.net.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="design.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function MM_swapImgRestore() { //v3.0
		var i, x, a = document.MM_sr;
		for (i = 0; a && i < a.length && (x = a[i]) && x.oSrc; i++)
			x.src = x.oSrc;
	}
	function MM_preloadImages() { //v3.0
		var d = document;
		if (d.images) {
			if (!d.MM_p)
				d.MM_p = new Array();
			var i, j = d.MM_p.length, a = MM_preloadImages.arguments;
			for (i = 0; i < a.length; i++)
				if (a[i].indexOf("#") != 0) {
					d.MM_p[j] = new Image;
					d.MM_p[j++].src = a[i];
				}
		}
	}

	function MM_findObj(n, d) { //v4.01
		var p, i, x;
		if (!d)
			d = document;
		if ((p = n.indexOf("?")) > 0 && parent.frames.length) {
			d = parent.frames[n.substring(p + 1)].document;
			n = n.substring(0, p);
		}
		if (!(x = d[n]) && d.all)
			x = d.all[n];
		for (i = 0; !x && i < d.forms.length; i++)
			x = d.forms[i][n];
		for (i = 0; !x && d.layers && i < d.layers.length; i++)
			x = MM_findObj(n, d.layers[i].document);
		if (!x && d.getElementById)
			x = d.getElementById(n);
		return x;
	}

	function MM_swapImage() { //v3.0
		var i, j = 0, x, a = MM_swapImage.arguments;
		document.MM_sr = new Array;
		for (i = 0; i < (a.length - 2); i += 3)
			if ((x = MM_findObj(a[i])) != null) {
				document.MM_sr[j++] = x;
				if (!x.oSrc)
					x.oSrc = x.src;
				x.src = a[i + 2];
			}
	}

	function id_Check() {
		var id = document.insertUser.userId.value;
		var idCheck1 = document.insertUser.userId.value.length >= 7;
		var idCheck2 = document.insertUser.userId.value.length <= 12;
		var checkId = /^[a-zA-Z0-9]*$/;

		if (!id) {
			document.insertUser.idCheck.value = "아이디를 입력해주세요.";
		} else if (!idCheck1 || !idCheck2) {
			document.insertUser.idCheck.value = "아이디는 7자 이상 12자 이하여야 합니다.";
		} else if (!checkId.test(id)) {
			document.insertUser.idCheck.value = "아이디는 영어와 숫자 조합이여야 합니다.";
		} else {
			document.insertUser.idCheck.value = "";
		}
		return;
	}

	function pass_Check() {
		var pwd1 = document.insertUser.pwd.value;
		var pwd2 = document.insertUser.pwdChk.value;
		var pwdCheck1 = document.insertUser.pwd.value.length >= 7;
		var pwdCheck2 = document.insertUser.pwd.value.length <= 12;

		if (pwd1 != pwd2) {
			document.insertUser.pwdCheck.value = "비밀번호가 일치하지 않습니다.";
		} else if (!pwdCheck1 || !pwdCheck2) {
			document.insertUser.pwdCheck.value = "비밀번호는  7자 이상 12자 이하여야 합니다.";
		} else {
			document.insertUser.pwdCheck.value = "";
		}
		return;
	}

	function insert_Clear() {
		var userId = document.insertUser.userId.value;
		var id_Check1 = document.insertUser.userId.value.length >= 7;
		var id_Check2 = document.insertUser.userId.value.length <= 12;
		var check_Id = /^[a-zA-Z0-9]*$/;
		var pwd = document.insertUser.pwd.value;
		var userName = document.insertUser.userName.value;
		var companyNum = document.insertUser.companyNum.value;
		var companyOwner = document.insertUser.companyOwner.value;
		var companyName = document.insertUser.companyName.value;
		var mainAddress = document.insertUser.mainAddress.value;
		var subAddress = document.insertUser.subAddress.value;
		var tel1 = document.insertUser.tel1.selectedIndex;
		var tel2 = document.insertUser.tel2.value;
		var tel3 = document.insertUser.tel3.value;
		var fax1 = document.insertUser.fax1.selectedIndex;
		var fax2 = document.insertUser.fax2.value;
		var fax3 = document.insertUser.fax3.value;
		var telecom = document.insertUser.telecom.selectedIndex;
		var mobile1 = document.insertUser.mobile1.selectedIndex;
		var mobile2 = document.insertUser.mobile2.value;
		var mobile3 = document.insertUser.mobile3.value;
		var job = document.getElementsByName("categori_job");
		var product1 = document.insertUser.product1.value;

		if (!userId) {
			alert("아이디를 입력해주세요");
		} else if (!id_Check1 || !id_Check2) {
			alert("아이디는 7자 이상 12자 이하여야 합니다.");
		} else if (!check_Id.test(userId)) {
			alert("아이디는 영문과 숫자 조합이여야 합니다.");
		} else if (!pwd) {
			alert("비밀번호를 입력해주세요");
		} else if (!userName) {
			alert("사용자 이름을 입력해주세요");
		} else if (!companyNum) {
			alert("사업자 번호를 입력해주세요");
		} else if (!companyOwner) {
			alert("대표자 이름을 입력해주세요");
		} else if (!companyName) {
			alert("회사 이름을 입력해주세요");
		} else if (!mainAddress || !subAddress) {
			alert("주소를 입력해주세요");
		} else if (!tel1 || !tel2 || !tel3) {
			alert("전화번호를 입력해주세요");
		} else if (!fax1 || !fax2 || !fax3) {
			alert("팩스번호를 입력해주세요");
		} else if (!mobile1 || !mobile2 || !mobile3) {
			alert("휴대폰 번호를 입력해주세요");
		} else if (job.length == 0) {
			alert("회사 업종을 선택 해주세요");
		} else if (!product1) {
			alert("주요생산 품목을 입력해주세요");
		} else {
			document.insertUser.submit();
		}

	}

	function checkID(){
		var id = document.insertUser.userId.value;
		if(id.length<=6 || id.length>=13){
			alert("아이디를 정확히 입력해주세요");
		}else{
			var url = "Check_Id.jsp?id=" + id;
			window.open(url, "get","height = 240, width = 320, resizable=no, location=no, resizable=no");
		}
	}
</script>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<div id="header_logo">
				<a href="index.jsp"><img src="Images/new/logo.png"></a>
			</div>
			<div id="header_logo2"></div>
			<div id="header_menu">
				<div id="header_menu2">
					<ul>
						<li><a href="page_intro.jsp"
							onMouseOut="MM_swapImgRestore()"
							onMouseOver="MM_swapImage('Image1','','Images/new/header_menu_intro_r.png',1)"><img
								src="Images/new/header_menu_intro.png" width="150" height="75"
								id="Image1"></a></li>
						<li><a href="#" onMouseOut="MM_swapImgRestore()"
							onMouseOver="MM_swapImage('Image2','','Images/new/header_menu_board_r.png',1)"><img
								src="Images/new/header_menu_board.png" width="150" height="75"
								usemap="#Image2Map" id="Image2" border="0"> <map
									name="Image2Map">
									<area shape="rect" coords="2,47,70,72"
										href="board_comp.jsp">
									<area shape="rect" coords="82,47,148,72"
										href="board_indivi.jsp">
								</map> </a></li>
						<li><a href="help_center.jsp"
							onMouseOut="MM_swapImgRestore()"
							onMouseOver="MM_swapImage('Image3','','Images/new/header_menu_center_r.png',1)"><img
								src="Images/new/header_menu_center.png" width="150" height="75"
								id="Image3"></a></li>
					</ul>
				</div>
			</div>
		</div>
		<div id="header_after"></div>
		<div id="main_m2">
			<div id="left_menu">
				<div id="left_menu_process">
					<h1>회원 가입</h1>
					<img src="Images/insert_process_3.png" width="260" height="560">
				</div>
			</div>
			<%
				session.setAttribute("USER", "comp");
			%>
			<div id="forms">
				<h2>기업회원 정보 입력</h2>
				<form action="InsertUser.jsp" method="post" name="insertUser">
					<table id="table_form">
						<tr>
							<th colspan="2" align="center">아이디</th>
							<td width="484"><input type="text" name="userId" id="userId"
								onblur="id_Check()">&nbsp;<input type="button"
								value="중복확인" name="check" id="check" onclick="checkID()">&nbsp;
								<input type="text" name="idCheck" id="idCheck" size="30"
								style="border-width: 0px" readonly></td>
						</tr>
						<tr>
							<th colspan="2" align="center">비밀번호</th>
							<td><input type="password" name="pwd" id="pwd"></td>
						</tr>
						<tr>
							<th colspan="2" align="center">비밀번호 확인</th>
							<td><input type="password" name="pwdChk" id="pwdChk"
								onblur="pass_Check()">&nbsp;&nbsp; <input type="text"
								name="pwdCheck" id="pwdCheck" size="30"
								style="border-width: 0px" readonly></td>
						</tr>
						<tr>
							<th colspan="2" align="center">사용자 이름</th>
							<td><input type="text" name="userName" id="userName"></td>
						</tr>
						<tr>
							<th colspan="2" align="center">사업자번호</th>
							<td><input type="text" name="companyNum" id="companyNum">
							</td>
						</tr>
						<tr>
							<th colspan="2" align="center">대표자명</th>
							<td><input type="text" name="companyOwner" id="companyOwner">
							</td>
						</tr>
						<tr>
							<th colspan="2" align="center">회사명</th>
							<td><input type="text" name="companyName" id="companyName">
							</td>
						</tr>
						<tr>
							<th colspan="2" align="center">회사주소</th>
							<td><input type="text" name="mainAddress" id="mainAddress"
								size="25"><br> <input type="text" name="subAddress"
								id="subAddress" size="55"></td>
						</tr>
						<tr>
							<th colspan="2" align="center">e-mail</th>
							<td><input type="text" name="email1" id="email"> @ <select
								name="email2" id="email2">
									<option value="">선택해주세요.</option>
									<option value="naver.com">naver.com</option>
									<option value="hanmail.net">hanmail.net</option>
									<option value="gmail.com">gmail.com</option>
							</select></td>
						</tr>

						<tr>
							<th width="128" rowspan="3" align="center">전화 번호</th>
							<th width="42" align="center">집</th>
							<td><select name="tel1">
									<option>선 택</option>
									<option value="02)">02)</option>
									<option value="031)">031)</option>
									<option value="032)">032)</option>
									<option value="033)">033)</option>
									<option value="041)">041)</option>
									<option value="042)">042)</option>
									<option value="043)">043)</option>
									<option value="044)">044)</option>
									<option value="051)">051)</option>
									<option value="052)">052)</option>
									<option value="053)">053)</option>
									<option value="054)">054)</option>
									<option value="055)">055)</option>
									<option value="061)">061)</option>
									<option value="062)">062)</option>
									<option value="063)">063)</option>
									<option value="064)">064)</option>
							</select> &nbsp; <input type="text" name="tel2" maxlength="4" size="3">
								- <input type="text" name="tel3" maxlength="4" size="3">
							</td>
						</tr>
						<tr>
							<th width="42" align="center">FAX</th>
							<td><select name="fax1">
									<option>선 택</option>
									<option value="02)">02)</option>
									<option value="031)">031)</option>
									<option value="032)">032)</option>
									<option value="033)">033)</option>
									<option value="041)">041)</option>
									<option value="042)">042)</option>
									<option value="043)">043)</option>
									<option value="044)">044)</option>
									<option value="051)">051)</option>
									<option value="052)">052)</option>
									<option value="053)">053)</option>
									<option value="054)">054)</option>
									<option value="055)">055)</option>
									<option value="061)">061)</option>
									<option value="062)">062)</option>
									<option value="063)">063)</option>
									<option value="064)">064)</option>
							</select> &nbsp; <input type="text" name="fax2" maxlength="4" size="3">
								- <input type="text" name="fax3" maxlength="4" size="3">
							</td>
						</tr>
						<tr>
							<th align="center">모바일</th>
							<td>통신사 <select name="telecom">
									<option>선 택</option>
									<option value="SKT">SKT</option>
									<option value="KT">KT</option>
									<option value="LGU+">LGU+</option>
							</select> &nbsp; <select name="mobile1">
									<option>선 택</option>
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
							</select> - <input type="text" name="mobile2" maxlength="4" size="3">
								- <input type="text" name="mobile3" maxlength="4" size="3">
							</td>
						</tr>
						<tr>
							<th colspan="2" align="center">회사 업종</th>
							<td><input type="checkbox" name="categori_job"
								id="categori_job" value="기계금속">기계금속 <input
								type="checkbox" name="categori_job" id="categori_job"
								value="전기전자">전기전자 <input type="checkbox"
								name="categori_job" id="categori_job" value="정보통신">정보통신
								<input type="checkbox" name="categori_job" id="categori_job"
								value="화학화공">화학화공 <input type="checkbox"
								name="categori_job" id="categori_job" value="환경">환경<br>

								<input type="checkbox" name="categori_job" id="categori_job"
								value="생활용품">생활용품 <input type="checkbox"
								name="categori_job" id="categori_job" value="섬유">섬유 <input
								type="checkbox" name="categori_job" id="categori_job" value="요업">요업
								<input type="checkbox" name="categori_job" id="categori_job"
								value="토목건축">토목건축 <input type="checkbox"
								name="categori_job" id="categori_job" value="생명과학">생명과학</td>
						</tr>
						<tr>
							<th colspan="2" align="center">주요생산품목1</th>
							<td><input type="text" name="product1" id="product1">
							</td>
						</tr>
						<tr>
							<th colspan="2" align="center">주요생산품목2</th>
							<td><input type="text" name="product2" id="product2">
							</td>
						</tr>
						<tr>
							<td colspan="3" align="center"><input type="button"
								id="insert_btn" value="" onClick="insert_Clear()"></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
		<div id="bottom_info"></div>
	</div>

</body>
</html>
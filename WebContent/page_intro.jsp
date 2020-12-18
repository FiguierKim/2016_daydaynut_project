<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

	function chk() {
		var agree = document.getElementsByName("agree");
		var a = agree[0].checked;
		var b = agree[1].checked;

		if (a == true && b == true) {
			document.terms.submit();
		} else {
			alert("위 약관에 모두 동의하셔야 합니다.");
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
			<div id="header_logo2"><img src="Images/new/logo1.jpg" width="300" height="75"></div>
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
										href="board_indivi1.jsp">
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
					<img src="Images/new/trade.png">
				</div>
			</div>
			<div id="forms">
            	<img src="Images/new/page_intro.png">
			</div>
		</div>
		<div id="bottom_info"><img src="Images/new/bottom_info.png" width="980" height="50"></div>
	</div>
</body>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.net.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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
			alert("�� ����� ��� �����ϼž� �մϴ�.");
		}
	}
</script>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<div id="header_logo">
				<a href="index.jsp"><img src="Images/new/logo.gif"></a>
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
					<h1>ȸ�� ����</h1>
					<img src="Images/insert_process_1.png" width="260" height="560">
				</div>
			</div>

			<div id="forms">
				<h2>�̿� ���</h2>
				<form action="usercategori.jsp" method="post" name="terms">
					<textarea class="terms">
[��1 �� ��Ģ]

��1 ��(����)
���̿����� ��Be oH(����"ȸ��" ����)�� ��ϴ� BeoH.com���� �����ϴ� 
���߰���ǰ �ŷ� �� ���ͳ� ���á� (���� "������"�� �մϴ�.) ������ �̿�� 
�̿� ���� ���� �̿����� �� ����, �׸��� ȸ�� ��Ģ�� ���� ������ ����

��2 ��(����� ȿ�°� ����)
1. �� ����� ����ȭ��(BeoH.com)�� �Խ��Ͽ� �Խ��ϰų� �� ���� ������� 
   �̿� �������� ���������ν� ȿ���� �߻��մϴ�.
2. ȸ��� �ո����� ������ �߻��� ��쿡�� �� ����� ���� �� �� ������, 
   �̿������ ���� �� ������׿� �������� ������, ������ ���� �̿��� �ߴ��ϰ� �̿� ����� ���� �� �� �ֽ��ϴ�.
3. ����� ȿ�� �߻� �� ������ ������� ���� �̿��� ����� ������׿� 
   �̿� ���� �̵��� �� ������ ���ֵ˴ϴ�.

��3 ��(�������� ����)
�������� �Ұ����� �����̳� �������� ���Ͽ� �������� �����ϰų� �ߴ� �� �� �ֽ��ϴ�.

��4 ��(��� �� ��Ģ)
�� ������ ���õ��� ���� ������ ������ ���Ǹ� ��Ģ���� �ϵ� ���ڻ�ŷ� �⺻��, ���ڼ�����, ����ǸŹ�, ������ű⺻��, ���� ��� ����� �� ��Ÿ ���� ������ 
������ ���մϴ�.

��5 ��(����� ����)
�� ������� ����ϴ� ����� ���Ǵ� ������ �����ϴ�.
1. �̿����: ȸ��� ���� �̿� ����� ü������. "�̿����" �̶����� "��ȸ��"��
   "ȸ��"���� �����մϴ�.
    1-1. ��ȸ��: ȸ�翡���䱸�ϴ�ȸ��������������������������.
    1-2. ȸ��: ȸ�翡�� �䱸�ϴ� ȸ�� ���� ������ ��������.
2. ���̵�(ID) : ȸ�� �ĺ��� ȸ���� ���� �̿��� ���Ͽ� 
   ȸ���� �����ϰ� ȸ�簡 �����ϴ� ���ڿ� ������ ����.
3. ��й�ȣ: ȸ���� ��к�ȣ�� ���� ȸ�� �ڽ��� ������ ���ڿ� ������ ����.
4. ���: ������ �������� ������ ��Ȱ�� ��� ���Ͽ� ȸ�翡�� ������ ���.
5. ����: ȸ�� �Ǵ� ȸ���� ���� ���� �� �̿� ����� �ؾ��ϴ� ��.
 

[��2 �� ȸ�� ���� �̿� ���]

��6 ��(�̿����� ����)
1. �Ʒ� �̿� ����� �����Ͽ� ���� ���� ������ ������ �� "ȸ������" ���߸� ������ 
   �� ������ �����ϴ� ������ ���ֵ˴ϴ�.
2. �̿� ����� ȸ���� �̿� ��û�� ���Ͽ� ȸ�簡 �³������ν� �����մϴ�.

��7 ��(�̿� ��û)
�̿� ��û�� �¶������� ���� ������ ���� ��û ��Ŀ� ����Ͽ� ��û�մϴ�.
    1. �̸�
    2. ���̵�(ID)
    3. ��й�ȣ
    4. �̸���(e-mail)
    5. �ֹε�Ϲ�ȣ(��й�ȣ �� �н� �� ���� Ȯ�ο� ������. ����� �ܿ��� ��)
    6. �ּ�
    7. ��ȭ��ȣ
    8. �����, ��Ż�

��8 ��(�̿� ��û�� �³�)
1. ȸ��� ȸ���� ��7 ������ ���� ��� ������ ��Ȯ�� �����Ͽ� 
   �̿� ��û�� �Ͽ��� �� �³��մϴ�.
2. ȸ��� ���� �� ȣ�� 1�� �ش��ϴ� �̿� ��û�� ���Ͽ��� �³��� ���� �� �� �ֽ��ϴ�.
    2-1. ���� ������ ���� ���
    2-2. ����� ������ �ִ� ���
    2-3. ��Ÿ ȸ�簡 �ʿ��ϴٰ� �����Ǵ� ���
3. ȸ��� ���� �� ȣ�� 1�� �ش��ϴ� �̿� ��û�� ���Ͽ��� 
   �̸� �³����� ���� �� �ֽ��ϴ�.
    3-1. �̸��� �Ǹ��� �ƴ� ���
    3-2. �ٸ� ����� ���Ǹ� ����Ͽ� ��û�� ���
    3-3. �̿� ��û �� �ʿ� ������ ������ �����Ͽ� ��û�� ���
    3-4. ��ȸ�� �ȳ� ���� �Ǵ� ��ǳ����� ���� �� �������� ��û�� ���
    3-5. ��Ÿ ȸ�簡 ���� �̿� ��û ����� �̺� �Ǿ��� ��
 
��9 ��(��� ������ ����)
ȸ���� �̿� ��û �� ������ ������ ����Ǿ��� ��쿡�� �¶������� ������ �ؾ� �մϴ�.
 
[��3 �� ȸ�� ���� �̿�]
��10 ��(ȸ���� �ǹ�)
ȸ��� ���� ������ �����ؼ� �˰� �ִ� ȸ���� �Ż������� ������ �³� ���� 
��3�ڿ��� ����, �������� �ʽ��ϴ�.
��, ���� ��� �⺻�� �� ������ ������ ���� ���� ����� �䱸�� �ִ� ���, ���˿� ���� ������� ������ �ְų� ���� ��� ���� ����ȸ�� ��û�� �ִ� ��� �Ǵ� ��Ÿ ���� ���ɿ��� ���� ������ ���� ��û�� �ִ� ��쿡�� �׷����� �ʽ��ϴ�.

��11 ��(ȸ�� ���̵�(ID)�� ��� ��ȣ ������ ���� ȸ���� �ǹ�)
1. ���̵�(ID)�� ��й�ȣ�� ���� ��� ���� å���� ȸ������ �ֽ��ϴ�.
   ȸ������ �ο� �� ���̵�(ID)�� ��й�ȣ�� ���� ��Ȧ, 
   ������뿡 ���Ͽ� �߻��ϴ� ��� ����� ���� å���� ȸ������ �ֽ��ϴ�.
2. �ڽ��� ���̵�(ID)�� �����ϰ� ��� �� ��� ȸ���� 
   �ݵ�� ȸ�翡 �� ����� �뺸�ؾ� �մϴ�.

��12 ��(���� ���ݿ� ���� ȸ���� �ǹ�)
1. ȸ���� ���񽺸� �̿� �� �� ���� �� ȣ�� ������ ���� �ʾƾ� �մϴ�.
    1-1. �ٸ� ȸ���� ���� ���̵�(ID)�� �����ϰ� ����ϴ� ����
    1-2. ���񽺿��� ���� ������ ȸ���� ���� �³� ���� ȸ���� �̿� �̿��� ��������             �����ϰų� �̸� ���� �� ��� � ����ϰų� ��3�ڿ��� �����ϴ� ����
    1-3. ��3���� ���۱� �� ��Ÿ �Ǹ��� ħ���ϴ� ����
    1-4. �������� �� ��ǳ��ӿ� ���ݵǴ� ������ ����, ����, ���� ���� 
         Ÿ�ο��� �����ϴ� ����
    1-5. ���˿� ��� �ȴٰ� ���������� �ǴܵǴ� ����
    1-6. ��Ÿ ���� ���ɿ� ����Ǵ� ����
2. ȸ���� �� �������� �����ϴ� ���װ� ���� �̿� �ȳ� �Ǵ� 
   ���ǻ����� �ؼ��Ͽ��� �մϴ�.
3. ȸ���� ���� ���� ȸ�簡 ���� ���� ���׿� �Խ��ϰų� ������
   ������ �̿� ���� ������ �ؼ��Ͽ��� �մϴ�.
4. ȸ���� ȸ���� ���� �³� ���̴� ���񽺸� �̿��Ͽ� ���� Ȱ���� �� �� ������,
   ���� Ȱ���� ����� ȸ���� ������ ������ ���� Ȱ���� �̿��Ͽ� �߻��� ����� ���Ͽ�
   ȸ��� å���� ���� �ʽ��ϴ�.
��13 ��(������ ����)
1. ȸ��� ȸ���� ���� �̿� �� �ʿ䰡 �ִٰ� �����Ǵ� �پ��� ������ ���ؼ� 
   ���� ����, ������ü, ���� ���� ���� ������� ȸ������ ���� �� �� �ֽ��ϴ�.
2. ȸ���� ��ġ ���� ��� ���� ��û �޴��� ȸ�� ���� ���� �޴�����
   ���� ������ �ź��� �� �ֽ��ϴ�.

��14 ��(ȸ���� �Խù�)
1. ȸ��� ȸ���� �Խ��ϰų� ����ϴ� ���� ���� ���빰�� ���� �� ȣ�� 1��
   �ش��Ѵٰ� �ǴܵǴ� ��쿡 ���� ���� ���� ���� �� �� �ֽ��ϴ�.
    1-1. �ٸ� ȸ�� �Ǵ� ��3�ڸ� ����ϰų� 
         �߻������ ������ �ջ��Ű�� ������ ���
    1-2. �������� �� ��ǳ��ӿ� ���ݵǴ� ������ ���
    1-3. ������ ������ ��εȴٰ� �����Ǵ� ���� �� ���
    1-4. ��3 ���� ���۱� �� ��Ÿ �Ǹ��� ħ���ϴ� ������ ���
    1-5. ȸ�翡�� ������ �Խ� �Ⱓ�� �ʰ��� ���
    1-6. ��Ÿ ���� ���ɿ� ���ݵȴٰ� �ǴܵǴ� ���

��15 ��(�Խù��� ���۱�)
1. ���񽺿� ���� �� �ڷῡ ���� �Ǹ��� ���� �� ȣ�� �����ϴ�.
    1-1. �Խù��� ���� �Ǹ��� å���� �Խ��� ���� ������ ȸ��� �Խ����� ���� ���̴�            �̸� ������ �������� ����� �� �����ϴ�. ��, �񿵸����� ���� �׷�����
          �ƴ��ϸ� ���� ���� ���� ���� ���� �����ϴ�.
    1-2. ȸ���� ���񽺸� �̿��Ͽ� ���� ������ ����, �Ǹ��ϴ� ���� �� 
         ���񽺿� ���� �� �ڷḦ ����� �� �����ϴ�.

��16 ��(�������� ���۱�)
1. Be oH.com�� ������ ���۱��� "(��)Be oH"�� �����Դϴ�.
2. ȸ���� �������� �� �̿� ���� ���̴� Be oH.com�� �������� 
   Ÿ �뵵�� ����� �� �����ϴ�.

��17 ��(�������� ����)
1. �������� ���׸��� �߰���ǰ �ŷ� �� �ŷ� ��� �����Դϴ�.
2. "(��)Be oH"���� ������ �������� ���� �κп� ������ ���� �Ϳ� 
   �����ϴ� ������ �մϴ�.

��18 ��(���� �̿� �ð�)
1. ������ �̿��� ȸ���� ������ �Ǵ� ����� Ư���� ������ ���� �� ���߹��� 
   1�� 24�ð��� ��Ģ���� �մϴ�. �ٸ� ���� ���� ���� �ʿ�� 
   ȸ�簡 ���� ���̳� �ð��� �׷����� �ʽ��ϴ�.
2. ȸ��� ���񽺸� ���� ������ �����Ͽ� �� ���� ���� �̿� ���� �ð��� 
   ������ ���� �� ������ �� ��� �� ������ ������ �����մϴ�.

��19 ��(���� ������ ����)
1. ȸ��� ���� �� ȣ�� �ش��ϴ� ��� ���� ������ ������ �� �ֽ��ϴ�.
    1-1. ���񽺿� ������ ���� �� ����� ���� �ε����� ���
    1-2. ���� ��� ������� ���� �� �Ⱓ ��� ����ڰ� ���� ���
         ���񽺸� �������� ���
2. ȸ��� ���� ������, ����, ���� ������ ��� �Ǵ� ���� �̿��� ���� ������
   �������� ���� �̿뿡 ������ �ִ� ������ ������ ���� �Ǵ� �Ϻθ� �����ϰų�
   ���� �� �� �ֽ��ϴ�.

[��4 �� ��� ���� �� �̿� ����]
��20 ��(��� ���� �� �̿� ����)
1. ȸ���� �̿� ����� �����ϰ��� �ϴ� ������ ȸ�� ������
   �¶����� ���� ȸ�翡 ���� ��û�� �Ͽ��� �մϴ�.
2. ȸ��� ȸ���� ���� �� ȣ�� 1�� �ش��ϴ� ������ �Ͽ���
   ��� ���� ���� ���� �̿� ����� �����ϰų� �Ǵ� �Ⱓ��
   ���Ͽ� ���� �̿��� ������ �� �ֽ��ϴ�.
    2-1. Ÿ���� ���� ID �� ��й�ȣ�� ������ ���
    2-2. ���� ��� ���Ƿ� ������ ���
    2-3. ������ �̸��� �Ǹ��� �ƴ� ���
    2-4. �������� �� ��ǳ��ӿ� ���صǴ� ������ ���Ƿ� ���� ��Ų ���
    2-5. ȸ���� ���� �Ǵ� ��ȸ�� ������ ���� �� ��������
         ���� �̿��� ��ȹ �Ǵ� �����ϴ� ���
    2-6. Ÿ���� ������ �ջ��Ű�ų� �������� �ִ� ������ �� ���
    2-7. ��Ÿ ȸ�簡 ���� �̿� ���ǿ� ������ ���
 
[��5 �� �Խ��� �̿�]
��21 ��(�������)
1. �ֹ��� ���� ��Ų �� ������ ��Ҵ� ���� ��û �� 3�� �ȿ� �����ϸ�, �¶��� �Ա�
   �Ǵ� �ٸ� ���� �������� ������ �� �Ķ� �̿� ������ ��û�� ���� ��� ���󿡼���
   ��� ó�� �� ȯ���� �����մϴ�.
2. ���� ��ǰ�� ���� ���ο� ������� ������ ��Ҵ� ���������� ����� �̷���� ����
   ���� �Ǵ� �������� �����Ƿ� ���� �Ѽ��� �ִ� ��� ���� ��Ҵ� �Ұ����մϴ�.
3. �̿� ��� ���� ������ ���� ��Ҵ� ��ȭ�� �����Ǹ�, ������ ������ ó�� �� 
   �� ����� e-mail �Ǵ� ��ȭ�� �̿� �������� �����մϴ�.
4. �̿� ��� ���� �� �߼��� ����Ǳ� �������� ��� ������ �� ��� �߼��� �����ϰ�
   ȯ���ϸ�, ȯ�ҿ� ���ݵǴ� �۱� ������� ī�� ���� ��� ������� ��Ҹ� ��û�� 
   �̿� ���� �δ����� �մϴ�.
5. �߼� ������ ��Ҵ� 4���� ������ �ܿ� �ݼۿ� ���� �ݼ� ����� �̿� ������ 
   �δ��Ͽ��� �մϴ�.

��22 ��(���, ��ȯ, ȯ��)
1. ���θ��� ��ǰ�� �����Ͻ� �� ǰ���� �̻��� ���� �� �����Ϸκ��� ���� ����,
   ��ȯ(���� �� 20�� �̳�) �� ȯ��(���� �� 20�� �̳�)�� �����մϴ�.
2. ������ ����Ȯ �� ������, ���� � ���� �Ҹ��� ���� ����, ���� ��ǰ�� ���Ͽ� 
   �����Ϸκ��� 20�� �̳��� ��ȯ�� �����մϴ�. (�� ��ǰ�� �ջ��� ����� ����
   ��Ģ���� �ϸ�, ��ǰ�� ���� ���κ��� 3�� �̳��� �����ڿ��� ����� �ǹ��� �ֽ��ϴ�)
3. ������ �����ǿ� ���� ��ǰ �Ѽ� �� ����, ǰ�� �����Ⱓ(1��)�� ����� ��ǰ�� ǰ��
   �̻� ���ؼ��� ������ å���� ���� ������, ���� ���� �ÿ��� ���� �����ص帳�ϴ�.
4. ����� �̴� �ֹ��� ���簡 �Ϸ�� ������ �������� ���� �ż��� ������ �帳�ϴ�.
5. �ؿ� ����� ��� ������ �߰��� ��۷Ḧ �δ��ϼž� �մϴ�.

��23 ��(��Ÿ)
"(��)Be oH"������ ��ǰ�� �ǸŸ� �� �Һ��ڸ� ���� ������ ���ǸŸ� ���� 
���� �� �Ǹ� ������ ���� ���� ������ ���� �ݵ�� �Ű��Ͽ��� �մϴ�.
 
[��6 �� ��å ���� ��]
��24 ��(��å ����)
1. ȸ��� õ������ �Ǵ� �̿� ���ϴ� �Ұ��׷����� ���Ͽ� ���񽺸� ���� �� �� ���� 
   ��쿡�� ���� ������ ���� å���� �����˴ϴ�.
2. ȸ��� ȸ���� ��å������ ���� ���� �̿��� ��ֿ� ���Ͽ� å���� ���� �ʽ��ϴ�.
3. ȸ��� ȸ���� ���񽺸� �̿��Ͽ� ����ϴ� �����̳� ���񽺸� ���Ͽ� ���� �ڷ�� 
   ���� ���ؿ� ���Ͽ� å���� ���� �ʽ��ϴ�.
4. ȸ��� ȸ���� ���񽺿� ������ ����, �ڷ�, ����� �ŷڵ�, ��Ȯ�� �� 
   ���뿡 ���Ͽ��� å���� ���� �ʽ��ϴ�.

��25 ��(���� ����)
��� �� ���� �̿����� �߻��� ���￡ ���� �Ҽ��� ���� �� ��� ȸ����
���� �������� �����ϴ� ������ ���� �������� �մϴ�.

                </textarea>
					<p align="right">
						<input type="checkbox" name="agree" value="agree1"> �� �����
						���� �մϴ�.
					</p>
					<textarea class="terms">
[�������� ��޹�ħ]

�����Ǵ� �������� ����
��(��)Be oH�� ������ ���񽺸� �����ϱ� ���� ȸ�� ���� �� �� �⺻���� �ʼ� ������ �����ϰ� ������ �� �ۿ� ���� ���񽺸� �̿��Ͻ� �� �ʿ��� �߰� ������ �ް� �ֽ��ϴ�.  
ȸ�� ���� �� �⺻ ����
    1. �̸�
    2. ���̵�(ID)
    3. ��й�ȣ
    4. �̸���(e-mail)
    5. �ֹε�Ϲ�ȣ
    6. �ּ�
    7. ��ȭ��ȣ
    8. �����, ��Ż� 
 
���� ���� ���� ���� �� �뵵
��(��)Be oH�� ȸ���Բ� ���� ������ ���񽺿� �� �� �� ���� ���� �����ͺ��̽� ��� ���� ���񽺸� �����ϱ� ���Ͽ� �ּ����� ���������� �����ϰ� �ֽ��ϴ�. 
��κ��� ���񽺴� ������ ����� ��� ���� �����ϰ� �ֽ��ϴ�.  
ȸ���Բ��� ������ �ֽ� ���������� �ش� ���� ���� �Ǵ� ������ ������ȴ� ���� �̿��� ��� �ٸ� �������� ������ ������ �˷��帳�ϴ�.  
 
���� ������ ���� �� ��� 
��(��)Be oH�� ȸ�����μ� ������ �ֽô� ���� ������ ȸ���Բ��� ���񽺸� �޴� ���� ��� �����ϰ�, ���� ������ ���� �̿��ϰ� �˴ϴ�. 
��, ������ ���� ��쿡�� ȸ�� ������ ��� ����մϴ�.  
��ȸ�� ������ ��� ����ϴ� ���
- ȸ���Բ��� ȸ�� Ż�� ��û�� ���,
- ȸ���Բ� ������ �˷� �帰 ����Ͻ� ��Ʈ�ʰ� �������� ���������� ���� ���� �Ǵ� 
  ���� ���� ������ �޼��� ���
 
���� ���� ���, ȸ�� ������ ����� �� ���� ����� ���� �ϵ� ��ũ���� ������ �����Ǹ� ��� �뵵�ε� ���� �Ǵ� �̿� �� �� ������ ó���˴ϴ�.  

                </textarea>
					<p align="right">
						<input type="checkbox" name="agree" value="agree2"> �� �����
						���� �մϴ�.
					</p>
					<p align="center">
						<input type="button" id="btn" value="" onClick="chk()">
					</p>
				</form>
			</div>
		</div>
		<div id="bottom_info"></div>
	</div>
</body>
</html>
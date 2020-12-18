<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jdbc.connection.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@ page import="jdbc.util.JdbcUtil"%>
<%@ page import="dao.PostDao"%>
<%@ page import="model.Post"%>
<%@ page import="java.util.*"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style type="text/css">
table {
	border: 3px solid #ABC668;
}
</style>
</head>
<body>
	<%
	//postId 값을 기준으로 해당 DB를 모두 불러옴. 그 후 이미지파일의 이름으로 해당 이미지 출력
	String postId = request.getParameter("postId"); //게시판에서 title 누르면 해당 게시글의 postId 값 넘겨줌
	String saleCategory = request.getParameter("saleCategory");
	Connection conn = ConnectionProvider.getConnection();
	    Post post = new Post();
	    PostDao postDao;	    
	try {
		postDao = new PostDao();
		post = postDao.select(conn, postId);
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		JdbcUtil.close(conn);
	}
    %>
<form name="writeFrom" method="post" enctype="multipart/form-data" action="update.jsp">
  <input name="maker" type="hidden" value="<%=(String)session.getAttribute("USERID")%>">
  <input name="saleCategory" type="hidden" value="<%=post.getSaleCategory()%>">
  <input name="postId" type="hidden" value="<%=post.getPostId()%>">
  <table width="514" border="1" align="center" cellspacing="0" cellpadding="3">
    <tr>
      <th width="120" scope="row">판매범주</th>
      <td width="208">
      <%if(saleCategory=="기업"){%> 
      <P><label>기업상품 등록</label><p>
      <%}else{%>
      <P><label>개인상품 등록</label><p>
      <%}%>
    </td>
    </tr>
    <tr>
      <th scope="row" height="10%">물품범주</th>
      <td><label for="select"></label>
        <select name="itemCategory" size="1" id="select">
          <option selected="selected">선택</option>
          <option value="전자제품">전자제품</option>
          <option value="스포츠">스포츠</option>
          <option value="의류패션">의류패션</option>
          <option value="도서">도서</option>
          <option value="가구">가구</option>
          <option value="기타">기타</option>
      </select></td>
    </tr>
    <tr>
      <th scope="row" height="10%">제목</th>
      <td><input name="title" type="text" value="<%=post.getTitle()%>" size=50 maxlength="23">
      		<input type="hidden" name="maker" value="<%=session.getAttribute("USERID") %>">
      </td>
    </tr>
    <tr>
      <th scope="row" height="10%">물품이름</th>
      <td><input type="text" name="itemName" value="<%=post.getItemCategory()%>" maxlength="10"></td>
    </tr>
    <tr>
      <th scope="row" height="10%">물품가격</th>
      <td><input type="text" name="price" value="<%=post.getPrice()%>" maxlength="10">원</td>
    </tr>
    <tr>
      <th scope="row" height="10%">거래방법</th>
      <td><input type="text" name="tradeWay" value="<%=post.getTradeWay()%>" maxlength="20"></td>
    </tr>
    <tr>
      <th scope="row" height="10%">연락처</th>
      <td><input type="text" name="phone" value="<%=post.getPhone()%>" maxlength="20"></td>
    </tr>
    <tr>
      <th scope="row">물품소개</th>
      <td><textarea name="content" cols="45" rows="10"><%=post.getContent()%></textarea></td>
    </tr>
    <tr>
      <th scope="row" height="10%">비밀번호</th>
      <td><input type="password" name="password" maxlength="5"></td>
    </tr>
    <tr>
      <th scope="row" height="10%">물품사진</th>
      <td>
  
      <input type="file" name="imageFile" size=40>
   
      </td>
    </tr>
    <tr>
      <th colspan="2" scope="row"><input type="button" value="올리기" OnClick="javascript:writeCheck();">
      <input type=button value="취소" OnClick="javascript:history.back(-1)">
      </th>
    </tr>
  </table>
</form>

<script language = "javascript"> // 자바 스크립트 시작
function writeCheck()
  {
   var form = document.writeFrom;
   
   if( form.itemCategory.value=="선택" )   // form 에 있는 name 값이 없을 때
   {
    alert( "카테고리를 선택해 주세요!" ); // 경고창 띄움
    form.itemCategory.focus();   // form 에 있는 name 위치로 이동
    return;
   }
   
   if( !form.title.value )
   {
    alert( "제목을 입력해 주세요!" );
    form.title.focus();
    return;
   }
   
  if( !form.itemName.value )
   {
    alert( "상품 이름을 입력해 주세요!" );
    form.itemName.focus();
    return;
   }
  
  var number = /[^0-9]/; //숫자만 허용
  //공백검사 -> 숫자검사
  if( !form.price.value )
   {
    alert( "가격을 입력해 주세요!" );
    form.price.focus();   
    return;
    //숫자만 입력 허용
   }else if(form.price.value.search(number)!=-1 || form.price.value.length == 0 ){
	alert("올바른 가격을 입력해 주세요!(숫자)");
	form.price.focus();
	return;
   }
  
  if( !form.tradeWay.value )
  {
   alert( "거래방법을 입력해 주세요!" );
   form.tradeWay.focus();
   return;
  }
  
  if( !form.phone.value )
  {
   alert( "연락처를 입력해 주세요!" );
   form.phone.focus();
   return;
  }
  
  if( !form.content.value )
  {
   alert( "내용을 입력해 주세요!" );
   form.content.focus();
   return;
  }
  var ps = "<%=post.getPassword()%>";
  if( !form.password.value )
  {
   alert( "비밀번호를 입력해 주세요!" );
   form.password.focus();
   return;
  }else if(ps!=form.password.value){
	alert( "비밀번호가 틀렸습니다!" );
   form.password.focus();
   return;
  }
 
  form.submit();
  }
 </script>
 
</body>
</html>

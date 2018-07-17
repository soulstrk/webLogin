<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/Css.css">
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<title>Insert title here</title>
</head>
<body>
<form action="admin_confirmInfo.jsp" method="post">
	<div class="form-group">
          <label for="검색할 아이디">검색할 아이디</label>
          <input type="text" name="username"/>
          <button type="submit">등록</button>
    </div>
</form>
	<div class="form-group"></div>
    <div class="form-group">
    	<button onclick="location.href='memberInfo.jsp'">모든 회원 정보 보기</button>
    </div>
    <div class="form-group"></div>
    <div class="form-group">
    	<button onclick="location.href='memberInfo_date.jsp'">회원가입 짬순으로 보기</button>
    </div>
</body>
</html>


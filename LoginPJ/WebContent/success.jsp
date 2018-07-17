<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); //post방식 인코딩 설정 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<META http-equiv="Expires" content="-1"> 
<META http-equiv="Pragma" content="no-cache"> 
<META http-equiv="Cache-Control" content="No-Cache">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<title>Insert title here</title>
<style type="text/css">
	#wel{
		font-family: cursive;
		font-size: 10px;
	    color: blue;
	}
</style>
</head>

<body>
	<%! String username,email,join_date,gender; %>
	<%
		String username = (String)session.getAttribute("username");
		String email = (String)session.getAttribute("email");
		String join_date = (String)session.getAttribute("join_date");
		String gender = (String)session.getAttribute("gender");
	%>
	
	<p id="info"> <img src="img\welcome.jpg"> </p>
	
	<p id="wel">환영합니다 <%= username %>님~</p>
	<button onclick="myFunc()">회원정보 확인하기</button>
	<button onclick="location.href='modify.jsp'">회원정보수정</button>
	
	<script type="text/javascript">
		function myFunc() {
			document.getElementById('info').innerHTML =
				"아이디 : <%= username %><br>이메일:<%= email %><br>가입일:<%= join_date %><br>성별:<%= gender %>";
		}
	</script>
</body>
</html>
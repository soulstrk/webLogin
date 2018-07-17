<%@page import="com.soulstrk.MemberDTO"%>
<%@page import="com.soulstrk.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); //post방식 인코딩 설정 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/Css.css">
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<title>Insert title here</title>
<style type="text/css">
	#info{
		color:blue;
		font-weight: bold;
	}
	span{
		color:red;
	}
</style>
</head>

<body>
	<%! String username,password,gender,email,join_date; MemberDAO dao; MemberDTO dto; %>
	<%
		username = request.getParameter("username");
		dao = new MemberDAO();
		dto = dao.getMember(username);
		password = dto.getPassword();
		gender = dto.getGender();
		email = dto.getEmail();
		join_date = dto.getDate();
	%>
	
	<div id="info">
		아이디 : <%= username	%><br>
		<span>비밀번호 : <%= password %></span><br>
		이메일 : <%= email %><br>
		성별 : <%= gender %><br>
		가입일 : <%= join_date %><br>
	</div>
	<button onclick="history.back()">뒤로돌아가기</button>
</body>
</html>
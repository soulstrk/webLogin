<%@page import="com.soulstrk.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%! String username,password; %>
	<%
		username = (String)session.getAttribute("username");
		password = (String)session.getAttribute("password");
	%>
	<form action="modifyOk.jsp" method="post">
		아이디 : <%= username %><br>
		변경할 비밀번호 : <input type="text" name="password"><br>
		변경할 이메일 : <input type="text" name="email"><br>
		<input type="submit" value="수정완료">
	</form>
	
</body>
</html>
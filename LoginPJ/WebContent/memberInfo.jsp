<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.soulstrk.MemberDAO"%>
<%@page import="com.soulstrk.MemberDTO"%>
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
<%! ArrayList<MemberDTO> list; String username,password,email,gender,date; MemberDTO dto; MemberDAO dao;%>
<style type="text/css">
	div{
		color: red;
	}
</style>
</head>
<body>
<%
	dao = new MemberDAO();
	list = dao.getAllMember();
	for(MemberDTO member : list){
		username = member.getUsername();
		password = member.getPassword();
		email = member.getEmail();
		gender = member.getGender();
		date = member.getDate();
%>
	<div>
		아이디 : <%= username %> //
		비밀번호 : <%= password %> //
		이메일 : <%= email %> //
		성별 : <%= gender %> //
		가입날짜 : <%= date %> <br>
	</div>
<%		
	}
%>
	
</body>
</html>
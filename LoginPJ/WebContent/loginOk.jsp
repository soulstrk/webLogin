<%@page import="com.soulstrk.MemberDTO"%>
<%@page import="com.soulstrk.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dto" class="com.soulstrk.MemberDTO"/>
<jsp:setProperty name="dto" property="*"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%! MemberDAO dao; MemberDTO getDto;%>
	<%
		dao = new MemberDAO();
	
		int w = dao.checkUser(dto.getUsername(), dto.getPassword());
		if((dto.getUsername().equals("admin") && dto.getPassword().equals("admin")) || (dto.getUsername().toUpperCase().equals("ADMIN") && dto.getPassword().toUpperCase().equals("ADMIN"))){
	%>
		<script type="text/javascript">
			alert('Admin으로 로그인 성공!');
			location.href="admin.jsp";
		</script>
	<%	
		} else if(w == MemberDAO.MEMBER_LOGIN_PW_NO_GOOD){
	%>
		<script type="text/javascript">
			alert('비밀번호가 틀립니다');
			location.href="login.html";
		</script>
	<%		
		} else if(w == MemberDAO.MEMBER_LOGIN_IS_NOT){
	%>
		<script type="text/javascript">
			alert('잘못된 정보 입니다');
			location.href="login.html";
		</script>
	<%		
		} else{
			getDto = dao.getMember(dto.getUsername());
			session.setAttribute("username", getDto.getUsername());
			session.setAttribute("password", getDto.getPassword());
			session.setAttribute("email", getDto.getEmail());
			session.setAttribute("join_date", getDto.getDate());
			session.setAttribute("gender", getDto.getGender());
	%>
		<script type="text/javascript">
			alert('로그인 성공!');
			location.href="success.jsp";
		</script>
	<%		
		}
	%>
</body>
</html>
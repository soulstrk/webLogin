<%@page import="org.apache.jasper.tagplugins.jstl.core.Param"%>
<%@page import="com.soulstrk.MemberDAO"%>
<%@page import="com.soulstrk.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<% request.setCharacterEncoding("UTF-8"); //post방식 인코딩 설정 %>
<jsp:useBean id="dto" class="com.soulstrk.MemberDTO"/>
<jsp:setProperty name="dto" property="*"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%! MemberDTO dto; MemberDAO dao; String username,password,email,gender; boolean flag = true; %>
	
	<%
		/* username = request.getParameter("username");
		password = request.getParameter("password");
		email = request.getParameter("email"); */ 
		//자바 빈을 이용하면 이런 과정을 생략할 수 있다!
		
		
		flag = true;
		if(!(dto.getPassword().equals(request.getParameter("cpassword")))){%>
			<script type="text/javascript">
				alert('비밀번호 확인이 잘못되었습니다!');
				location.href="join.html";
			</script>
		<% flag = false;}	// 비빌번호 != 비밀번호확인 일때 경고창을 띄우고 로그인페이지로 돌아간다.%>
	
		<%
		dao = new MemberDAO();
		if(MemberDAO.MEMBER_EXISTENT == dao.confirmId(dto.getUsername())){%>
			<script type="text/javascript">
				alert('이미 존재하는 아이디 입니다');
				location.href="join.html";
			</script>
		<% flag = false;}%>
		
		<%
			out.println(dto.getGender());
		%>
		<script type="text/javascript">alert('sdf')</script>
		<% // 디버깅용
			if(flag){
			int w = dao.insertMember(dto);
			if(w == MemberDAO.MEMBER_JOIN_SUCCESS){
		%>	
			<script type="text/javascript">
				alert('회원가입을 완료했습니다!');
				location.href="login.html";
			</script>
		<%
			}
			} 
		%>	
			
		
</body>
</html>
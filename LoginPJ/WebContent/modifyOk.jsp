<%@page import="com.soulstrk.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%-- <jsp:useBean id="dto" class="com.soulstrk.MemberDTO"/>
<jsp:setProperty property="*" name="dto"/> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%! MemberDAO dao; int w; String id,pwd,email;%>
	<%
		pwd = request.getParameter("password");
		email = request.getParameter("email");
		id = (String)session.getAttribute("username");
		
		dao = new MemberDAO();
		int w = dao.updateMember(id, pwd, email);
		if(w == MemberDAO.MEMBER_JOIN_SUCCESS){
	%>
		<script type="text/javascript">
			alert('수정완료');
			location.href="login.html";
		</script>
	<%		
			session.invalidate();
		}else{
	%>
		<script type="text/javascript">
			alert('수정완료');
			location.href="login.html";
		</script>
	<%		
			session.invalidate();
		}
	%>
</body>
</html>
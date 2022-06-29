<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.gyojincompany.dao.*" %>
<%@ page import="com.gyojincompany.dto.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	MemberDao dao = new MemberDao();
	ArrayList<MemberDto> dtos = dao.memberList();
	
	for(int i=0;i<dtos.size();i++) {
		
		MemberDto dto = dtos.get(i);
		String mid = dto.getId();
		String mpw = dto.getPw();
		String mname = dto.getName();
		String memail = dto.getEmail();
		String mphone = dto.getPhone();
		String mgender = dto.getGender();
		
		out.println("아이디 : " + mid);
		out.println("<br>");
		out.println("비번 : " + mpw);
		out.println("<br>");
		out.println("이름 : " + mname);
		out.println("<br>");
		out.println("이메일 : " + memail);
		out.println("<br>");
		out.println("전화번호 : " + mphone);
		out.println("<br>");
		out.println("성별 : " + mgender);
		out.println("<br>");
		out.println("=================");
		out.println("<br>");
		
	}
	
%>

</body>
</html>
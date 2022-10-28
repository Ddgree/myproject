<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="partyband.dao.*" %>
<%
 request.setCharacterEncoding("utf-8");
 
 String nick=request.getParameter("memnick"); 
 String pass=request.getParameter("mempass");
 System.out.println("nick="+nick);
 System.out.println("pass="+pass);
 
 MemberDAOImpl md=new MemberDAOImpl();

 int re=md.checkMembernickname(nick);
 //1이면 중복 -1이면 사용가능 아이디

 out.println(re);
%>
 
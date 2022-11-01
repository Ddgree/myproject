package partyband.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import partyband.model.MemberBean;

public class SessionCheckInter extends HandlerInterceptorAdapter 
{
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception 
	{
		HttpSession session = request.getSession();
		MemberBean member = (MemberBean)session.getAttribute("sessionMember");
		String id = (String)session.getAttribute("sessionId");
		
		if(id == "admin")
		{
			return true;
		}
		
		if (member == null)  
		{
			response.setContentType("text/html; charset=utf-8");
	        PrintWriter w = response.getWriter();
	
	        String msg = "로그인이 필요한 서비스입니다. 로그인 화면으로 이동합니다.";
	        String url = "member_login.do";
	        w.write("<script>alert('"+msg+"');location='"+url+"';</script>");
	        w.flush();
	        w.close();
	        return false;
		}
		
		return true;
	}
}
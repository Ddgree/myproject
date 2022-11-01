package partyband.controller;

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
		
		if (member == null)  {		
			response.sendRedirect("member_login.do");	
			return false;
		}
		
		return true;
	}
}
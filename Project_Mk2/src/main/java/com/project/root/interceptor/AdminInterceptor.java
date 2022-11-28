package com.project.root.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class AdminInterceptor implements HandlerInterceptor  {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		HttpSession session = request.getSession();
		String checkKey = (String)session.getAttribute("mem_key");
		if(checkKey == null) {
			checkKey = "U";
		}
		if(!checkKey.equals("A") || checkKey == null) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>"+
			"alert('접근권한이 없습니다');"
			+"location.href='"+ request.getContextPath()+"/'</script>");
			return false;
		}
		return true;
	}
	
}

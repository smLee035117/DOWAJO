package com.project.root.contoller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.project.root.member.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService ms;
	
	@PostMapping("loginCheck")
	public String loginCheck(HttpServletRequest request, HttpSession session) {
		int result = ms.loginCheck(request);
		String memKey = ms.getMemKey(request.getParameter("id"));
		if(result == 1) {
			session.setAttribute("id", request.getParameter("id"));
			session.setAttribute("mem_key", memKey);
			return "loginSuccess";
		}
		return "redirect:login";
	}
	
}

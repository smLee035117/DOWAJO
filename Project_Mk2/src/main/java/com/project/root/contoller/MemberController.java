package com.project.root.contoller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.root.member.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService ms;
	
	@PostMapping("loginCheck")
	public String loginCheck(HttpServletRequest request, RedirectAttributes rs) {
		int result = ms.loginCheck(request);
		if(result == 1) {
			rs.addAttribute("id", request.getParameter("id"));
			return "loginSuccess";
		}
		return "redirect:login";
	}
	
}

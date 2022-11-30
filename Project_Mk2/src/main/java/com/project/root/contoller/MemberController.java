package com.project.root.contoller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.project.root.basicdata.dto.BasicDataDTO;
import com.project.root.basicdata.service.BasicDataService;
import com.project.root.member.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService ms;
	
	@Autowired
	private BasicDataService bs;
	
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
	
	@GetMapping("tablesTest")
	public void tables(Model model) {
		List<BasicDataDTO>list = bs.basicList();
		model.addAttribute("toiletList", list);
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
}

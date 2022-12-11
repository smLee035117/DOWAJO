package com.project.root.contoller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.root.basicdata.dto.BasicDataDTO;
import com.project.root.basicdata.dto.KakaoUserInfo;
import com.project.root.basicdata.service.BasicDataService;
import com.project.root.member.dto.MemberDTO;
import com.project.root.member.service.MemberService;
import com.project.root.util.KakaoOAuth2;

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
	
	@RequestMapping(value = "tables", method = RequestMethod.GET)
	public String tables(Model model) {
		List<BasicDataDTO>list = bs.basicList();
		model.addAttribute("allList", list);
		return "tablesTest";
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	

	@RequestMapping(value = "kakaoLoginResult" , method = RequestMethod.GET)
	public String kakaoLoginResult(@RequestParam String code,HttpSession session) {
		KakaoOAuth2 kakaoOAuth2 = new KakaoOAuth2();
		  // code는 카카오 서버로부터 받은 인가 코드
		 KakaoUserInfo kakaoUserInfo =  kakaoOAuth2.getUserInfo(code);
		 session.setAttribute("id", "kakao_"+kakaoUserInfo.getId());
		 session.setAttribute("nickname", kakaoUserInfo.getNickname());		 
		 session.setAttribute("mem_key", "K");
		  return "redirect:/";
	}
	
	//네이버 로그인시 callback 함수 실행되는 곳
    @RequestMapping(value="callback", method=RequestMethod.GET)
    public String callbackGet(HttpSession session) {	    	
        return "callback";
    }
	    
    @RequestMapping(value="nvaerSession", method=RequestMethod.POST)
    public String nvaerSessionGet(HttpSession session,@RequestParam("id") String id,
    		@RequestParam("mem_key") String mem_key,@RequestParam("loginToken") String loginToken) {
    	System.out.println(id);
    	System.out.println(mem_key);
    	System.out.println(loginToken);
    	session.setAttribute("mem_key", mem_key);
    	session.setAttribute("id", id);
    	session.setAttribute("loginToken", loginToken);
    	
		 return "redirect:/"; 
    }  
    
    @RequestMapping(value = "writeRegister", method = RequestMethod.POST)
    @ResponseBody
    public int writeRegister(MemberDTO memberDTO) {
    	int result = ms.writeRegister(memberDTO);
    	System.out.println("result="+result);
    	return result;
    }
}

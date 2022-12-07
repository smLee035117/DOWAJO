package com.project.root.contoller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.root.member.service.MemberService;
import com.project.root.suggestions.dto.SuggestionsDTO;

@Controller
public class AdminController {
	
	@Autowired
	private MemberService memberService;
	
	//sugTable페이지 값 뿌림
	@RequestMapping(value="sugTable",method = RequestMethod.GET)
	public String getSuggestionsList(Model model) {
		List<SuggestionsDTO> sugList =  memberService.getSuggestionsList();
		model.addAttribute("sugList",sugList);
		return "admin/sugTable";
	}
	
	//sugTable페이지 상세페이지
	@RequestMapping(value = "sugDetail", method = RequestMethod.GET)	
	@ResponseBody
	public SuggestionsDTO sugDetail(@ModelAttribute SuggestionsDTO suggestionsDTO){
		int result = memberService.ReadCk(suggestionsDTO);
		if(result==1) {
			suggestionsDTO = memberService.sugDetail(suggestionsDTO);			
		}
		
		return suggestionsDTO;
	}	
	
	//blank 페이지에서 건의사항 작성
	@RequestMapping(value = "sugWrite" , method = RequestMethod.POST )
	@ResponseBody
	public int sugWrite(SuggestionsDTO suggestionsDTO) {
		return memberService.sugWrite(suggestionsDTO);
	}
	
}

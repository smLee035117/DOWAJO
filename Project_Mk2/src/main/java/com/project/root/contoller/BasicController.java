package com.project.root.contoller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.root.basicdata.dto.BasicDataDTO;
import com.project.root.basicdata.service.BasicDataService;
import com.project.root.restdata.dto.RestDataDTO;

@Controller
public class BasicController {
	
	@Autowired 
	private BasicDataService basicDataService;
	
	@RequestMapping(value = "blank", method = RequestMethod.GET)
	public String blank() {		
		return "blank";
	}
	
	//개발 blank
	@RequestMapping(value = "blank2", method = RequestMethod.GET)
	public String blankGet() {
		return "blank2";
	}
	
	//개발 blank
	@RequestMapping(value = "blank2", method = RequestMethod.POST)
	@ResponseBody
	public int blankPost(BasicDataDTO basicDataDTO,RestDataDTO restDataDTO) {
		System.out.println(basicDataDTO);
		System.out.println(restDataDTO);
		
		  basicDataService.WriteBasicRest(basicDataDTO);
		  basicDataService.WriteDetailRest(restDataDTO);
		 
		return 1;
	}
	
	
	
}

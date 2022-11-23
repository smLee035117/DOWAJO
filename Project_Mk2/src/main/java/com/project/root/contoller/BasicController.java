package com.project.root.contoller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BasicController {
	
	@RequestMapping(value = "blank", method = RequestMethod.GET)
	public String blank() {		
		return "blank";
	}

}

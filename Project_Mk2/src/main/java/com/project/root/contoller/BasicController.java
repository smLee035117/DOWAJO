package com.project.root.contoller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestMethod;

import com.project.root.restdata.service.RestDataService;

@Controller
public class BasicController {
	
	@Autowired RestDataService restdataService;
	
	@RequestMapping(value = "blank", method = RequestMethod.GET)
	public String blank(Model model) {		
		restdataService.getToiletList(model);
		return "blank";
	}
	@RequestMapping(value = "toiletDetail", method = RequestMethod.GET)
	public void toiletDetail(Model model) {		
		restdataService.getToiletDetail(model);
	}
	
}

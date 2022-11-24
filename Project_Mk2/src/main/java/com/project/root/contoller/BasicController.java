package com.project.root.contoller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.root.restdata.dto.BasicRestDataDTO;
import com.project.root.restdata.dto.RestDataDTO;
import com.project.root.restdata.service.RestDataService;

@Controller
public class BasicController {
	
	@Autowired RestDataService restdataService;
	
	@RequestMapping(value = "blank", method = RequestMethod.GET)
	public String blank(Model model) {		
		restdataService.getToiletList(model);
		return "blank";
	}
	
	@GetMapping(value = "toiletDetail", produces = "application/json; charset=utf-8")
	@ResponseBody
	public List<BasicRestDataDTO> toiletDetail() {	
		return restdataService.getToiletDetail();
	}
	
}

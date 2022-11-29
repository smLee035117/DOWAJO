package com.project.root.contoller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.root.basicdata.dto.BasicDataDTO;
import com.project.root.basicdata.service.BasicDataService;
import com.project.root.restdata.dto.BasicRestDataDTO;
import com.project.root.restdata.dto.RestDataDTO;
import com.project.root.restdata.service.RestDataService;

@Controller
public class BasicController {
	
	@Autowired RestDataService restdataService;
	@Autowired BasicDataService basicDataService;
	
	@RequestMapping(value = "toiletDetail", produces = "application/json; charset=utf-8",method = RequestMethod.GET)
	@ResponseBody
	public List<BasicRestDataDTO> toiletDetail() {	
		return restdataService.getToiletDetail();
	}

	// 개발 blank
	@RequestMapping(value = "blank", method = RequestMethod.GET)
	public String blank(Model model) {		
		restdataService.getToiletList(model);
		return "map/blank";
	}

	// 개발 blank
	@RequestMapping(value = "blank", method = RequestMethod.POST)
	@ResponseBody
	public int blankPost(BasicDataDTO basicDataDTO, RestDataDTO restDataDTO, String latlng) {
		
		//위도 경도 값 나눈후 dto에 각각 데이터 입력
		String[] latlngArr = latlng.split(",");
		basicDataDTO.setBasLat(latlngArr[0]);
		basicDataDTO.setBasLng(latlngArr[1]);		
		
		//BASIC_DATA 시퀀스 불러오는 것
		int seqCntSelect = basicDataService.seqCntSelect();
		restDataDTO.setBasNo("BAS"+seqCntSelect);
		restDataDTO.setRestStatus("Clean");
		restDataDTO.setRestKey("Y");
		int result =   basicDataService.WriteBasicRest(basicDataDTO);
		int result2 =  basicDataService.WriteDetailRest(restDataDTO);
		
		if(result==1 && result2 ==1) {
			return 1;
		}else {
			return 0;
		}
	}
	
	// 개발 blank
	@RequestMapping(value = "blank2", method = RequestMethod.GET)
	public String blank2(Model model) {		
		restdataService.getToiletList(model);
		return "map/blank2";
	}
	
	// 개발 blank
	@RequestMapping(value = "blank2", method = RequestMethod.POST)
	@ResponseBody
	public int blankPost2(BasicDataDTO basicDataDTO, RestDataDTO restDataDTO, String latlng) {
		
		//위도 경도 값 나눈후 dto에 각각 데이터 입력
		String[] latlngArr = latlng.split(",");
		basicDataDTO.setBasLat(latlngArr[0]);
		basicDataDTO.setBasLng(latlngArr[1]);		
		
		//BASIC_DATA 시퀀스 불러오는 것
		int seqCntSelect = basicDataService.seqCntSelect();
		restDataDTO.setBasNo("BAS"+seqCntSelect);
		restDataDTO.setRestStatus("Clean");
		restDataDTO.setRestKey("Y");
		int result =   basicDataService.WriteBasicRest(basicDataDTO);
		int result2 =  basicDataService.WriteDetailRest(restDataDTO);
		
		if(result==1 && result2 ==1) {
			return 1;
		}else {
			return 0;
		}
	}
}
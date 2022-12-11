package com.project.root.contoller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.root.basicdata.dto.BasicDataDTO;
import com.project.root.basicdata.service.BasicDataService;
import com.project.root.restdata.dto.BasicRestDataDTO;
import com.project.root.restdata.dto.RestDataDTO;
import com.project.root.restdata.service.RestDataService;
import com.project.root.wifidata.dto.BasicWIFIDataDTO;
import com.project.root.wifidata.dto.WIFIDataDTO;
import com.project.root.wifidata.service.WifiDataService;

@Controller
public class BasicController {
	
	@Autowired RestDataService restdataService;
	@Autowired BasicDataService basicDataService;
	@Autowired WifiDataService wifiDataService;
	
	@RequestMapping(value = "toiletDetail", produces = "application/json; charset=utf-8",method = RequestMethod.GET)
	@ResponseBody
	public List<BasicRestDataDTO> toiletDetail() {	
		return restdataService.getToiletDetail();
	}
	@RequestMapping(value = "WIFIDetail", produces = "application/json; charset=utf-8",method = RequestMethod.GET)
	@ResponseBody
	public List<BasicWIFIDataDTO> wifiDetail() {	
		return wifiDataService.getWIFIDetail();
	}

	// 개발 blank
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String blank(Model model) {		
		restdataService.getToiletList(model);
		return "map/toilet";
	}

	// 개발 blank
	@RequestMapping(value = "toilet", method = RequestMethod.POST)
	@ResponseBody
	public int blankPost(BasicDataDTO basicDataDTO, RestDataDTO restDataDTO, String latlng) {
		
		//위도 경도 값 나눈후 dto에 각각 데이터 입력
		String[] latlngArr = latlng.split(",");
		basicDataDTO.setBasLat(latlngArr[0]);
		basicDataDTO.setBasLng(latlngArr[1]);		
		
		//BASIC_DATA 시퀀스 불러오는 것
		int seqCntSelect = basicDataService.seqCntSelect();
		restDataDTO.setBasNo("TOI"+String.format("%07d", seqCntSelect));
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
	// 주차장 맵
	@RequestMapping(value = "parking", method = RequestMethod.GET)
	public String parking() {		
		return "map/parking";
	}
	// 대피소 맵
	@RequestMapping(value = "shelter", method = RequestMethod.GET)
	public String shelter() {		
		return "map/shelter";
	}
	// WIFI 맵
	@RequestMapping(value = "wifi", method = RequestMethod.GET)
	public String wifi(Model model) {
		wifiDataService.getWIFIList(model);
		return "map/WIFIZone";
	}
	// WIFI Post
		@RequestMapping(value = "wifiPop", method = RequestMethod.POST)
		@ResponseBody
		public int wifiPost(BasicDataDTO basicDataDTO, WIFIDataDTO wifiDataDTO, String latlng) {
			
			//위도 경도 값 나눈후 dto에 각각 데이터 입력
			String[] latlngArr = latlng.split(",");
			basicDataDTO.setBasLat(latlngArr[0]);
			basicDataDTO.setBasLng(latlngArr[1]);		
			
			//BASIC_DATA 시퀀스 불러오는 것
			int seqCntSelect = basicDataService.seqCntSelect();
			wifiDataDTO.setBasNo("WIFI"+String.format("%06d", seqCntSelect));
			int result =   basicDataService.WriteBasicWIFI(basicDataDTO);
			int result2 =  basicDataService.WriteDetailWIFI(wifiDataDTO);
			//System.out.println("result="+result);
			//System.out.println("result2="+result2);
			
			if(result==1 && result2 ==1) {
				return 1;
			}else {
				return 0;
			}
		}
}

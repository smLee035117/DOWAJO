package com.project.root.basicdata.service;


import java.util.List;

import com.project.root.basicdata.dto.BasicDataDTO;
import com.project.root.restdata.dto.RestDataDTO;
import com.project.root.wifidata.dto.WIFIDataDTO;


public interface BasicDataService {
	//화장실 공통 정보등록
	public int WriteBasicRest(BasicDataDTO basicDataDTO);
	//화장실 상세 정보등록
	public int WriteDetailRest(RestDataDTO restDataDTO);
	
	public int seqCntSelect();
	public List<BasicDataDTO> basicList();
	
	public int WriteBasicWIFI(BasicDataDTO basicDataDTO);
	
	public int WriteDetailWIFI(WIFIDataDTO wifiDataDTO);
	
	public int DeleteBasicRest(BasicDataDTO basicDataDTO);
	
}

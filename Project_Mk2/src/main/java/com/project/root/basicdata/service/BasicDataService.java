package com.project.root.basicdata.service;

import com.project.root.basicdata.dto.BasicDataDTO;
import com.project.root.restdata.dto.RestDataDTO;


public interface BasicDataService {
	//화장실 공통 정보등록
	public int WriteBasicRest(BasicDataDTO basicDataDTO);
	//화장실 상세 정보등록
	public int WriteDetailRest(RestDataDTO restDataDTO);
}

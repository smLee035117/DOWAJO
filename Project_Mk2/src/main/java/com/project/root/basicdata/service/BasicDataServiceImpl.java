package com.project.root.basicdata.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.root.basicdata.dto.BasicDataDTO;
import com.project.root.mybatis.basicdata.BasicDataMapper;
import com.project.root.restdata.dto.RestDataDTO;

@Service
public class BasicDataServiceImpl implements BasicDataService {

	@Autowired
	private BasicDataMapper basicDataMapper;
	
	//화장실 공통 정보등록
	@Override
	public int WriteBasicRest(BasicDataDTO basicDataDTO) {
		return basicDataMapper.WriteBasicRest(basicDataDTO);
	}
	
	//화장실 상세 정보등록
	@Override
	public int WriteDetailRest(RestDataDTO restDataDTO) {
		return basicDataMapper.WriteDetailRest(restDataDTO);
	}

}

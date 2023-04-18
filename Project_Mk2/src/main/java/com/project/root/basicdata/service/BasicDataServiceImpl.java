package com.project.root.basicdata.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.root.basicdata.dto.BasicDataDTO;
import com.project.root.mybatis.basicdata.BasicDataMapper;
import com.project.root.restdata.dto.RestDataDTO;
import com.project.root.wifidata.dto.WIFIDataDTO;

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

	@Override
	public int seqCntSelect() {
		return basicDataMapper.seqCntSelect();
	}

	@Override
	public List<BasicDataDTO> basicList() {
		List<BasicDataDTO> list = basicDataMapper.getAllList();
		return list;
	}

	@Override
	public int WriteDetailWIFI(WIFIDataDTO wifiDataDTO) {
		return basicDataMapper.WriteDetailWIFI(wifiDataDTO);
	}

	@Override
	public int WriteBasicWIFI(BasicDataDTO basicDataDTO) {
		return basicDataMapper.WriteBasicWIFI(basicDataDTO);
	}
	
	@Override
	public int DeleteBasicRest(BasicDataDTO basicDataDTO) {
		return basicDataMapper.DeleteBasicData(basicDataDTO);
	}
}

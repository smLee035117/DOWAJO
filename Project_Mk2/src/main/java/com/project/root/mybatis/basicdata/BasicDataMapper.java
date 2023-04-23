package com.project.root.mybatis.basicdata;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.project.root.basicdata.dto.BasicDataDTO;
import com.project.root.restdata.dto.RestDataDTO;
import com.project.root.wifidata.dto.WIFIDataDTO;

public interface BasicDataMapper {

	public List<BasicDataDTO> getToiletList();
	
	public List<BasicDataDTO> getWIFIList();

	// 전체 목록 가져오기
	public List<BasicDataDTO> getAllList();
	
	//화장실 공통 정보등록
	public int WriteBasicRest(BasicDataDTO basicDataDTO);
	//화장실 상세 정보등록
	public int WriteDetailRest(RestDataDTO restDataDTO);
	
	//WIFI 공통 정보등록
	public int WriteBasicWIFI(BasicDataDTO basicDataDTO);
	//WIFI 상세 정보등록
	public int WriteDetailWIFI(WIFIDataDTO wifiDataDTO);
	
	//basic 시퀀스 조회
	public int seqCntSelect();
	
	// 기초 데이터 삭제하기
	public int DeleteBasicData(BasicDataDTO basicDataDTO);
	
}

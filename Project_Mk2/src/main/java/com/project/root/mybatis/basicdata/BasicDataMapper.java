package com.project.root.mybatis.basicdata;


import java.util.List;

import com.project.root.basicdata.dto.BasicDataDTO;
import com.project.root.restdata.dto.RestDataDTO;

public interface BasicDataMapper {

	public List<BasicDataDTO> getToiletList();

	//화장실 공통 정보등록
	public int WriteBasicRest(BasicDataDTO basicDataDTO);
	//화장실 상세 정보등록
	public int WriteDetailRest(RestDataDTO restDataDTO);
	
	public int seqCntSelect();
	
}

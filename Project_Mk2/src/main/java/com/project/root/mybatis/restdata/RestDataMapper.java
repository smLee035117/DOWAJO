package com.project.root.mybatis.restdata;

import java.util.List;

import com.project.root.basicdata.dto.BasicDataDTO;
import com.project.root.restdata.dto.RestDataDTO;

public interface RestDataMapper {

	List<RestDataDTO> getToiletDetail();

	
}

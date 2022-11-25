package com.project.root.mybatis.restdata;

import java.util.List;

import com.project.root.basicdata.dto.BasicDataDTO;
import com.project.root.restdata.dto.BasicRestDataDTO;

public interface RestDataMapper {

	public List<BasicRestDataDTO> getToiletDetail();

	public List<BasicDataDTO> getToiletList();
}

package com.project.root.mybatis.wifidata;

import java.util.List;

import com.project.root.wifidata.dto.BasicWIFIDataDTO;

public interface WIFIDataMapper {

	List<BasicWIFIDataDTO> getWifiDetail();

}

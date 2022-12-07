package com.project.root.mybatis.wifidata;

import java.util.List;

import com.project.root.restdata.dto.BasicRestDataDTO;

public interface WIFIDataMapper {

	List<BasicRestDataDTO> getWifiDetail();

}

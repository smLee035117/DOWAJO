package com.project.root.wifidata.service;

import java.util.List;

import org.springframework.ui.Model;

import com.project.root.mybatis.basicdata.BasicDataMapper;
import com.project.root.mybatis.wifidata.WIFIDataMapper;
import com.project.root.restdata.dto.BasicRestDataDTO;

public class WifiDataServiceImpl implements WifiDataService {
	
	BasicDataMapper basicMapper;
	WIFIDataMapper wifiMapper;
	
	@Override
	public void getWIFIList(Model model) {
		model.addAttribute("wifiList", basicMapper.getWIFIList());
	}

	@Override
	public List<BasicRestDataDTO> getWIFIDetail() {
		//return  restMapper.getToiletDetail();
		return wifiMapper.getWifiDetail();
	}


	
}

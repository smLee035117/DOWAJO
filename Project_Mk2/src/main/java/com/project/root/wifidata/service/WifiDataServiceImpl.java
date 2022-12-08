package com.project.root.wifidata.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.project.root.mybatis.basicdata.BasicDataMapper;
import com.project.root.mybatis.wifidata.WIFIDataMapper;
import com.project.root.wifidata.dto.BasicWIFIDataDTO;

@Service
public class WifiDataServiceImpl implements WifiDataService {
	
	@Autowired
	BasicDataMapper basicMapper;
	@Autowired
	WIFIDataMapper wifiMapper;
	
	@Override
	public void getWIFIList(Model model) {
		model.addAttribute("wifiList", basicMapper.getWIFIList());
	}

	@Override
	public List<BasicWIFIDataDTO> getWIFIDetail() {
		return wifiMapper.getWifiDetail();
	}


	
}

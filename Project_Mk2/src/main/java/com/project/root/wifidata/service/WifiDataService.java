package com.project.root.wifidata.service;

import java.util.List;

import org.springframework.ui.Model;

import com.project.root.wifidata.dto.BasicWIFIDataDTO;

public interface WifiDataService {
	
	public void getWIFIList(Model model);
	
	public List<BasicWIFIDataDTO> getWIFIDetail();
	
}

package com.project.root.wifidata.service;

import java.util.List;

import org.springframework.ui.Model;

import com.project.root.restdata.dto.BasicRestDataDTO;

public interface WifiDataService {
	
	public void getWIFIList(Model model);
	
	public List<BasicRestDataDTO> getWIFIDetail();
	
}

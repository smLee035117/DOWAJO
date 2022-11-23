package com.project.root.restdata.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.project.root.mybatis.basicdata.BasicDataMapper;
import com.project.root.mybatis.restdata.RestDataMapper;

@Service
public class RestDataServiceImpl implements RestDataService {

	@Autowired
	BasicDataMapper baiscMapper;
	
	@Autowired
	RestDataMapper restMapper;
	
	
	@Override
	public void getToiletList(Model model) {
		model.addAttribute("toiletList", baiscMapper.getToiletList());
		
	}
	@Override
	public void getToiletDetail(Model model) {
		model.addAttribute("toiletInfo", restMapper.getToiletDetail());
		
	}
	
}

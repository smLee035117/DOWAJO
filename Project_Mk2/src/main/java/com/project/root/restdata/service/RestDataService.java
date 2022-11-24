package com.project.root.restdata.service;

import java.util.List;

import org.springframework.ui.Model;

import com.project.root.restdata.dto.BasicRestDataDTO;
import com.project.root.restdata.dto.RestDataDTO;

public interface RestDataService {

	void getToiletList(Model model);

	List<BasicRestDataDTO> getToiletDetail();
	

}

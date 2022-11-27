package com.project.root.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.root.mybatis.review.ReviewMapper;
import com.project.root.review.dto.ReviewDTO;

@Service
public class ReviewServiceImpl implements ReviewService{

	@Autowired
	private ReviewMapper reviewMapper;
	
	@Override
	public List<ReviewDTO> getReviewList() {
		return reviewMapper.getReviewList();
	}
	
}

package com.project.root.review.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.root.mybatis.review.ReviewMapper;
import com.project.root.review.dto.ReviewDTO;
import com.project.root.suggestions.dto.SuggestionsDTO;

@Service
public class ReviewServiceImpl implements ReviewService{

	@Autowired
	private ReviewMapper reviewMapper;
	
	@Override
	public List<ReviewDTO> getReviewList() {
		return reviewMapper.getReviewList();
	}

	@Override
	public int replyWritePost(ReviewDTO reviewDTO) {
		return reviewMapper.replyWritePost(reviewDTO);
	}



	
}

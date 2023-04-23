package com.project.root.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.root.mybatis.review.ReviewMapper;
import com.project.root.review.dto.ReviewDTO;

@Service
public class ReviewServiceImpl implements ReviewService{

	@Autowired
	private ReviewMapper reviewMapper;
	
	// 리뷰 전체 불러오기
	@Override
	public List<ReviewDTO> getReviewList() {
		return reviewMapper.getReviewList();
	}

	// 리뷰 작성
	@Override
	public int replyWritePost(ReviewDTO reviewDTO) {
		return reviewMapper.replyWritePost(reviewDTO);
	}

	// 특정 리뷰 불러오기
	@Override
	public int getSerarchReviewList(ReviewDTO reviewDTO) {		
		return reviewMapper.getSerarchReviewList(reviewDTO);
	}

	// 리뷰 지우기
	@Override
	public int deleteReview(ReviewDTO reviewDTO) {
		return reviewMapper.deleteReview(reviewDTO);
	}
	
}

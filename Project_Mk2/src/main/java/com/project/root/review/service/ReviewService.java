package com.project.root.review.service;

import java.util.List;

import com.project.root.review.dto.ReviewDTO;

public interface ReviewService {
	
	public List<ReviewDTO> getReviewList();
	public List<ReviewDTO> replyList(ReviewDTO reviewDTO);
	public int replyWritePost(ReviewDTO reviewDTO);
}

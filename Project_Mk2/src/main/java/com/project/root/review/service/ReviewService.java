package com.project.root.review.service;

import java.util.List;

import com.project.root.review.dto.ReviewDTO;
import com.project.root.suggestions.dto.SuggestionsDTO;

public interface ReviewService {
	
	public List<ReviewDTO> getReviewList();
	public int replyWritePost(ReviewDTO reviewDTO);
	public int sugWrite(SuggestionsDTO suggestionsDTO);
}

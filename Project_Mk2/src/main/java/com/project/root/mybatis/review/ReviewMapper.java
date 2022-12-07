package com.project.root.mybatis.review;

import java.util.List;

import com.project.root.review.dto.ReviewDTO;
import com.project.root.suggestions.dto.SuggestionsDTO;

public interface ReviewMapper {

	public List<ReviewDTO> getReviewList();
	public int replyWritePost(ReviewDTO reviewDTO);

	
}

package com.project.root.mybatis.review;

import java.util.List;

import com.project.root.review.dto.ReviewDTO;

public interface ReviewMapper {

	public List<ReviewDTO> getReviewList();
	public List<ReviewDTO> replyList(ReviewDTO reviewDTO);
	public int replyWritePost(ReviewDTO reviewDTO);
}

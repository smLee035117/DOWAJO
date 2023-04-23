package com.project.root.mybatis.review;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.project.root.review.dto.ReviewDTO;

public interface ReviewMapper {
	// 리뷰 전체 불러오기
	public List<ReviewDTO> getReviewList();
	// 리뷰 작성
	public int replyWritePost(ReviewDTO reviewDTO);
	// 특정 리뷰 불러오기
	public int getSerarchReviewList(ReviewDTO reviewDTO);
	// 리뷰 삭제하기
	public int deleteReview(ReviewDTO reviewDTO);
}

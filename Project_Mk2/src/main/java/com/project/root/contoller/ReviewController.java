package com.project.root.contoller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.root.review.dto.ReviewDTO;
import com.project.root.review.service.ReviewService;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	
	@RequestMapping(value = "reviewSelect", method = RequestMethod.GET)
	@ResponseBody
	public List<ReviewDTO> getRevicwList(){
		System.out.println(reviewService.getReviewList());
		return reviewService.getReviewList();
	}
	@RequestMapping(value = "replyWritePost", method = RequestMethod.POST)
	@ResponseBody
	public int replyWriePost(ReviewDTO reviewDTO){
		System.out.println("re="+reviewDTO);
		return reviewService.replyWritePost(reviewDTO);
	}
}

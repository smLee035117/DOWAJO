package com.project.root.contoller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.root.review.dto.ReviewDTO;
import com.project.root.review.service.ReviewService;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	
	@RequestMapping(value = "reviewSelect", method = RequestMethod.GET)
	@ResponseBody
	public List<ReviewDTO> getReviewList(){
		return reviewService.getReviewList();
	}	
	
	@RequestMapping(value = "replyWritePost", method = RequestMethod.POST)
	@ResponseBody
	public int replyWriePost(ReviewDTO reviewDTO){
		return reviewService.replyWritePost(reviewDTO);
	}
	
	@RequestMapping(value = "survivalWritePost", method = RequestMethod.POST)
	@ResponseBody
	public int survivalWriePost(ReviewDTO reviewDTO,@RequestParam String maxCount){
		int result = 0;
		if(reviewService.getSerarchReviewList(reviewDTO) >= Integer.parseInt(maxCount)) {
			//수용인원보다 많은 인원이 작성할 경우 숫자 2 return
			result = 2;
		}else {
			result = reviewService.replyWritePost(reviewDTO);
		}
		return result;
	}
	
	
}

package com.project.root.contoller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.root.review.dto.ReviewDTO;
import com.project.root.review.service.ReviewService;
import com.project.root.util.JavaGMailSend;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	
	@RequestMapping(value = "reviewSelect", method = RequestMethod.GET)
	@ResponseBody
	public List<ReviewDTO> getReviewList(){
		System.out.println(reviewService.getReviewList());
		return reviewService.getReviewList();
	}	
	
	@RequestMapping(value = "replyWritePost", method = RequestMethod.POST)
	@ResponseBody
	public int replyWriePost(ReviewDTO reviewDTO){
		return reviewService.replyWritePost(reviewDTO);
	}
	
	@RequestMapping(value = "mailSend" , method = RequestMethod.POST )
	public int mailSend(String text) {
		return JavaGMailSend.mailSend(text);
	}
}

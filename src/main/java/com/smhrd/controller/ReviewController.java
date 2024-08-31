package com.smhrd.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.smhrd.entity.Member;
import com.smhrd.entity.Review;
import com.smhrd.repository.ReviewRepository;

@Controller
public class ReviewController {

	@Autowired
	ReviewRepository repo;
	
	@RequestMapping("/sendreview")
	public String writeReview(Review review) {
		repo.save(review);
		return "redirect:/main";
	}
	
	
	
	
	
}

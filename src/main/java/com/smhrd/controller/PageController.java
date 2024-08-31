package com.smhrd.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.smhrd.entity.Member;
import com.smhrd.entity.Movie;
import com.smhrd.entity.Review;
import com.smhrd.repository.MovieRepository;
import com.smhrd.repository.ReviewRepository;

import jakarta.servlet.http.HttpSession;



@Controller
public class PageController {
	
	@Autowired
	private MovieRepository repo;
	
	@Autowired
	private ReviewRepository reviewrepo;
	
	@RequestMapping("/faceAnalysis")
	public String goFaceAnalysis(HttpSession session) {
		
		Object a= session.getAttribute("user");
		
		if(a==null) {
			session.setAttribute("msg", "로그인하지 않을시 기록 저장이 되지 않습니다.");
			
		}
		return "faceAnalysis";
	}

	/*
	 * @RequestMapping("/faceResult") public String goFaceResult() { return
	 * "faceResult"; }
	 */
	
	@RequestMapping("/join")
	public String goJoin() {
		return "join";
	}
	
	@RequestMapping("/login")
	public String goLogin() {
		return "login";
	}
	
	@RequestMapping("/main")
	public String goMain(HttpSession session) {
		List<Movie> mo =repo.findAll();
		session.setAttribute("movieList", mo);
		
		return "main";
	}
	
	@RequestMapping("/myPage")
	public String goMypage() {
		return "myPage";
	}
	
	@RequestMapping("/reviewTable")
	public String goReviewTable(String email,HttpSession session) {
		
		
//		List<Review> re = reviewrepo.findAll();
		List<Review> re1 = reviewrepo.findByEmail(email);
		
		session.setAttribute("reviewList", re1);
		
		
		return "reviewTable";
	}
	
	@RequestMapping("/searchAnalysis")
	public String goSearchAnalysis() {
		return "searchAnalysis";
	}

	@RequestMapping("/searchResult")
	public String goSearchResult() {
		return "searchResult";
	}
	
	@RequestMapping("/tagMovie")
	public String goTagMovie() {
		return "tagMovie";
	}
	
//	헤더 푸터 이식 후 삭제 
	@RequestMapping("/header")
	public String goHeader() {
		return "header";
	}

	@RequestMapping("/footer")
	public String gofooter() {
		return "footer";
	}
	
	
	
}

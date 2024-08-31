package com.smhrd.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.smhrd.entity.Search;
import com.smhrd.repository.SearchRepository;

@Controller
public class CommentController {

	
	@Autowired
	SearchRepository repo;
	
	@RequestMapping("/sAdata")
	public String sadata(String email, String movietitle, String emotionname, String emotioncount) {
//		System.out.println("e"+email);
//		System.out.println("t"+movietitle);
//		System.out.println("n"+emotionname);
//		System.out.println("c"+emotioncount);

		
		String[] emotions = emotionname.replaceAll("[\\[\\]]", "").split(",\\s*");
		String[] counts = emotioncount.replaceAll("[\\[\\]]", "").split(",\\s*");
//		
//
//		// 결과 출력
//		for (int i = 0; i < emotions.length; i++) {
//		    System.out.println("Emotion: " + emotions[i] + ", Count: " + counts[i]);
//		}
		
		Search search = new Search();
		search.setEmail(email);
		search.setMovietitle(movietitle);
		search.setFear(Integer.parseInt(counts[0]));
		search.setJoy(Integer.parseInt(counts[1]));
		search.setSurprise(Integer.parseInt(counts[2]));
		search.setSadness(Integer.parseInt(counts[3]));
		search.setBoredom(Integer.parseInt(counts[4]));
		search.setPain(Integer.parseInt(counts[5]));
		search.setDisgust(Integer.parseInt(counts[6]));
		

		repo.save(search);
		
		return"main";
	}
	
	@RequestMapping("serch2")
	public String serch2(Integer resultid,Model model) {
		
		Search search = repo.findByResultid(resultid);
		model.addAttribute("serch2", search);
		
		
		return "searchAnalysis2";
	}
	
	
	
}

package com.smhrd.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.smhrd.entity.Tag;
import com.smhrd.repository.TagRepository;

@Controller
public class TagController {

	@Autowired
	TagRepository repo;
	
	@RequestMapping("/fear")
	public String fear(String fear,Model model){
		int emotion = Integer.parseInt(fear);
		List<Tag> code = repo.findMoviecodeByFear(emotion);
		model.addAttribute("code", code);
		return "tagMovie";
	}
	@RequestMapping("/joy")
	public String joy(String joy,Model model){
		int emotion = Integer.parseInt(joy);
		List<Tag> code = repo.findMoviecodeByJoy(emotion);
		model.addAttribute("code", code);
		return "tagMovie";
	}
	@RequestMapping("/surprise")
	public String surprise(String surprise,Model model){
		int emotion = Integer.parseInt(surprise);
		List<Tag> code = repo.findMoviecodeBySurprise(emotion);
		model.addAttribute("code", code);
		return "tagMovie";
	}
	@RequestMapping("sadness")
	public String sadness(String sadness,Model model){
		int emotion = Integer.parseInt(sadness);
		List<Tag> code = repo.findMoviecodeBySadness(emotion);
		model.addAttribute("code", code);
		return "tagMovie";
	}
	@RequestMapping("/boredom")
	public String boredom(String boredom,Model model){
		int emotion = Integer.parseInt(boredom);
		List<Tag> code = repo.findMoviecodeByBoredom(emotion);
		model.addAttribute("code", code);
		return "tagMovie";
	}
	@RequestMapping("/pain")
	public String pain(String pain,Model model){
		int emotion = Integer.parseInt(pain);
		List<Tag> code = repo.findMoviecodeByPain(emotion);
		model.addAttribute("code", code);
		return "tagMovie";
	}
	@RequestMapping("/disgust")
	public String disgust(String disgust,Model model){
		int emotion = Integer.parseInt(disgust);
		List<Tag> code = repo.findMoviecodeByDisgust(emotion);
		model.addAttribute("code", code);
		return "tagMovie";
	}
	@RequestMapping("/interest")
	public String interest(String interest,Model model){
		int emotion = Integer.parseInt(interest);
		List<Tag> code = repo.findMoviecodeByInterest(emotion);
		model.addAttribute("code", code);
		return "tagMovie";
	}
	@RequestMapping("/disappointment")
	public String disappointment(String disappointment,Model model){
		int emotion = Integer.parseInt(disappointment);
		List<Tag> code = repo.findMoviecodeByDisappointment(emotion);
		model.addAttribute("code", code);
		return "tagMovie";
	}
	
}

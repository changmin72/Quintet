package com.smhrd.controller;


import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.smhrd.entity.Member;
import com.smhrd.repository.MemberRepository;

@Controller
public class MemberController {
	
	@Autowired
	MemberRepository repo;
	@RequestMapping("/joinmember")
	public String join(Member member) {
		repo.save(member);
		return "redirect:/main";
	}

	@RequestMapping("/gologin")
	public String gologin(String email,String password,HttpSession session) {
		
		Member mem = repo.findByEmailAndPassword(email,password);
		session.setAttribute("user", mem);
		return "redirect:/main";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		
		session.removeAttribute("user"); 
		return "redirect:/main";
	}
	
	
	
}

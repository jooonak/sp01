package com.java96.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import com.java96.dto.LoginDTO;
import com.java96.dto.MemberDTO;

import lombok.extern.java.Log;

@Controller
@Log
public class LoginController {

	@GetMapping("/login")
	public void loginGET() {
		log.info("get...................................................................................................");
	}
	
	@PostMapping("/login") 
	public void loginPOST(LoginDTO dto, Model model) {
		log.info("post...................................................................................................");
		
		MemberDTO member = new MemberDTO();
		
		member.setUid(dto.getUid());
		member.setUpw(dto.getUpw());
		member.setUname("사용자"+ dto.getUid());
		
		model.addAttribute("memberDTO", member);
	}
}

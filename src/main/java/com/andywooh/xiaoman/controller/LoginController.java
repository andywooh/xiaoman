package com.andywooh.xiaoman.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;

import com.andywooh.xiaoman.bean.User;
import com.andywooh.xiaoman.service.IloginService;

@Controller
public class LoginController extends AbstractController {
	@Autowired
	private IloginService loginService;
	
	@RequestMapping("login")
	public String login(@Valid User user, Errors errors) {
		if(errors.hasErrors()) {
			return "error";
		}
		
		 boolean isloggin = loginService.login(user);
		 if	(isloggin) {
			 return "main";
		 } else {
			 return "errorpage";
		 }
	}


	// TODO
	@RequestMapping("/logout")
	public void logout(User user) {
	}
}

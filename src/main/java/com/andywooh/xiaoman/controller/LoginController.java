package com.andywooh.xiaoman.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.andywooh.xiaoman.bean.User;
import com.andywooh.xiaoman.service.IloginService;

@Controller
public class LoginController extends AbstractController{
	@Autowired
	private IloginService loginService;
	
	@RequestMapping("/login")
	public String login(User user) {
		 boolean isloggin = loginService.login(user);
		 if(isloggin) {
			 return "toMainPage";
		 } else {
			 return "error";
		 }
	}


	// TODO
	@RequestMapping("/logout")
	public void logout(User user) {
	}
}

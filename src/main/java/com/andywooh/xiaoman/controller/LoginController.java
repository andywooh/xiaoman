package com.andywooh.xiaoman.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import com.andywooh.xiaoman.bean.User;
import com.andywooh.xiaoman.service.IloginService;

@Controller
public class LoginController extends AbstractController{
	@Autowired
	private IloginService loginService;
	
	@RequestMapping("login")
	@ResponseBody
	public String login(User user) {
		System.out.println("hahahhahhaha");
		 boolean isloggin = loginService.login(user);
		 if(isloggin) {
			 return "mainpage";
		 } else {
			 return "errorpage";
		 }
	}


	// TODO
	@RequestMapping("/logout")
	public void logout(User user) {
	}
}

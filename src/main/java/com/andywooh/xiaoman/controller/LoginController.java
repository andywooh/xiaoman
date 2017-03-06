package com.andywooh.xiaoman.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.andywooh.xiaoman.bean.User;
import com.andywooh.xiaoman.service.IloginService;

@Controller
public class LoginController extends AbstractController {
	
	@Autowired
	private IloginService loginService;
	
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(User user) {
		 boolean isloggin = loginService.login(user);
		 if	(isloggin) {
			 return "redirect:current/list-items";
		 } else {
			 return "errorpage";
		 }
	}


	// TODO
	@RequestMapping("/logout")
	public void logout(User user) {
	}
}

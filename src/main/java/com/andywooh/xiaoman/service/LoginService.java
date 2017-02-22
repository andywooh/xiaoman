package com.andywooh.xiaoman.service;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.andywooh.xiaoman.bean.User;

@Service
public class LoginService implements IloginService {

	public boolean login(User user) {
		// TODO Auto-generated method stub
		return false;
	}

	public void logout(HttpSession session) {
		// TODO Auto-generated method stub

	}

}

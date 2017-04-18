package com.andywooh.xiaoman.service;

import javax.servlet.http.HttpSession;

import com.andywooh.xiaoman.bean.User;

public interface IloginService {
	boolean login(User user);
	void logout(HttpSession session);
}

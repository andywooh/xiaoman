package com.andywooh.xiaoman.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.andywooh.xiaoman.bean.Category;


@Controller
@RequestMapping("/sys-config")
public class SettingsController extends AbstractController {
	
	@Autowired
//	private IloginService loginService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String listItems() {

		return "settings";

	}
	
/*	@RequestMapping(value = "categories", method = RequestMethod.GET)
	public List<Category> listCategories() {
		List<Category> categories = new ArrayList<Category>();
		categories.add(1, new Category(1, "交通"));
		categories.add(1, new Category(1, "其他"));
		return categories;

	}	*/
	@RequestMapping(value = "categories", method = RequestMethod.GET)
	@ResponseBody
	public List<Category> listCategories() {
		List<Category> categories = new ArrayList<Category>();
		categories.add(new Category(1, "交通"));
		categories.add(new Category(1, "其他"));
		return categories;

	}		
}

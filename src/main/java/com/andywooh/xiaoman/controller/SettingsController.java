package com.andywooh.xiaoman.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.google.common.collect.Lists;
import com.andywooh.xiaoman.bean.Category;


@Controller
@RequestMapping("/sys-config")
public class SettingsController extends AbstractController {
	
//	private IloginService loginService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String listItems() {

		return "settings";

	}
	
	@RequestMapping(value = "categories", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public List<Category> getCategories() {
		List<Category> categories = Lists.newArrayList();
		categories.add(new Category(1001, "交通"));
		categories.add(new Category(1002, "其他"));
		categories.add(new Category(1003, "数码"));
		return categories;
	}
	
}

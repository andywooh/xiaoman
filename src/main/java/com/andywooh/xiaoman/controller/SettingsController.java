package com.andywooh.xiaoman.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.andywooh.xiaoman.bean.Category;
import com.andywooh.xiaoman.service.CategoryService;


@Controller
@RequestMapping("/sys-config")
public class SettingsController extends AbstractController {
	
	@Autowired
	private CategoryService categoryService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String listItems(Model model) {
		 List<Category> categories = getCategories();
		 model.addAttribute("categories", categories);
		return "settings";

	}
	
	@RequestMapping(value = "categories", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public List<Category> getCategories() {
		return categoryService.getCategories();
	}
	
}

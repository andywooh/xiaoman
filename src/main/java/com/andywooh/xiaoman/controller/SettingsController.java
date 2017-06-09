package com.andywooh.xiaoman.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.andywooh.xiaoman.bean.Category;
import com.andywooh.xiaoman.bean.ConsumptionDetail;
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

	@RequestMapping(value = "categories/{category-id}", method = RequestMethod.DELETE)
	@ResponseBody
	public void delItem() {
		categoryService.getCategories();
	}

	@RequestMapping(value = "/category", method = RequestMethod.POST)
	@ResponseBody 
	public void addCategory(@RequestBody Category category) {
		Integer categoryId = 1021;
		category.setCategoryId(categoryId);
		categoryService.addCategory(category);
	}
		
}

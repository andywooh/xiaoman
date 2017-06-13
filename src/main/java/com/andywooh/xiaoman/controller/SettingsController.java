package com.andywooh.xiaoman.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	public String listItems(@RequestParam(required = false) String refresh, Model model) {
		List<Category> categories = getCategories();
		model.addAttribute("categories", categories);
		if ("yes".equals(refresh)) {
			return "settings_table_tmp";
		} else {
			return "settings";
		}

	}
	
	@RequestMapping(value = "categories", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public List<Category> getCategories() {
		return categoryService.getCategories();
	}

	@RequestMapping(value = "categories/{id}", method = RequestMethod.DELETE)
	@ResponseBody
	public void delItem(@PathVariable final int id) {
		categoryService.deleteCategoryById(id);
	}

	@RequestMapping(value = "/category", method = RequestMethod.POST)
	@ResponseBody 
	public void addCategory(@RequestBody Category category) {
		Integer categoryId = categoryService.getNextCategoryId();
		category.setCategoryId(categoryId);
		categoryService.addCategory(category);
	}
		
}

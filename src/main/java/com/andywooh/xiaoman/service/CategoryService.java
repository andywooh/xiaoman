package com.andywooh.xiaoman.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.andywooh.xiaoman.bean.Category;
import com.andywooh.xiaoman.dao.CategoryDao;

@Service
public class CategoryService {
	@Autowired
	private CategoryDao categoryDao;
	
	public List<Category> getCategories() {
		
		return categoryDao.getCategories();
	}
	
	public List<Integer> getCategoryIds() {
		
		return categoryDao.getCategoryIds();
	}

	public void addCategory(Category category) {
		categoryDao.addCategory(category);
	}
}

package com.andywooh.xiaoman.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.andywooh.xiaoman.bean.Category;
import com.andywooh.xiaoman.dao.CategoryDao;

@Service
public class CategoryService {
	@Autowired
	private CategoryDao CategoryDao;
	
	public List<Category> getCategories() {
		
		return CategoryDao.getCategories();
	}
}

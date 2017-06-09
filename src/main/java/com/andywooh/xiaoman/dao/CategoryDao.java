package com.andywooh.xiaoman.dao;

import java.util.List;

import com.andywooh.xiaoman.bean.Category;
import com.andywooh.xiaoman.util.MapperMark;


@MapperMark
public interface CategoryDao
{
	public List<Category> getCategories();
	public List<Integer> getCategoryIds();
	public void addCategory(Category category);
	
}

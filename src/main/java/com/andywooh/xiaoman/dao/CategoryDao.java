package com.andywooh.xiaoman.dao;

import java.util.List;

import com.andywooh.xiaoman.bean.Category;
import com.andywooh.xiaoman.util.MapperMark;


@MapperMark
public interface CategoryDao
{
	public List<Category> getCategories();
	public Category getCategoryById(int id);
	public List<Integer> getCategoryIds();
	public Integer getNextCategoryId();
	public void addCategory(Category category);
	public void deleteCategoryById(int id);
	public void updateCategoryById(int id);
}

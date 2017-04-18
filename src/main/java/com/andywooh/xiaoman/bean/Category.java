package com.andywooh.xiaoman.bean;

public class Category {
	private int id;
	private int categoryId;
	private String categoryName;
	
	public int getId() {
		return id;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
}

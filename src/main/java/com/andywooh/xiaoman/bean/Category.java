package com.andywooh.xiaoman.bean;

public class Category {
	private int id;
	private Integer categoryId;
	private String categoryName;

	public int getId() {
		return id;
	}

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}
	
	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public Category() {
		super();
	}	
	
//	public Category(int id, int categoryId, String categoryName) {
//		super();
//		this.id = id;
//		this.categoryId = categoryId;
//		this.categoryName = categoryName;
//	}
//	
//	public Category(int categoryId) {
//		super();
//		this.categoryId = categoryId;
//	}
}

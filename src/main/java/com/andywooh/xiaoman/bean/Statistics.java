package com.andywooh.xiaoman.bean;

public class Statistics implements Comparable<Statistics> {
	
	private String categoryName;
	private Double amount;
	
	public Statistics() {
		
	}
	
	public Statistics(String categoryName,  Double amount) {
		this.categoryName = categoryName;
		this.amount = amount;
	}	
	
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public Double getAmount() {
		return amount;
	}
	public void setAmount(Double amount) {
		this.amount = amount;
	}

//	@Override
	public int compareTo(Statistics o) {
		if (this.getAmount() > o.getAmount()) {
			return -1;
		} else if (this.getAmount() < o.getAmount()) {
			return 1;
		} else {
			return 0;
		}
	}
	
	

}

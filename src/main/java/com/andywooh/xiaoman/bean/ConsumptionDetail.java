package com.andywooh.xiaoman.bean;

import com.andywooh.xiaoman.util.CustomDoubleSerializer;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

/**
 * 
 * @author wuuuxjia
 *
 */
public class ConsumptionDetail
{
	private int id;
	private String occurDate;
	private String note;
	private Double amount;
	private Category category;
	
	public Integer getId() 
	{
		return id;
	}
	public void setId(Integer id) 
	{
		this.id = id;
	}

	public String getOccurDate() 
	{
		return occurDate;
	}
	public void setOccurDate(String occurDate) 
	{
		this.occurDate = occurDate;
	}

	public String getNote()
	{
		return note;
	}
	public void setNote(String note) 
	{
		this.note = note;
	}
//	@JsonSerialize(using = CustomDoubleSerializer.class)
	public Double getAmount() {
		return amount;
	}
	
	public void setAmount(Double amount) 
	{
		this.amount = amount;
	}

	public Category getCategory() 
	{
		return category;
	}
	
	public void setCategory(Category category) 
	{
		this.category = category;
	}
	
	@Override
	public String toString() {
		return "ConsumptionDetail [id=" + id + ", occurDate=" + occurDate
				+ ", note=" + note + ", amount=" + amount + ", category="
				+ category + "]";
	}
}

package com.andywooh.xiaoman.bean;

/**
 * 分页对象
 * @author andywooh
 * @createdate 2016-1-31
 */
public class Page 
{
	/**
	 * 当前页，默认为第1页
	 */
	private Integer page = 1;
	/**
	 * 每页的记录数，默认为每页15条记录
	 */
	private Integer pageSize = 15;
	/**
	 * 总页数
	 */
	private Integer totalPage = 1;
	
	
	/**
	 * 计算每页的第一条记录
	 * @return 每页的第一条记录号
	 */
	public Integer getBegin()
	{
		return (page - 1) * pageSize;
	}
	
	
	/**
	 * 计算每页的最后一条记录
	 * @return 每页的最后一条记录
	 */
	public Integer getEnd()
	{
		return page * pageSize + 1;
	}
	
	public Integer getPage() 
	{
		return page;
	}
	
	public void setPage(Integer page) 
	{
		this.page = page;
	}
	
	public Integer getPageSize() 
	{
		return pageSize;
	}
	
	public void setPageSize(Integer pageSize) 
	{
		this.pageSize = pageSize;
	}
	
	public Integer getTotalPage() 
	{
		return totalPage;
	}
	
	public void setTotalPage(Integer totalPage) 
	{
		this.totalPage = totalPage;
	}
	
	@Override
	public String toString() {
		return "Page [page=" + page + ", pageSize=" + pageSize + ", totalPage="
				+ totalPage + "]";
	}
}

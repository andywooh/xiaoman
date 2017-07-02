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
	private Integer currentPage = 1;
	/**
	 * 每页的记录数，默认为每页20条记录
	 */
	private Integer pageSize = 20;
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
		return (currentPage - 1) * pageSize;
	}
	
	
	/**
	 * 计算每页的最后一条记录
	 * @return 每页的最后一条记录
	 */
	public Integer getEnd()
	{
		return currentPage * pageSize + 1;
	}
	
	public Integer getCurrentPage() {
		return currentPage;
	}


	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
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
		return "Page [currentPage=" + currentPage + ", pageSize=" + pageSize + ", totalPage="
				+ totalPage + "]";
	}
}

package com.andywooh.xiaoman.dao;

import java.util.List;
import java.util.Map;
import com.andywooh.xiaoman.bean.ConsumptionDetail;
import com.andywooh.xiaoman.bean.Page;
import com.andywooh.xiaoman.util.MapperMark;

@MapperMark
public interface ConsumptionDetailDao
{
	public List<ConsumptionDetail> getConsumptionDetails(Map<String, Object> condition);
	public ConsumptionDetail getConsumptionDetailById(int id);
	public void addConsumptionDetails(List<ConsumptionDetail> cds);
	public void delConsumptionDetailById(int id);
	public void updateConsumptionDetailById(ConsumptionDetail cd);
}

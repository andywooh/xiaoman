package com.andywooh.xiaoman.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.andywooh.xiaoman.bean.ConsumptionDetail;
import com.andywooh.xiaoman.bean.Statistics;
import com.andywooh.xiaoman.bean.Page;
import com.andywooh.xiaoman.dao.ConsumptionDetailDao;

@Service
public class ConsumptionDetailService {
	
	@Autowired
	private ConsumptionDetailDao consumptionDetailDao;
	
	public List<ConsumptionDetail> getConsumptionDetails(Map<String, Object> condition){
		return consumptionDetailDao.getConsumptionDetails(condition);
	}

	public ConsumptionDetail getConsumptionDetailById(int id){
		return consumptionDetailDao.getConsumptionDetailById(id);
	}
	
	public void addConsumptionDetails(List<ConsumptionDetail> cds) {
		consumptionDetailDao.addConsumptionDetails(cds);
	}
	
	public void delConsumptionDetailById(int id){
		consumptionDetailDao.delConsumptionDetailById(id);
	}
	
	public void updateConsumptionDetailById(ConsumptionDetail cd){
		consumptionDetailDao.updateConsumptionDetailById(cd);
	}	
	
	public List<Statistics> getStatistics(String month) {
		return consumptionDetailDao.getStatistics(month);
	}
	
	public Double getTotalAmountByCondition(Map<String, Object> condition) {
		return consumptionDetailDao.getTotalAmountByCondition(condition);
	}
	
	public int getTotalRowstByCondition(Map<String, Object> condition) {
		return consumptionDetailDao.getTotalRowstByCondition(condition);
	}
}

package com.andywooh.xiaoman.validator;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.andywooh.xiaoman.bean.ConsumptionDetail;
import com.andywooh.xiaoman.service.CategoryService;
import com.andywooh.xiaoman.util.NumberUtil;

@Component
public class ConsumptionDetailValidator implements Validator {
	
	@Autowired
	private CategoryService categoryService;
	
	
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return ConsumptionDetail.class.equals(clazz);
	}

	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		List<Integer> categoryIds = categoryService.getCategoryIds();
		ConsumptionDetail cd = (ConsumptionDetail) target;
		
		String occurDate = cd.getOccurDate();
		String note = cd.getNote();
		String amount = Double.toString(cd.getAmount());
		Integer categoryId = cd.getCategory().getCategoryId();

		if (!isDate(occurDate) 
				|| StringUtils.isEmpty(note) 
				|| StringUtils.isEmpty(amount) 
				|| !NumberUtil.isPositiveNumber(amount)
				|| !categoryIds.contains(categoryId)) {
			errors.reject("Data invalid.");
		}
	}
	
	private boolean isDate(String occurDate) {
		if (StringUtils.isEmpty(occurDate)) {
			return false;
		}
		Date date = null;
		try {
		    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		    date = sdf.parse(occurDate);
		    if (!occurDate.equals(sdf.format(date))) {
		        date = null;
		    }
		} catch (ParseException ex) {
			
		}
		if (date == null) {
		    return false; // 不是日期
		} else {
		    return true;
		}
	}


}

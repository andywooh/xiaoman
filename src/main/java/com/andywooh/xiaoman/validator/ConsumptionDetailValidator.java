package com.andywooh.xiaoman.validator;

import java.util.ArrayList;

import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.andywooh.xiaoman.bean.ConsumptionDetail;
import com.andywooh.xiaoman.util.NumberUtil;

@Component
public class ConsumptionDetailValidator implements Validator {
	
	private static final int NOTE_MAX_LENTH = 20;
	private static final int NOTE_MIN_LENTH = 4;
	private static final int CATEGORY_ID_LENGTH = 4;
	
	
	@Override
	public boolean supports(Class<?> clazz) {
		return ConsumptionDetail.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ConsumptionDetail cd = (ConsumptionDetail) target;
		
		String occurDate = cd.getOccurDate();
		String note = cd.getNote();
		String amount = Double.toString(cd.getAmount());
		String categoryId = Integer.toString(cd.getCategory().getCategoryId());
		
		if (!StringUtils.isEmpty(occurDate) && !StringUtils.isEmpty(note) && !StringUtils.isEmpty(amount) 
				&& note.length() <= NOTE_MIN_LENTH && note.length() >= NOTE_MAX_LENTH
				&& NumberUtil.isPositiveNumber(amount)
				&& categoryId.length() == CATEGORY_ID_LENGTH) {
			errors.rejectValue("note", "Data invalid.");
		}
	}

}

package com.andywooh.xiaoman.controller;

import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.andywooh.xiaoman.bean.ConsumptionDetail;
import com.andywooh.xiaoman.service.ConsumptionDetailService;
import com.andywooh.xiaoman.validator.ConsumptionDetailValidator;
import com.google.common.collect.Maps;


@Controller
@RequestMapping(value = "history")
public class HistoryController extends AbstractController {
	
	private static final String ERROR_INFO = "INVALID";
	@Autowired
	private ConsumptionDetailValidator validator;
	
	@InitBinder("consumptionDetail")
	private void initBinder(WebDataBinder binder) {
		binder.setValidator(validator);
	}
	
	@Autowired
	private ConsumptionDetailService consumptionDetailService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String listItems(Model model) {
		List<ConsumptionDetail> result = consumptionDetailService.getConsumptionDetails(null);
		model.addAttribute("result", result);
		return "history_items";
	}
	
	@RequestMapping(value = "/consumption-details", method = RequestMethod.GET)
	public String getItemsByCondition(@RequestParam(required = true) String month, @RequestParam(required = true) String keyWord, Model model) {
		Map<String, Object> condition = Maps.newHashMap();
		if (StringUtils.isEmpty(month)) {
			month = null;
		}
		condition.put("month", month);
		condition.put("keyWord", keyWord);
		List<ConsumptionDetail> result = consumptionDetailService.getConsumptionDetails(condition);
		model.addAttribute("result", result);
		return "table_tmp";
	}
	
	@RequestMapping(value = "/consumption-details/{id}", method = RequestMethod.DELETE)
	@ResponseBody
	public void delConsumptionDetailById(@PathVariable final int id) {
		consumptionDetailService.delConsumptionDetailById(id);
	}	
	
	@RequestMapping(value = "/consumption-details/{id}", method = RequestMethod.GET)
	@ResponseBody
	public ConsumptionDetail getConsumptionDetailById(@PathVariable final int id) {
		return consumptionDetailService.getConsumptionDetailById(id);
	}	
	
	@RequestMapping(value = "/consumption-details/{id}", method = RequestMethod.PUT)
	@ResponseBody
	public String updateConsumptionDetailById(@PathVariable final int id, @RequestBody @Valid ConsumptionDetail cd, BindingResult bindingResult) {
		if (bindingResult.hasErrors()) {
			return ERROR_INFO;
		}
		consumptionDetailService.updateConsumptionDetailById(cd);
		return null;
	}	
}

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
import com.andywooh.xiaoman.bean.Page;
import com.andywooh.xiaoman.service.ConsumptionDetailService;
import com.andywooh.xiaoman.util.MonthUtil;
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
	public String listItems(@RequestParam(required = false) String toPage,
							Model model) {
		if (toPage != null) {
			
			Map<String, Object> condition4CDs = Maps.newHashMap();
			buidModel(condition4CDs, toPage, null, model);
			return "history_table_tmp";
		}
		Map<String, Object> condition4CDs = Maps.newHashMap();
		buidModel(condition4CDs, "1", null, model);
		return "history";
	}
	
	private void buidModel(Map<String, Object> condition4CDs, String toPage, String keyWord, Model model) {
		Page page = buildPage(toPage, keyWord);
		condition4CDs.put("keyWord", keyWord);
		condition4CDs.put("page", page);
		List<ConsumptionDetail> result = consumptionDetailService.getConsumptionDetails(condition4CDs);
		
		model.addAttribute("result", result);
		model.addAttribute("page", page);
	}
	
	private Page buildPage(String toPage, String keyWord) {
		Map<String, Object> condition = Maps.newHashMap();
		String currentMonth =  MonthUtil.getCurrentMonth();
		condition.put("currentMonth", currentMonth);
		condition.put("keyWord", keyWord);
		
		Page page = new Page();
		page.setCurrentPage(Integer.valueOf(toPage)); // setCurrentPage是为了分页中需要计算开始行数
		
		int totalRows = consumptionDetailService.getTotalRowstByCondition(condition);
		int totalPage = 1;
		if(totalRows % page.getPageSize() == 0) {
			totalPage = totalRows/page.getPageSize();
		} else {
			totalPage = totalRows/page.getPageSize() + 1;
		}
		
		page.setTotalPage(totalPage);
		return page;
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

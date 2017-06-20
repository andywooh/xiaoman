package com.andywooh.xiaoman.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.commons.collections.CollectionUtils;
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
import com.andywooh.xiaoman.bean.CurrentStatistics;
import com.andywooh.xiaoman.bean.Page;
import com.andywooh.xiaoman.service.CategoryService;
import com.andywooh.xiaoman.service.ConsumptionDetailService;
import com.andywooh.xiaoman.util.MonthUtil;
import com.andywooh.xiaoman.validator.ConsumptionDetailValidator;
import com.google.common.collect.Maps;

import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;


@Controller
public class CurrentController extends AbstractController {
	
	@Autowired
	private ConsumptionDetailService consumptionDetailService;
	@Autowired
	private CategoryService categoryService;

	@Autowired
	private ConsumptionDetailValidator validator;
	
	@InitBinder("consumptionDetail")
	private void initBinder(WebDataBinder binder) {
		binder.setValidator(validator);
	}
	
	private static final String ERROR_INFO = "INVALID";

    @ApiOperation(value = "当月", notes = "查询当月数据")  
    @ApiImplicitParam(name = "toPage", value = "跳转到某页", required = false, dataType = "String")  
	@RequestMapping(value = "current", method = RequestMethod.GET)
	public String current(@RequestParam(required = false) String toPage, Model model) {
		
		Map<String, Object> condition = Maps.newHashMap();
		String currentMonth =  MonthUtil.getCurrentMonth();
		condition.put("currentMonth", currentMonth);
		
		if (toPage == null) { // 点击当月
			Page page = buildPage("1");
			condition.put("page", page);
			model.addAttribute("page", page);
		} else { // 点击页码
			Page page = buildPage(toPage);
			condition.put("page", page);
			model.addAttribute("page", page);
		}
		
		Map<String, Object> condition2 = Maps.newHashMap();
		condition2.put("currentMonth", currentMonth);
		condition2.put("keyWord", null);
		
		List<CurrentStatistics> currentStatistics = consumptionDetailService.getCurrentStatistics(currentMonth);
		
		List<ConsumptionDetail> result = consumptionDetailService.getConsumptionDetails(condition);
		
		Double totalAmount = consumptionDetailService.getTotalAmountByCondition(condition2);
		
		model.addAttribute("result", result);
		model.addAttribute("currentStatistics", currentStatistics);
		model.addAttribute("totalAmount", totalAmount);
		
		if (toPage == null) { // 点击当月，整页刷新
			return "current";
		} else {
			return "table_tmp"; // 翻页，局部刷新
		}
	}
	
	private Page buildPage(String toPage) {
		Map<String, Object> condition = Maps.newHashMap();
		String currentMonth =  MonthUtil.getCurrentMonth();
		condition.put("currentMonth", currentMonth);
		
		Page page = new Page();
		page.setCurrentPage(Integer.valueOf(toPage));
		condition.put("page", page);
		
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
	
	
	@RequestMapping(value = "/consumption-details/{id}", method = RequestMethod.GET)
	@ResponseBody
	public ConsumptionDetail getConsumptionDetailById(@PathVariable final int id) {
		ConsumptionDetail cd = consumptionDetailService.getConsumptionDetailById(id);
		return cd;
	}
	
	
	@RequestMapping(value = "current/items", method = RequestMethod.GET)
	public String getConsumptionDetailsByCondition(@RequestParam(required = false) String keyWord, Model model) {
		if(StringUtils.isEmpty(keyWord)) {
			// TODO
			current(null ,model);
		}
		Map<String, Object> condition = Maps.newHashMap();
		condition.put("keyWord", keyWord);
		condition.put("currentMonth", MonthUtil.getCurrentMonth());

		List<ConsumptionDetail> result = consumptionDetailService.getConsumptionDetails(condition);
		model.addAttribute("result", result);
		return "table_tmp";
	}

	@RequestMapping(value = "/consumption-details", method = RequestMethod.POST)
	@ResponseBody // 添加记录完成后，总是去找consumption-details.jsp这个默认的视图，为解决此问题添加@ResponseBody
	public String addConsumptionDetails(@RequestBody List<ConsumptionDetail> cds, BindingResult bindingResult, HttpServletRequest req) {
		if (CollectionUtils.isEmpty(cds)) {
			return null;
		}

		for (ConsumptionDetail cd : cds) {
			validator.validate(cd, bindingResult);
		}
		if (bindingResult.hasErrors()) {
			return ERROR_INFO;
		} else {
			consumptionDetailService.addConsumptionDetails(cds);
			return null;
		}
	}
	
	@RequestMapping(value = "/consumption-details/{id}", method = RequestMethod.DELETE)
	@ResponseBody
	public void delConsumptionDetailById(@PathVariable final int id) {
		consumptionDetailService.delConsumptionDetailById(id);
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

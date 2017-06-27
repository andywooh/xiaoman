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
@RequestMapping(value = "/current")
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

	@RequestMapping(method = RequestMethod.GET)
	public String getConsumptionDetails12(Model model) {
		
		return getConsumptionDetails1(null, null, null, model);
	}
	
	
//  @ApiOperation(value = "当月", notes = "查询当月数据")  
//  @ApiImplicitParam(name = "toPage", value = "跳转到某页", required = false, dataType = "String")  
	@RequestMapping(value = "/consumption-details", method = RequestMethod.GET)
	public String getConsumptionDetails1(@RequestParam(required = false) String toPage,
										@RequestParam(required = false) String keyWord,
										@RequestParam(required = false) String toFirstPage,
										Model model) {
		
		String currentMonth =  MonthUtil.getCurrentMonth();
		Map<String, Object> condition4TtlAmt = Maps.newHashMap();
		Map<String, Object> condition4CDs = Maps.newHashMap();
		condition4TtlAmt.put("currentMonth", currentMonth);
		condition4CDs.put("currentMonth", currentMonth);
		
		List<CurrentStatistics> currentStatistics = consumptionDetailService.getCurrentStatistics(currentMonth);
		Double totalAmount = consumptionDetailService.getTotalAmountByCondition(condition4TtlAmt);
		
		model.addAttribute("currentStatistics", currentStatistics);
		model.addAttribute("totalAmount", totalAmount);
		
		if ("yes".equals(toFirstPage)) { // 添加、删除、修改后返回首页  局部刷新   刷新总页数

			buildModel(condition4CDs, "1", null, model);
			return "table_tmp";
			
		} else if (keyWord == null && toPage == null) { // 点击当月  整页刷新
			
			buildModel(condition4CDs, "1", null, model);
			return "current";
			
		} else if (keyWord != null && toPage == null) { // 条件查询  局部刷新  刷新总页数
			
			buildModel(condition4CDs, "1", keyWord, model);
			return "table_tmp";
		
		} else if (keyWord != null && toPage != null) { // 条件查询  再翻页  局部刷新    刷新总页数
			
			buildModel(condition4CDs, toPage, keyWord, model);
			return "table_tmp";
			
		} else if (toPage != null) { // 没有查询条件  点击页码   局部刷新
			
			buildModel(condition4CDs, toPage, null, model);
			return "table_tmp";
			
		} else {
			return null;
		}
		
	}
	
	private void buildModel(Map<String, Object> condition4CDs, String toPage, String keyWord, Model model) {
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
	
	
	@RequestMapping(value = "/consumption-details/{id}", method = RequestMethod.GET)
	@ResponseBody
	public ConsumptionDetail getConsumptionDetailById(@PathVariable final int id) {
		ConsumptionDetail cd = consumptionDetailService.getConsumptionDetailById(id);
		return cd;
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

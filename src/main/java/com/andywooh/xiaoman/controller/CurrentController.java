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

//    @ApiOperation(value = "当月", notes = "查询当月数据")  
//    @ApiImplicitParam(name = "toPage", value = "跳转到某页", required = false, dataType = "String")  
//	@RequestMapping(value = "/consumption-details", method = RequestMethod.GET)
//	public String getConsumptionDetails(@RequestParam(required = false) String toPage,
//										@RequestParam(required = false) String keyWord,
//										@RequestParam(required = false) String refresh,
//										Model model) {
//		
//		if (!StringUtils.isEmpty(keyWord)) {
//			Map<String, Object> condition = Maps.newHashMap();
//			condition.put("keyWord", keyWord);
//			condition.put("currentMonth", MonthUtil.getCurrentMonth());
//	
//			List<ConsumptionDetail> result = consumptionDetailService.getConsumptionDetails(condition);
//			model.addAttribute("result", result);
//			return "table_tmp";
//		} else {
//			Map<String, Object> condition = Maps.newHashMap();
//			String currentMonth =  MonthUtil.getCurrentMonth();
//			condition.put("currentMonth", currentMonth);
//			
//			if (toPage == null) { // 点击当月
//				Page page = buildPage("1");
//				condition.put("page", page);
//				model.addAttribute("page", page);
//			} else { // 点击页码
//				Page page = buildPage(toPage);
//				condition.put("page", page);
//				model.addAttribute("page", page);
//			}
//			
//			Map<String, Object> condition2 = Maps.newHashMap();
//			condition2.put("currentMonth", currentMonth);
//			condition2.put("keyWord", null);
//			
//			List<CurrentStatistics> currentStatistics = consumptionDetailService.getCurrentStatistics(currentMonth);
//			
//			List<ConsumptionDetail> result = consumptionDetailService.getConsumptionDetails(condition);
//			
//			Double totalAmount = consumptionDetailService.getTotalAmountByCondition(condition2);
//			
//			model.addAttribute("result", result);
//			model.addAttribute("currentStatistics", currentStatistics);
//			model.addAttribute("totalAmount", totalAmount);
//			
//			if (toPage == null && "yes".equals(refresh)) { 
//				return "table_tmp"; // 添加、修改后，局部刷新
//			} else if (toPage == null){
//				return "current"; // 点击当月，整页刷新
//			} else {
//				return "table_tmp"; // toPage = ? 翻页，局部刷新
//			}			
//		}
//	}
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
		
		if (keyWord == null && toPage == null) { // 点击当月  整页刷新
			Page page = buildPage("1", null);
			condition4CDs.put("keyWord", null);
			condition4CDs.put("page", page);
			List<ConsumptionDetail> result = consumptionDetailService.getConsumptionDetails(condition4CDs);
			
			model.addAttribute("result", result);
			model.addAttribute("page", page);
			return "current";
			
		} else if (keyWord != null && toPage == null) { // 条件查询  局部刷新  刷新总页数
			Page page = buildPage("1", keyWord);
			condition4CDs.put("keyWord", keyWord);
			condition4CDs.put("page", page);
			List<ConsumptionDetail> result = consumptionDetailService.getConsumptionDetails(condition4CDs);
			
			model.addAttribute("result", result);
			model.addAttribute("page", page);			
			return "table_tmp";
		
		} else if (keyWord != null && toPage != null) { // 条件查询  再翻页  局部刷新    刷新总页数
			Page page = buildPage(toPage, keyWord);
			condition4CDs.put("keyWord", keyWord);
			condition4CDs.put("page", page);
			List<ConsumptionDetail> result = consumptionDetailService.getConsumptionDetails(condition4CDs);
			
			model.addAttribute("result", result);
			model.addAttribute("page", page);
			return "table_tmp";
			
		} else if (toPage != null) { // 没有查询条件  点击页码   局部刷新
			Page page = buildPage(toPage, null);
			condition4CDs.put("keyWord", null);
			condition4CDs.put("page", page);
			List<ConsumptionDetail> result = consumptionDetailService.getConsumptionDetails(condition4CDs);
			
			model.addAttribute("result", result);
			model.addAttribute("page", page);
			return "table_tmp";
			
		} else { // 添加、删除、修改后返回首页  局部刷新   刷新总页数
			Page page = buildPage("1", null);
			condition4CDs.put("keyWord", null);
			condition4CDs.put("page", page);
			List<ConsumptionDetail> result = consumptionDetailService.getConsumptionDetails(condition4CDs);
			
			model.addAttribute("result", result);
			model.addAttribute("page", page);
			return "table_tmp";
		}
		
		
	}
	
	private Page buildPage(String toPage, String keyWord) {
		Map<String, Object> condition = Maps.newHashMap();
		String currentMonth =  MonthUtil.getCurrentMonth();
		condition.put("currentMonth", currentMonth);
		condition.put("keyWord", keyWord);
		
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
	
	
//	@RequestMapping(value = "consumption-details", method = RequestMethod.GET)
//	public String getConsumptionDetailsByCondition(@RequestParam(required = false) String keyWord, Model model) {
//		if(StringUtils.isEmpty(keyWord)) {
//			// TODO
//			getConsumptionDetails(null ,null, model);
//		}
//		Map<String, Object> condition = Maps.newHashMap();
//		condition.put("keyWord", keyWord);
//		condition.put("currentMonth", MonthUtil.getCurrentMonth());
//
//		List<ConsumptionDetail> result = consumptionDetailService.getConsumptionDetails(condition);
//		model.addAttribute("result", result);
//		return "table_tmp";
//	}

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

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
	public String listItems(Model model) {
		
		return getItemsByCondition(null, null, null, null, model);
		
	}
	
	@RequestMapping(value = "/consumption-details", method = RequestMethod.GET)
	public String getItemsByCondition(@RequestParam(required = false) String month, 
										@RequestParam(required = false) String keyWord, 
										@RequestParam(required = false) String toPage,
										@RequestParam(required = false) String toFirstPage,
										Model model) {
		
		Map<String, Object> condition = Maps.newHashMap();
		
//		if (toPage != null) {
//			
//			Map<String, Object> condition4CDs = Maps.newHashMap();
//			buildModel(condition4CDs, toPage, null, model);
//			return "history_table_tmp";
//		}
		month = StringUtils.isEmpty(month) ? null : month;
		if ("yes".equals(toFirstPage)) { // 添加、删除、修改后返回首页  局部刷新   刷新总页数

			buildModel(condition, "1", null, null, model);
			return "history_table_tmp";
			
		} else if (keyWord == null && toPage == null) { // 点击历史  整页刷新
			
			buildModel(condition, "1", null, null, model);
			return "history";
			
		} else if (keyWord != null && toPage == null) { // 条件查询  局部刷新  刷新总页数
			
			buildModel(condition, "1", keyWord, month, model);
			return "history_table_tmp";
		
		} else if (keyWord != null && toPage != null) { // 条件查询  再翻页  局部刷新    刷新总页数
			
			buildModel(condition, toPage, keyWord, month, model);
			return "history_table_tmp";
			
		} else if (toPage != null) { // 没有查询条件  点击页码   局部刷新
			
			buildModel(condition, toPage, null, null, model);
			return "history_table_tmp";
			
		} else {
			return null;
		}
		
	}

	private void buildModel(Map<String, Object> condition4CDs, String toPage, String keyWord, String month, Model model) {
		Page page = buildPage(toPage, keyWord, month);
		condition4CDs.put("keyWord", keyWord);
		condition4CDs.put("month", month);
		condition4CDs.put("page", page);
		List<ConsumptionDetail> result = consumptionDetailService.getConsumptionDetails(condition4CDs);
		
		model.addAttribute("result", result);
		model.addAttribute("page", page);
	}
	
	private Page buildPage(String toPage, String keyWord, String month) {
		Map<String, Object> condition = Maps.newHashMap();
		condition.put("keyWord", keyWord);
		condition.put("currentMonth", month);  // 因为根据条件计算总条数的sql中使用了currentMonth
		
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

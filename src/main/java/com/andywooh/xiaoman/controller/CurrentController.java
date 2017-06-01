package com.andywooh.xiaoman.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.andywooh.xiaoman.bean.ConsumptionDetail;
import com.andywooh.xiaoman.service.CategoryService;
import com.andywooh.xiaoman.service.ConsumptionDetailService;
import com.andywooh.xiaoman.util.MonthUtil;
import com.andywooh.xiaoman.validator.ConsumptionDetailValidator;
import com.google.common.collect.Maps;


@Controller
public class CurrentController extends AbstractController {
	
	@Autowired
	private ConsumptionDetailService consumptionDetailService;
	@Autowired
	private CategoryService categoryService;

	@Autowired
	private ConsumptionDetailValidator validator;
	
	@InitBinder
	private void initBinder(WebDataBinder binder) {
		binder.setValidator(validator);
	}

	@RequestMapping(value = "current", method = RequestMethod.GET)
	public String current(Model model) {
		Map<String, Object> condition = Maps.newHashMap();
		condition.put("currentMonth", MonthUtil.getCurrentMonth());

		List<ConsumptionDetail> result = consumptionDetailService.getConsumptionDetails(condition);
		model.addAttribute("result", result);
		return "current";

	}
	
	
	@RequestMapping(value = "/consumption-details/{id}", method = RequestMethod.GET)
	@ResponseBody
	public ConsumptionDetail getConsumptionDetailById(@PathVariable final int id) {
		return consumptionDetailService.getConsumptionDetailById(id);
	}
	
	
	@RequestMapping(value = "current/items", method = RequestMethod.GET)
	public String getConsumptionDetailsByCondition(@RequestParam(required = false) String keyWord, Model model) {
		if(StringUtils.isEmpty(keyWord)) {
			current(model);
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
			String errorInfo = "{\"info\"".concat(":").concat("\"Invalid Input.\"}");

			return errorInfo;
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
	public void updateConsumptionDetailById(@PathVariable final int id, @RequestBody  @Validated  ConsumptionDetail cd, BindingResult bindingResult) {
		if (bindingResult.hasErrors()) {
			System.out.println("xx");
			return;
		}
		consumptionDetailService.updateConsumptionDetailById(cd);
	}
}

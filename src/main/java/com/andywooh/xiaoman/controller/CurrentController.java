package com.andywooh.xiaoman.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.andywooh.xiaoman.bean.Category;
import com.andywooh.xiaoman.bean.ConsumptionDetail;
import com.google.common.collect.Lists;


@Controller
public class CurrentController extends AbstractController {
	
//	private IloginService loginService;
	
	List<ConsumptionDetail> result = Lists.newArrayList();
	@RequestMapping(value = "current/list-items", method = RequestMethod.GET)
	public String listItems(Model model) {
		Category c1 = new Category(1001, "数码");
		Category c2 = new Category(1002, "交通");
		Category c3 = new Category(1003, "其他");
		ConsumptionDetail cd1 = new ConsumptionDetail();
		ConsumptionDetail cd2 = new ConsumptionDetail();
		ConsumptionDetail cd3 = new ConsumptionDetail();
		cd1.setId(1);
		cd1.setAmount(11.1);
		cd1.setCategory(c1);
		cd1.setNote("Note1");
		cd1.setOccurDate("2013-10-23");
		cd2.setId(2);
		cd2.setAmount(60.4);
		cd2.setCategory(c2);
		cd2.setNote("Note2");
		cd2.setOccurDate("2013-10-24");
		cd3.setId(3);
		cd3.setAmount(77.2);
		cd3.setCategory(c3);
		cd3.setNote("Note3");
		cd3.setOccurDate("2013-10-25");
		result.clear();
		result.add(cd3);
		result.add(cd2);
		result.add(cd1);
		model.addAttribute("result", result);
		return "current";

	}
	
	
	@RequestMapping(value = "consumption-details/{id}", method = RequestMethod.GET)
	public void getConsumptionDetails(@PathVariable final int id, Model model) {
		model.addAttribute("cd", result.get(id));
		//return result.get(id);
	}
}
